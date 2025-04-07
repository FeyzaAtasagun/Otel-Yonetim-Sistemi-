using OtelYonetimSistemi.MusterilerveRezervasyon;
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
    public partial class RezervasyonKatlar : Form
    {
        public RezervasyonKatlar()
        {
            InitializeComponent();
        }

        private void OpenForm2(object sender, EventArgs e)
        {
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        
        private void pictureBox3_Click(object sender, EventArgs e)
        {

        }

        private void RezervasyonKatlar_Load(object sender, EventArgs e)
        {
            
        }
        private void OdaButon_Click(object sender, EventArgs e)
        {
        }

        private void btn1Kat_Click(object sender, EventArgs e)
        {
            RezervasyonOdalar odalarFormu = new RezervasyonOdalar(1);
            odalarFormu.Show();
        }
        private void btn2Kat_Click(object sender, EventArgs e)
        {
            RezervasyonOdalar odalarFormu = new RezervasyonOdalar(2);
            odalarFormu.Show();
        }

        private void btn3Kat_Click(object sender, EventArgs e)
        {
            RezervasyonOdalar odalarFormu = new RezervasyonOdalar(3);
            odalarFormu.Show();
        }

        private void btn4Kat_Click(object sender, EventArgs e)
        {
            RezervasyonOdalar odalarFormu = new RezervasyonOdalar(4);
            odalarFormu.Show();
        }

        private void btn5Kat_Click(object sender, EventArgs e)
        {
            RezervasyonOdalar odalarFormu = new RezervasyonOdalar(5);
            odalarFormu.Show();
        }

        private void btn6Kat_Click(object sender, EventArgs e)
        {
            RezervasyonOdalar odalarFormu = new RezervasyonOdalar(6);
            odalarFormu.Show();
        }

        private void btn7Kat_Click(object sender, EventArgs e)
        {
            RezervasyonOdalar odalarFormu = new RezervasyonOdalar(7);
            odalarFormu.Show();
        }

        private void btn8Kat_Click(object sender, EventArgs e)
        {

            RezervasyonOdalar odalarFormu = new RezervasyonOdalar(8);
            odalarFormu.Show();
        }
    }



}
