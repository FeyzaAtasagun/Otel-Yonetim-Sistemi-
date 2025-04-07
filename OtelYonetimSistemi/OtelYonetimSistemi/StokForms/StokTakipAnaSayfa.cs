using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OtelYonetimSistemi
{
    public partial class StokTakipAnaSayfa : Form
    {
        public StokTakipAnaSayfa()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void btnUrunEkle_Click(object sender, EventArgs e)
        {
            UrunBilgisi urunBilgisiForm = new UrunBilgisi();
            urunBilgisiForm.ShowDialog();
        }

        private void btnMenu_Click(object sender, EventArgs e)
        {
            StokMenuBilgisi stokMenuBilgisiForm = new StokMenuBilgisi();
            stokMenuBilgisiForm.ShowDialog();
        }

        private void btnYemekEkle_Click(object sender, EventArgs e)
        {
            StokYemekMenu stokYemekMenuForm = new StokYemekMenu();
            stokYemekMenuForm.ShowDialog();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            AnaSayfa anaSayfa = new AnaSayfa();
            anaSayfa.ShowDialog();
        }
    }
}
