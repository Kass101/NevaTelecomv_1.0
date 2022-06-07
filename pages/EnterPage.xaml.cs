using System;
using System.Collections.Generic;
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

namespace NevaTelecomv_1._0.pages
{
    /// <summary>
    /// Логика взаимодействия для EnterPage.xaml
    /// </summary>
    public partial class EnterPage : Page
    {
        public EnterPage()
        {
            InitializeComponent();
        }

        //Создание глобальных переменных 
        public static class Global
        {
            public static int manager_id;
            public static string manager_role;
            public static string title;
        }

        private void enter_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new NevaTelecom1Entities())
            {
                //если введенные данные найдены в бд, сохраняем значения в переменную, если нет то null
                var manager = db.Managers.AsNoTracking().FirstOrDefault(m => m.login == log.Text.Trim() & (m.pass == pass.Password || m.pass == text_pass.Text));

                if (manager != null)
                {
                    //заносим данные в переменные о найденном пользователе
                    Global.manager_role = manager.name_role;
                    Global.manager_id = manager.id_manager;
                    if (manager.name_role == "Технический специалист" || manager.name_role == "Руководитель технического департамента")
                        Global.title = "CRM - заявки";
                    else
                        Global.title = "Абоненты";
                    //переход на главную стр прилодения
                    Navigation.MainFrame.Navigate(new GeneralPage());
                }
                else
                    //если пользователь не найден
                    MessageBox.Show("Введите корректные данные");
            }

        }

        //обработчик события показа/скрытия пароля
        private void Show_Click(object sender, RoutedEventArgs e)
        {
            if (text_pass.Visibility == Visibility.Hidden)
            {
                text_pass.Text = pass.Password;
                text_pass.Visibility = Visibility.Visible;
                pass.Visibility = Visibility.Hidden;

            }
            else
            {
                pass.Password = text_pass.Text;
                pass.Visibility = Visibility.Visible;
                text_pass.Visibility = Visibility.Hidden;
            }
        }
    }
}