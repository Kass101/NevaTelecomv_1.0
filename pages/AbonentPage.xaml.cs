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
            BtnActiv.IsChecked = true;//кнопка активных абонентов выбрана
            
            update(); //вызов метода
        }
        // метод который позволяет обновить данные DataGrid учитывая данные введеные для поиска
        private void update()
        {
            //переменная с данными абонентов где дата расторжения null
            var _curentAbonent = NevaTelecom1Entities.GetContext().Abonents.Where(p => p.date_end == null).ToList();
            //присваиваем данные, где данные абонентав содержат введенные данные (поиск по фамилии и лицевому счету)
            _curentAbonent = _curentAbonent.Where(p => p.ls.ToLower().Contains(Tb_ls.Text.ToLower())).ToList();
            _curentAbonent = _curentAbonent.Where(p => p.fio.ToLower().Contains(Tb_fio.Text.ToLower())).ToList();
            //присваиваем списов абонентов таблице для отображения данных
            DGridAbonent.ItemsSource = _curentAbonent;
        }
        //переход на стр с подробной информацией
        private void more_Click(object sender, RoutedEventArgs e)
        {
            //передаем объект с данными с выбранной строки таблицы
            Navigation1.MainFrame1.Navigate(new pages.AbonentMore((sender as Button).DataContext as Abonent));
        }
        private void BtnActiv_Checked(object sender, RoutedEventArgs e)
        {
            //отображение в таблице активных пользователей
            DGridAbonent.ItemsSource = NevaTelecom1Entities.GetContext().Abonents.Where(p => p.date_end == null).ToList();
        }
        private void BtnUnActiv_Checked(object sender, RoutedEventArgs e)
        {
            //отображение в таблице неактивных пользователей
            DGridAbonent.ItemsSource = NevaTelecom1Entities.GetContext().Abonents.Where(p => p.date_end != null).ToList();
        }
        private void BtnAll_Checked(object sender, RoutedEventArgs e)
        {
            //отображение в таблице всех пользователей
            DGridAbonent.ItemsSource = NevaTelecom1Entities.GetContext().Abonents.ToList();
        }
        private void Btn_Add_exit_Click(object sender, RoutedEventArgs e)
        {
            //переход на страницу добавления/редактирования данных
            Navigation1.MainFrame1.Navigate(new pages.AddEditAbonent(null));//передаем пустой объект
        }
        //обработчик события при вводе информации в поле поиск по фамилии
        private void Tb_fio_SelectionChanged(object sender, RoutedEventArgs e)
        {
            update();
        }
        //обработчик события при вводе информации в поле поиск по личному счету
        private void Tb_ls_SelectionChanged(object sender, RoutedEventArgs e)
        {
            update();
        }
        //кнопка редактирования данных
        private void edit_Click(object sender, RoutedEventArgs e)
        {
            //получаем объект данных выбранной строки таблицы
            Abonent _currentAbonent = (sender as Button).DataContext as Abonent;
            //если договор расторгнут то редактирование запрещено
            if (_currentAbonent.date_end != null)
            {
                MessageBox.Show("Договор расторгнут \nНельзя вносить изменения");
            }
            //инае переход на страницу добавления/редактирования данных передаем
            else
                Navigation1.MainFrame1.Navigate(new pages.AddEditAbonent((sender as Button).DataContext as Abonent));
        }
        //Если видимость страницы isVisible, мы будем обращаться к контексту с помощью свойства ChangeTracker ко всем сущностям, которые есть. И для каждой из них будем выполнять метод перезагрузки и вывода актуальных данных.
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