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
            //если переданный объект не пустой, значит происходит редактирование
            if (selectedOrder != null)
            {
                //присваиваем _curentOrder переданные данные
                _curentOrder = selectedOrder;
                //находим абонента который прошел проверку
                var abonent = NevaTelecom1Entities.GetContext().Abonents.FirstOrDefault(p => p.id_abon == _curentOrder.id_abon);
                //присваиваем значения в textbox о абоненте
                fio.Text = " " + abonent.fio;
                ab_num.Text = " " + abonent.number;
                ls.Text = " " + abonent.ls;
                GeneralPage.Global.id_abonenta = abonent.id_abon;

                //отключаем поля которые не нужно редактировать
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
                //находим абонента который прошел проверку
                var abonent = NevaTelecom1Entities.GetContext().Abonents.FirstOrDefault(p => p.id_abon == GeneralPage.Global.id_abonenta);
                //присваиваем значения в textbox о абоненте
                fio.Text = " " + abonent.fio;
                ab_num.Text = " " + abonent.number;
                //формирование номера заявки
                num_order.Text = abonent.ls + "/" + DateTime.Now.ToShortDateString() + "/" + DateTime.Now.ToShortTimeString(); ;
                data_create.Text = " " + DateTime.Now.ToShortDateString();
                ls.Text = " " + abonent.ls;
            }
            //привязываем полученные данные с полями
            DataContext = _curentOrder;
            //задаем значения для выпадающих списков
            CbServ.ItemsSource = NevaTelecom1Entities.GetContext().Servis.ToList();
            CbVidServ.ItemsSource = NevaTelecom1Entities.GetContext().VidServis.ToList();
            CbStatus.ItemsSource = NevaTelecom1Entities.GetContext().Status.ToList();
            CbTypeProblem.ItemsSource = NevaTelecom1Entities.GetContext().TypeProblems.ToList();
            //отображаем только технических специалистов
            CbManager.ItemsSource = NevaTelecom1Entities.GetContext().Managers.Where(p => p.name_role == "Технический специалист").ToList();

        }
        private void CbVidServ_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //получаем текст из выпадающего списка (вид услуги)
            GeneralPage.Global.vid_serv = CbVidServ.Text;
        }

        private void refrash_Click(object sender, RoutedEventArgs e)
        {
            //получаем текст из выпадающего списка (вид услуги)
            GeneralPage.Global.vid_serv = CbVidServ.Text;
            //отображаем данные выпадающего списка типов услуг в зависимости от вида
            CbTypeServ.ItemsSource = NevaTelecom1Entities.GetContext().TypeServis.Where(p => p.name_vid == GeneralPage.Global.vid_serv).ToList();
        }
        //обработчик при нажатии на кнопку сохранить
        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            //контейнер ошибок
            StringBuilder error = new StringBuilder();
            //присваиваем данные
            _curentOrder.num_order = num_order.Text;
            //получение сегодняшней даты
            _curentOrder.data_create = DateTime.Now;
            _curentOrder.id_abon = GeneralPage.Global.id_abonenta;

            //проверка данных (если не введены)
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

            //если в контейнере есть ошибки то выводим их
            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString());
                return;
            }

            //добавляем данные объекта в таблицу бд
            if (_curentOrder.id_order == 0)
                NevaTelecom1Entities.GetContext().Orders.Add(_curentOrder);
            //конструктор для отлавливания системных ошибок (не было сбоя системы)
            try
            {
                //сохраняем изменения
                NevaTelecom1Entities.GetContext().SaveChanges();
                //преход на стр с заявками
                Navigation1.MainFrame1.Navigate(new CRMPage());
                MessageBox.Show("Заявка сохранена");
            }
            catch (Exception ex)
            {
                //вывод системных ошибок
                MessageBox.Show(ex.ToString());
            }
        }
    }
}