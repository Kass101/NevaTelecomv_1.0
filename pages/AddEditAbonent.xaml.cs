using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для AddEditAbonent.xaml
    /// </summary>
    public partial class AddEditAbonent : Page
    {
        private Abonent _currentAbonent = new Abonent();
        public AddEditAbonent(Abonent selectedAbonent)
        {
            InitializeComponent();
            if (selectedAbonent != null)
            {
                _currentAbonent = selectedAbonent;
                gen_num.Visibility = Visibility.Hidden;
            }
            if (selectedAbonent == null)
            {
                date_dogovor.Text = DateTime.Now.ToShortDateString();
                _currentAbonent.date_dogovor = DateTime.Now;
            }    

            DataContext = _currentAbonent;
            Cb_gender.ItemsSource = NevaTelecom1Entities.GetContext().Genders.ToList();
            Cb_dogovortype.ItemsSource = NevaTelecom1Entities.GetContext().DogovorTypes.ToList();
            Cb_dogovortype.ItemsSource = NevaTelecom1Entities.GetContext().DogovorTypes.ToList();
            Cb_oborud.ItemsSource = NevaTelecom1Entities.GetContext().Oboruds.ToList();
        }

        private void Btn_save_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentAbonent.number) )
                errors.AppendLine("Введите № абонента");             

            if (string.IsNullOrWhiteSpace(_currentAbonent.fio) || Regex.Match(_currentAbonent.fio, "[0-9]").Success)
                errors.AppendLine("Введите ФИО абонента");

            if (_currentAbonent.Gender1 == null)
                errors.AppendLine("Выберите пол");

            if (_currentAbonent.birth == null)
                errors.AppendLine("Выберите дату рождения");

            if (string.IsNullOrWhiteSpace(_currentAbonent.phone) || _currentAbonent.phone.Length != 11 ||
                Regex.Match(_currentAbonent.phone, "[А-Я]").Success || Regex.Match(_currentAbonent.phone, "[а-я]").Success ||
                Regex.Match(_currentAbonent.phone, "[a-z]").Success || Regex.Match(_currentAbonent.phone, "[A-Z]").Success)
                errors.AppendLine("Введите номер телефона абонента");

            if(string.IsNullOrWhiteSpace(_currentAbonent.email) || (Regex.Match(_currentAbonent.email, "[@]").Success != true))
                errors.AppendLine("Введите email");

            if (string.IsNullOrWhiteSpace(_currentAbonent.address_reg))
                errors.AppendLine("Введите адрес регистрации");


            if (string.IsNullOrWhiteSpace(_currentAbonent.address_live))
                errors.AppendLine("Введите адрес жительства");

            if (string.IsNullOrWhiteSpace(_currentAbonent.pasport) || _currentAbonent.pasport.Length != 11 ||
                Regex.Match(_currentAbonent.pasport, "[А-Я]").Success || Regex.Match(_currentAbonent.pasport, "[а-я]").Success ||
                Regex.Match(_currentAbonent.pasport, "[a-z]").Success || Regex.Match(_currentAbonent.pasport, "[A-Z]").Success)
                errors.AppendLine("Введите номер (4) и серия (6) через пробел");

            if (string.IsNullOrWhiteSpace(_currentAbonent.code_otdel) || _currentAbonent.code_otdel.Length != 7 ||
                Regex.Match(_currentAbonent.code_otdel, "[А-Я]").Success || Regex.Match(_currentAbonent.code_otdel, "[а-я]").Success ||
                Regex.Match(_currentAbonent.code_otdel, "[a-z]").Success || Regex.Match(_currentAbonent.code_otdel, "[A-Z]").Success)
                errors.AppendLine("Введите код подразделения (ххх-ххх)");

            if (string.IsNullOrWhiteSpace(_currentAbonent.department))
                errors.AppendLine("Введите кем выдан паспорт");

            if (_currentAbonent.date_issue == null)
                errors.AppendLine("Выберите дату выдачи паспорта");

            if (string.IsNullOrWhiteSpace(_currentAbonent.num_dogovor))
                errors.AppendLine("Сформируйте номер договора");

            if (_currentAbonent.date_dogovor == null)
                errors.AppendLine("Введите дату создания договора");
            
            if (_currentAbonent.DogovorType == null)
                errors.AppendLine("Выберите тип договора");

            if (string.IsNullOrWhiteSpace(_currentAbonent.ls) ||
                Regex.Match(_currentAbonent.ls, "[А-Я]").Success || Regex.Match(_currentAbonent.ls, "[а-я]").Success ||
                Regex.Match(_currentAbonent.ls, "[a-z]").Success || Regex.Match(_currentAbonent.ls, "[A-Z]").Success)
                errors.AppendLine("Введите личный счет");

            if (string.IsNullOrWhiteSpace(_currentAbonent.servis))
                errors.AppendLine("Введите услуги (Интернет, ТВ, Видеонаблюдение)");

            if (_currentAbonent.Oborud == null)
                errors.AppendLine("Выберите № оборудования");

            if (string.IsNullOrWhiteSpace(_currentAbonent.pass))
                errors.AppendLine("Введите пароль");

            _currentAbonent.name_role = "Пользователь";
            
            if (date_end.SelectedDate != null)
            {
                if (string.IsNullOrWhiteSpace(_currentAbonent.reason_end))
                    errors.AppendLine("Введите причину расторжения");
            }


                if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentAbonent.id_abon == 0)
            {
                NevaTelecom1Entities.GetContext().Abonents.Add(_currentAbonent);
            }
                
            try
            {
                NevaTelecom1Entities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены");
                Navigation1.MainFrame1.Navigate(new pages.AbonentPage());
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void Btn_back_Click(object sender, RoutedEventArgs e)
        {
            Navigation1.MainFrame1.Navigate(new pages.AbonentPage());
        }

        private void gen_num_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(_currentAbonent.number))
                MessageBox.Show("Введите номер абонента");
            else
            {
                dogovor.Text = _currentAbonent.number + "-" + DateTime.Now.Month.ToString() + " - " + DateTime.Now.Year.ToString();
                _currentAbonent.num_dogovor = dogovor.Text;
            }
        }
    }
}
