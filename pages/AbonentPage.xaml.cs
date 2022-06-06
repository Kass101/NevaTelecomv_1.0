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
    /// Логика взаимодействия для AbonentPage.xaml
    /// </summary>
    public partial class AbonentPage : Page
    {
        public AbonentPage()
        {
            InitializeComponent();
            BtnActiv.IsChecked = true;

            //DGridAbonent.ItemsSource = NevaTelecom1Entities.GetContext().Abonents.Where(p => p.date_end == null).ToList();
            update();
        }

        private void update()
        {
            var _curentAbonent = NevaTelecom1Entities.GetContext().Abonents.Where(p => p.date_end == null).ToList();

            _curentAbonent = _curentAbonent.Where(p => p.ls.ToLower().Contains(Tb_ls.Text.ToLower())).ToList();
            _curentAbonent = _curentAbonent.Where(p => p.fio.ToLower().Contains(Tb_fio.Text.ToLower())).ToList();

            DGridAbonent.ItemsSource = _curentAbonent;

        }

        private void more_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new pages.AbonentMore((sender as Button).DataContext as Abonent));
        }

        private void BtnActiv_Checked(object sender, RoutedEventArgs e)
        {
            DGridAbonent.ItemsSource = NevaTelecom1Entities.GetContext().Abonents.Where(p => p.date_end == null).ToList();

        }

        private void BtnUnActiv_Checked(object sender, RoutedEventArgs e)
        {
            DGridAbonent.ItemsSource = NevaTelecom1Entities.GetContext().Abonents.Where(p => p.date_end != null).ToList();
        }

        private void BtnAll_Checked(object sender, RoutedEventArgs e)
        {
            DGridAbonent.ItemsSource = NevaTelecom1Entities.GetContext().Abonents.ToList();
        }

        private void Btn_Add_exit_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new pages.AddEditAbonent(null));
        }

        private void Tb_fio_SelectionChanged(object sender, RoutedEventArgs e)
        {
            update();
        }

        private void Tb_ls_SelectionChanged(object sender, RoutedEventArgs e)
        {
            update();
        }

        private void edit_Click(object sender, RoutedEventArgs e)
        {
            Abonent _currentAbonent = (sender as Button).DataContext as Abonent;

            if (_currentAbonent.date_end != null)
            {
                MessageBox.Show("Договор расторгнут \nНельзя вносить изменения");
            }
            else
                Navigation1.MainFrame1.Navigate(new pages.AddEditAbonent((sender as Button).DataContext as Abonent));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                NevaTelecom1Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                update();
            }
        }
    }
}