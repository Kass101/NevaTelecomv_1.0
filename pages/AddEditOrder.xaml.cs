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
    /// Логика взаимодействия для AddEditOrder.xaml
    /// </summary>
    public partial class AddEditOrder : Page
    {
        private Order _curentOrder = new Order();
        public AddEditOrder(Order selectedOrder)
        {
            InitializeComponent();
            if (selectedOrder != null)
            {
                _curentOrder = selectedOrder;
                var abonent = NevaTelecom1Entities.GetContext().Abonents.FirstOrDefault(p => p.id_abon == _curentOrder.id_abon);
                fio.Text = " " + abonent.fio;
                ab_num.Text = " " + abonent.number;
                ls.Text = " " + abonent.ls;
                GeneralPage.Global.id_abonenta = abonent.id_abon;
                CbServ.IsEnabled = false;
                CbVidServ.IsEnabled = false;
                CbTypeServ.IsEnabled = false;
                CbTypeProblem.IsEnabled = false;
                if(_curentOrder.date_end != null)
                {
                    CbStatus.IsEnabled = false;
                    describe.IsEnabled = false;
                    CbManager.IsEnabled = false;
                }
                   
            }


            if (selectedOrder == null)
            {
                var abonent = NevaTelecom1Entities.GetContext().Abonents.FirstOrDefault(p => p.id_abon == GeneralPage.Global.id_abonenta);
                fio.Text = " " + abonent.fio;
                ab_num.Text = " " + abonent.number;
                num_order.Text = abonent.ls + "/" + DateTime.Now.ToShortDateString();
                data_create.Text = " " + DateTime.Now.ToShortDateString();
                ls.Text = " " + abonent.ls;
            }

            DataContext = _curentOrder;

            CbServ.ItemsSource = NevaTelecom1Entities.GetContext().Servis.ToList();
            CbVidServ.ItemsSource = NevaTelecom1Entities.GetContext().VidServis.ToList();
            CbStatus.ItemsSource = NevaTelecom1Entities.GetContext().Status.ToList();
            CbManager.ItemsSource = NevaTelecom1Entities.GetContext().Managers.Where(p => p.name_role == "Технический специалист").ToList();
            CbTypeProblem.ItemsSource = NevaTelecom1Entities.GetContext().TypeProblems.ToList();

        }

        private void CbVidServ_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GeneralPage.Global.vid_serv = CbVidServ.Text;
        }

        private void refrash_Click(object sender, RoutedEventArgs e)
        {
            GeneralPage.Global.vid_serv = CbVidServ.Text;
            CbTypeServ.ItemsSource = NevaTelecom1Entities.GetContext().TypeServis.Where(p => p.name_vid == GeneralPage.Global.vid_serv).ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder error = new StringBuilder();
            _curentOrder.num_order = num_order.Text;
            _curentOrder.data_create = DateTime.Now;
            _curentOrder.id_abon = GeneralPage.Global.id_abonenta;

            if (_curentOrder.Servi == null)
                error.AppendLine("Выбeрите услугу");

            if (_curentOrder.VidServi == null)
                error.AppendLine("Выбeрите вид услуги");

            if (_curentOrder.TypeServi == null)
                error.AppendLine("Выбeрите тип услуги");

            if (_curentOrder.Status == null)
                error.AppendLine("Выбeрите статус заявки");

            if (_curentOrder.TypeProblem == null)
                error.AppendLine("Выбeрите тип проблемы");

            if (_curentOrder.Manager == null)
                error.AppendLine("Выбeрите сотрудника");

            if (CbStatus.SelectedIndex == 0)
            {
                date_end.Text = DateTime.Now.ToShortDateString();
                _curentOrder.date_end = DateTime.Now;

            }
            if (CbStatus.SelectedIndex != 0)
            {
                _curentOrder.date_end = null;
                date_end.Text = null;
            }


            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString());
                return;
            }

            if (_curentOrder.id_order == 0)
                NevaTelecom1Entities.GetContext().Orders.Add(_curentOrder);

            try
            {
                NevaTelecom1Entities.GetContext().SaveChanges();
                Navigation1.MainFrame1.Navigate(new CRMPage());
                MessageBox.Show("Заявка сохранена");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}