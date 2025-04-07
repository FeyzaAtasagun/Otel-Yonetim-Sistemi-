using OtelYonetimSistemi.Database;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OtelYonetimSistemi.MusterilerveRezervasyon
{
    public partial class RezervasyonOdalar : Form
    {
        private int katNo;

        // Formun yapıcısı
        public RezervasyonOdalar(int katNo)
        {
            InitializeComponent();
            this.katNo = katNo;  // Kat numarasını alıyoruz
        }


        private void RezervasyonOdalar_Load(object sender, EventArgs e)
        {
            OdaButonlariniDoldur();  // Oda butonlarını yükle
        }


        public string GetOdaTuru( string odaNumarasi)
        {
            using (var context = new OtelYonetimiDbEntities()) // OtelEntities EDMX modelinizin adı olabilir
            {
                // OdaNumarasi'na göre Oda bilgilerini alıyoruz
                var oda = context.Odalar.FirstOrDefault(o => o.OdaNumarasi == odaNumarasi);
                return oda?.OdaTuru ?? "Bilinmiyor"; // Oda bulunmazsa "Bilinmiyor" döner
            }
        }
        private void OdaButonlariniDoldur()
        {
            // Oda numarasını belirle
            int odaBaslangic = katNo * 100 + 1;  // Katın başlangıç oda numarasını hesapla

            // Oda numaralarını butonlara yerleştir
            Button[] odaButonlari = { btnOda1, btnOda2, btnOda3, btnOda4, btnOda5, btnOda6, btnOda7, btnOda8, btnOda9, btnOda10, btnOda11, btnOda12, btnOda13, btnOda14, btnOda15, btnOda16 };
            Label[] odaTurleri = {lbl1Tur , lbl2Tur, lbl3Tur, lbl4Tur, lbl5Tur, lbl6Tur, lbl7Tur, lbl8Tur, lbl9Tur, lbl10Tur, lbl11Tur, lbl12Tur, lbl13Tur, lbl14Tur, lbl15Tur, lbl16Tur };
            Label[] odaNumaralari = { lbl1No, lbl2No, lbl3No, lbl4No, lbl5No, lbl6No, lbl7No, lbl8No, lbl9No, lbl10No, lbl11No, lbl12No, lbl13No, lbl14No, lbl15No, lbl16No};



            for (int i = 0; i < odaButonlari.Length; i++)
            {   // Oda numarasını butonun metni olarak ayarlıyoruz
                int odaNumarasi = odaBaslangic + i;
                odaButonlari[i].Text = odaNumarasi.ToString();  // Her bir oda butonunun text'ini güncelle

                // Oda türünü almak için GetOdaTuru metodunu çağırıyoruz
                string odaTuru = GetOdaTuru(odaNumarasi.ToString());  // Oda numarasını string olarak gönderiyoruz

                // Oda türünü ilgili label'a yerleştir
                odaTurleri[i].Text = odaTuru;

                odaNumaralari[i].Text = odaNumarasi.ToString();
            }
        }

        private void OdaButonu_Click(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickedButton != null)
            {
                int odaNumarasi = Convert.ToInt32(clickedButton.Text); // Oda numarasını butondan al

                // Yeni rezervasyon formunu aç
                RezervasyonKayıt rezervasyonFormu = new RezervasyonKayıt(odaNumarasi);
                rezervasyonFormu.ShowDialog(); // Modal olarak aç, yani kullanıcı formu kapatmadan ana forma dönemez
            }
        }


        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void lbl12Tur_Click(object sender, EventArgs e)
        {

        }
    }
}