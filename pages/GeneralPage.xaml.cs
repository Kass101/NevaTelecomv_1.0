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
    /// Логика взаимодействия для GeneralPage.xaml
    /// </summary>
    public partial class GeneralPage : Page
    {
        public GeneralPage()
        {
            InitializeComponent();
            Navigation1.MainFrame1 = MainFrame1;
            //Разграничение ролей, в зависимости от роли доступны те или иные кнопки
            if (EnterPage.Global.manager_role == "Технический специалист" || EnterPage.Global.manager_role == "Руководитель технического департамента")
            {
                //скрытие кнопок
                Btn_abonent.IsEnabled = false;
                Btn_doc.IsEnabled = false;
                //присваиваем заголовок
                Title.Text = EnterPage.Global.title;
                //отображение страницы при переходе на главую стр
                MainFrame1.Navigate(new pages.CRMPage());
            }
            else
            {
                Title.Text = EnterPage.Global.title;
                MainFrame1.Navigate(new pages.AbonentPage());
            }
            
            //задаем коллекцию данных в блок события, в зависимости от роли сотрудника
            LvTask.ItemsSource = NevaTelecom1Entities.GetContext().Tasks.Where(p => p.name_role == EnterPage.Global.manager_role).ToList();
        }
        public static class Global
        {
            public static string role;
            public static string title;
            public static int id_abonenta;
            public static string vid_serv;
        }
        //переход на стр документы
        private void Btn_doc_Click(object sender, RoutedEventArgs e)
        {
            MainFrame1.Navigate(new pages.DocumentPage());
            Title.Text = "Документы";
        }
        //переход на стр работа с сзаявками
        private void Btn_CRM_Click(object sender, RoutedEventArgs e)
        {
            MainFrame1.Navigate(new pages.CRMPage());
            Title.Text = "CRM - заявки";
        }
        //переход на стр абонентов
        private void Btn_abonent_Click(object sender, RoutedEventArgs e)
        {
            MainFrame1.Navigate(new pages.AbonentPage());
            Title.Text = "Абоненты";
        }
        //переход на стр входа
        private void Btn_exit_Click(object sender, RoutedEventArgs e)
        {
            //всплывающее окно (предупреждение)
            if (MessageBox.Show($"Вы действительно хотите выйти из системы", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                Navigation.MainFrame.Navigate(new EnterPage());
            }
        }
    }
}
