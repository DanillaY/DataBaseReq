using DataBaseReq.Pages;
using System.Windows;

namespace DataBaseReq
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            FrameManager.frame = FrameObj;
            FrameObj.Navigate(new MainPage());
        }
    }
}
