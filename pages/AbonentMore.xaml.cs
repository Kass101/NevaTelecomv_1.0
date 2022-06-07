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
    /// Логика взаимодействия для AbonentMore.xaml
    /// </summary>
    public partial class AbonentMore : Page
    {
        public Abonent _abonent = new Abonent();
        public AbonentMore(Abonent selectedAbonent)
        {
            InitializeComponent();
            //если переданный объект не пустой, значит происходит редактирование
            if (selectedAbonent != null)
                //привязываем полученные данные с полями
                _abonent = selectedAbonent;

            //привязываем полученные данные с полями
            DataContext = _abonent;

            //условие если дата расторжения договора пустая
            if (_abonent.date_end == null)
            {
                //скрываем данные о дате расторжения и причине
                DogovorDateEnd.Visibility = Visibility.Hidden;
                DogovorReasonEnd.Visibility = Visibility.Hidden;
            }
        }
    }
}
