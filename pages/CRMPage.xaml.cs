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
    /// Логика взаимодействия для CRMPage.xaml
    /// </summary>
    public partial class CRMPage : Page
    {
        public CRMPage()
        {
            InitializeComponent();
            //разграничение ролей
            if (EnterPage.Global.manager_role == "Технический специалист")
            {
                //отображаем заявки пренадлежащие определенному тех. спец.
                DGOrder.ItemsSource = NevaTelecom1Entities.GetContext().Orders.Where(p => p.id_manager == EnterPage.Global.manager_id).ToList();
                //скрываем кнопки (ограничиваем права)
                AddOrder.Visibility = Visibility.Hidden;
                edit.Visibility = Visibility.Hidden;
            }             
            else
            {
                DGOrder.ItemsSource = NevaTelecom1Entities.GetContext().Orders.ToList();
                //скрываем кнопки (ограничиваем права)
                if (EnterPage.Global.manager_role == "Руководитель технического департамента")
                {
                    AddOrder.Visibility = Visibility.Hidden;
                    edit.Visibility = Visibility.Hidden;
                }
            }
                
        }
        //переход на стр проверки абонента в системе
        private void AddOrder_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new CheckAbonent());
        }
        //переход на стр редактирования заявки
        private void edit_Click(object sender, RoutedEventArgs e)
        {
            //передаем значения в видео объекта, хранящиеся в выбранной записи таблицы
            Navigation1.MainFrame1.Navigate(new AddEditOrder((sender as Button).DataContext as Order));
        }
        //преход на стр с подробной информацией о заявки
        private void more_Click(object sender, RoutedEventArgs e)
        {
            //передаем значения в видео объекта, хранящиеся в выбранной записи таблицы
            Navigation1.MainFrame1.Navigate(new OrderMore((sender as Button).DataContext as Order));
        }
        //Если видимость страницы isVisible, мы будем обращаться к контексту с помощью свойства ChangeTracker
        //ко всем сущностям, которые есть. И для каждой из них будем выполнять метод перезагрузки и вывода
        //актуальных данных.
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                NevaTelecom1Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            }
        }
    }
}