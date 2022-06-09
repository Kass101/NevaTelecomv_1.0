using System;
using System.Collections.Generic;
using System.IO;
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
using Microsoft.Win32;


namespace NevaTelecomv_1._0.pages
{
    /// <summary>
    /// Логика взаимодействия для DocumentPage.xaml
    /// </summary>
    public partial class DocumentPage : Page
    {
        public DocumentPage()
        {
            InitializeComponent();
        }
        private void save_ButonClick(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.SaveFileDialog save = new Microsoft.Win32.SaveFileDialog();
            save.Filter =
                "Файл RTF-файл (*.rtf)|*.rtf";

            if (save.ShowDialog() == true)
            {
                // Создание контейнера TextRange для всего документа
                TextRange documentTextRange = new TextRange(
                    richTextBox.Document.ContentStart, richTextBox.Document.ContentEnd);

                // Если такой файл существует, он перезаписывается, 
                using (FileStream fs = File.Create(save.FileName))
                {
                    if (System.IO.Path.GetExtension(save.FileName).ToLower() == ".rtf")
                    {
                        documentTextRange.Save(fs, DataFormats.Rtf);
                    }
                    else
                    {
                        documentTextRange.Save(fs, DataFormats.Xaml);
                    }
                }
            }
        }
        private void open_ButonClick(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFile =
                new Microsoft.Win32.OpenFileDialog();

            openFile.Filter = "RichText files (*.rtf)|*.rtf|All files (*.*)|*.*";
            if (openFile.ShowDialog() == true)
            {
                TextRange tr = new TextRange(
                    richTextBox.Document.ContentStart, richTextBox.Document.ContentEnd);

                using (FileStream fs = File.Open(openFile.FileName, FileMode.Open))
                {
                    tr.Load(fs, DataFormats.Rtf);
                }
            }
            // Копирование содержимого документа в MemoryStream. 
            using (MemoryStream stream = new MemoryStream())
            {
                TextRange range = new TextRange(richTextBox.Document.ContentStart,
                    richTextBox.Document.ContentEnd);
                range.Save(stream, DataFormats.Xaml);
                stream.Position = 0;
            }
        }
        private void new_ButonClick(object sender, RoutedEventArgs e)
        {
            richTextBox.Document = new FlowDocument();
        }
        private void print_ButonClick(object sender, RoutedEventArgs e)
        {
            PrintDialog pd = new PrintDialog();
            if ((pd.ShowDialog() == true))
            {
                //use either one of the below
                pd.PrintVisual(richTextBox as Visual, "printing as visual");
                pd.PrintDocument((((IDocumentPaginatorSource)richTextBox.Document).DocumentPaginator), "printing as paginator");
            }
        }
    }
}