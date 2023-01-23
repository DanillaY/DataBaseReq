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
    /// Логика взаимодействия для AddUserPage.xaml
    /// </summary>
    public partial class AddUserPage : Page
    {
        private SqlConnection dbConnect = new SqlConnection("Server=localhost;Database=PassControl;Trusted_Connection=True;Encrypt=false;");
        public AddUserPage()
        {
            InitializeComponent();
            dbConnect.Open();
            SqlDataReader reader = new SqlCommand("SELECT Role FROM Users", dbConnect).ExecuteReader();
            
            dbConnect.Close();
        }
    }
}
