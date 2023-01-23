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
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        private SqlConnection dbConnect = new SqlConnection("Server=localhost;Database=PassControl;Trusted_Connection=True;Encrypt=false;");
        public UserPage(User user)
        {
            InitializeComponent();
            HelloTextBlock.Text += user.FirstName;
            dbConnect.Open();
            SqlDataReader reader = new SqlCommand("SELECT UserID,PassTimeEnter FROM UsersPass", dbConnect).ExecuteReader();
            while (reader.Read())
                if (int.Parse(reader[0].ToString()) == user.ID)
                    EntryHistoryTextBlock.Text = reader[1].ToString()+"\n";
            dbConnect.Close();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if(FrameManager.frame.CanGoBack)
                FrameManager.frame.GoBack(); 
        }
    }
}
