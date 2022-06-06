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
    /// Логика взаимодействия для OrderMore.xaml
    /// </summary>
    public partial class OrderMore : Page
    {
        private Order _curentOrder = new Order();
        public OrderMore(Order selectedOrder)
        {
            InitializeComponent();
            if (selectedOrder != null)
                _curentOrder = selectedOrder;

            DataContext = _curentOrder;
            
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new CRMPage());
        }
    }
}
