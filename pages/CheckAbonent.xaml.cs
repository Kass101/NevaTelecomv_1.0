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
    /// Логика взаимодействия для CheckAbonent.xaml
    /// </summary>
    public partial class CheckAbonent : Page
    {
        public CheckAbonent()
        {
            InitializeComponent();
        }
        private void BtnCheckOrder_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new NevaTelecom1Entities())
            {
                var abonent = db.Abonents.AsNoTracking().FirstOrDefault(p => p.phone == phone.Text && fio.Text == p.fio);

                if (abonent != null)
                {
                    GeneralPage.Global.id_abonenta = abonent.id_abon;
                    Navigation1.MainFrame1.Navigate(new AddEditOrder(null));
                }
                else
                    MessageBox.Show("Абонент не найден");
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new CRMPage());
        }
    }
}