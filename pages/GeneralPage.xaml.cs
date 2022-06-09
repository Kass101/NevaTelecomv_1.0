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
                Btn_abonent.IsEnabled = false;//скрытие кнопок
                Btn_doc.IsEnabled = false;
                Title.Text = EnterPage.Global.title;//отображаем переменную в заголовке
                MainFrame1.Navigate(new pages.CRMPage());//отображение страницы при переходе на главую стр
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
        private void Btn_doc_Click(object sender, RoutedEventArgs e)
        {
            MainFrame1.Navigate(new pages.DocumentPage());//переход на стр документы
            Title.Text = "Документы";
        }
        private void Btn_CRM_Click(object sender, RoutedEventArgs e)
        {
            MainFrame1.Navigate(new pages.CRMPage()); //переход на стр работа с сзаявками
            Title.Text = "CRM - заявки";
        } 
        private void Btn_abonent_Click(object sender, RoutedEventArgs e)
        {
            MainFrame1.Navigate(new pages.AbonentPage()); //переход на стр абонентов
            Title.Text = "Абоненты";
        }
        private void Btn_exit_Click(object sender, RoutedEventArgs e)
        {
            //всплывающее окно (предупреждение)
            if (MessageBox.Show($"Вы действительно хотите выйти из системы", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                Navigation.MainFrame.Navigate(new EnterPage());//переход на стр входа
            }
        }
    }
}
