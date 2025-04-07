using System.Windows.Forms;

namespace OtelYonetimSistemi.Infrastructure
{
    public class BaseForm : Form
    {
        public void FormOpen<TForm>() where TForm : Form, new()
        {
            var form = new TForm();
            form.ShowDialog();
        }
    }
}
