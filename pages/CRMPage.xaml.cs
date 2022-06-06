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
            if (EnterPage.Global.manager_role == "Технический специалист")
            {
                DGOrder.ItemsSource = NevaTelecom1Entities.GetContext().Orders.Where(p => p.id_manager == EnterPage.Global.manager_id).ToList();
                AddOrder.Visibility = Visibility.Hidden;
                edit.Visibility = Visibility.Hidden;
            }             
            else
            {
                DGOrder.ItemsSource = NevaTelecom1Entities.GetContext().Orders.ToList();
                if (EnterPage.Global.manager_role == "Руководитель технического департамента")
                {
                    AddOrder.Visibility = Visibility.Hidden;
                    edit.Visibility = Visibility.Hidden;
                }
            }
                
        }

        private void AddOrder_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new CheckAbonent());
        }

        private void edit_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new AddEditOrder((sender as Button).DataContext as Order));
        }

        private void more_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new OrderMore((sender as Button).DataContext as Order));
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                NevaTelecom1Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            }
        }
    }
}