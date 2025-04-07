using OtelYonetimSistemi.Database;
using OtelYonetimSistemi.PersonelForms;
using System;
using System.Windows.Forms;

namespace OtelYonetimSistemi
{
    public partial class AnaSayfa : Form
    {
        public AnaSayfa()
        {
            InitializeComponent();
        }

        OtelYonetimiDbEntities db = new OtelYonetimiDbEntities();

        private void btnRezervasyonKayıt_Click(object sender, EventArgs e)
        {
            RezervasyonKatlar rezervasyonKatlarFormu = new RezervasyonKatlar();
            rezervasyonKatlarFormu.ShowDialog();
        }

        private void btnMusteriKayıt_Click(object sender, EventArgs e)
        {
            //FormOpen<Personel>();
            //var rule = new ReservationRules();
            //var message = rule.SaveReservation(new Misafirs(), new Odalar(), 5);

            //MessageBox.Show(message);     

            MusteriKayit musteriKayitFormu = new MusteriKayit();
            musteriKayitFormu.ShowDialog();
        }

        private void btnStokTakip_Click(object sender, EventArgs e)
        {
            StokTakipAnaSayfa stokTakipAnaSayfaFormu = new StokTakipAnaSayfa();
            stokTakipAnaSayfaFormu.ShowDialog();
        }

        private void btnPersonelTakip_Click(object sender, EventArgs e)
        {
            PersonelAnaSayfa personelAnaSayfaFormu = new PersonelAnaSayfa();
            personelAnaSayfaFormu.ShowDialog();
        }

        private void AnaSayfa_Load(object sender, EventArgs e)
        {

        }
    }
}
