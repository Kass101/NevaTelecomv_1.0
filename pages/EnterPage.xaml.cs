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
            //присваиваем значение глобальной переменной
            Global.codes = null;
        }
        //Создание глобальных переменных 
        public static class Global
        {
            public static int manager_id;
            public static string manager_role;
            public static string title;
            public static string codes;
        }
        //метод генерации кода 
        private void gencode()
        {
            Random random = new Random();
            Global.codes = random.Next(1000, 9999).ToString();
            //вывод сообщения с кодом
            MessageBox.Show("Ваш код: " + Global.codes);
        }
        private void btnCode_Click(object sender, RoutedEventArgs e)
        {
            gencode(); //вызов метода генерации кода
        }
        private void enter_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new NevaTelecom1Entities())
            {
                // поиск совпадений введенного логина и логинов в БД
                var login = db.Managers.AsNoTracking().FirstOrDefault(m => m.login == log.Text.Trim());
                // поиск совпадений введенного логина и логинов в БД, а так же паролей
                var manager = db.Managers.AsNoTracking().FirstOrDefault(m => m.login == log.Text.Trim() & (m.pass == pass.Password || m.pass == text_pass.Text));

                if (login != null)
                {
                    // делаем кнопки активными
                    Show.IsEnabled = true; 
                    pass.IsEnabled = true;
                    text_pass.IsEnabled = true;
                }
                else
                {
                    // блокируем кнопки
                    MessageBox.Show("Логин неверный");
                    Show.IsEnabled = false;
                    pass.IsEnabled = false;
                    text_pass.IsEnabled = false;
                    code.IsEnabled = false;
                    pass.IsEnabled = false;
                    btnCode.IsEnabled = false;
                    Global.codes = null;
                }
                if (manager != null && Global.codes == null)
                {
                    code.IsEnabled = true;
                    pass.IsEnabled = true;
                    btnCode.IsEnabled = true;
                    gencode();
                }    
                else if (login != null && manager == null)
                {
                    MessageBox.Show("Пароль неверный");
                    Global.codes = null;
                }
                if (Global.codes != null)
                {
                    if (Global.codes == code.Text & manager != null)
                    {
                        //заносим данные пользователя глобальную переменную в переменную
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
                        MessageBox.Show("Код не верный");
                }
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