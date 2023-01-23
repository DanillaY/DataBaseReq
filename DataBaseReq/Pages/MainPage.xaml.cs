using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DataBaseReq.Pages
{
    public partial class MainPage : Page
    {
        private SqlConnection dbConnect = new SqlConnection("Server=localhost;Database=PassControl;Trusted_Connection=True;Encrypt=false;");
        public MainPage()
        {
            InitializeComponent();
        }
        /// <summary>
        /// Переменная mode отвечает за направление по страницам в зависимости от роли пользователя. 1 - секретарь,пользователь 2 - Системный администратор.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            dbConnect.Open();
            SqlDataReader reader = new SqlCommand("SELECT Role,FirstName,SecondName,Password,ID FROM Users", dbConnect).ExecuteReader();
            
            while (reader.Read())
            {
                if (ValidateUser(reader,1))
                    FrameManager.frame.Navigate(new UserPage(CreateNewUser(reader)));
                if (ValidateUser(reader, 2))
                    FrameManager.frame.Navigate(new AdminPage(CreateNewUser(reader)));
            }
            dbConnect.Close();
        }
        private bool ValidateUser(SqlDataReader reader, int mode) => ((string)reader[3] == PassTextBox.Text && (string)reader[2] == SecondNameTextBox.Text 
            && (mode == 1? (string)reader[0] == "Пользователь" || (string)reader[0] == "Секретарь": (string)reader[0] == "Системный администратор"));
        private static User CreateNewUser(SqlDataReader reader) => new User((string)reader[0], (string)reader[1], (string)reader[2], int.Parse(reader[4].ToString()));

    }
}
