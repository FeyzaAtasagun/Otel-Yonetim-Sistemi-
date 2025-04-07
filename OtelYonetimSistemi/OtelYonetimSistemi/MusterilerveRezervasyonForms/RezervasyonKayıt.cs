using OtelYonetimSistemi.Database;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OtelYonetimSistemi
{
    public partial class RezervasyonKayıt : Form
    {
        public RezervasyonKayıt()
        {
            InitializeComponent();
        }
        private int odaNumarasi;

        // Yapıcı metod, oda numarasını parametre olarak alacak
        public RezervasyonKayıt(int odaNumarasi)
        {
            InitializeComponent();
            this.odaNumarasi = odaNumarasi;  // Oda numarasını al ve sakla
        }

        private void OdaBilgileriniGetir()
        {
            try
            {
                using (var context = new OtelYonetimiDbEntities())  // Entity Framework context'i
                {
                    // Oda numarasına göre veritabanından Oda bilgilerini çekiyoruz
              
                    var oda = context.Odalar.FirstOrDefault(o => o.OdaNumarasi == odaNumarasi.ToString());


                    if (oda != null)
                    {
                        // Oda bilgilerini Label'lara yazdırıyoruz
                        lblOdano.Text = " " + oda.OdaNumarasi.ToString();
                        lblkisisayisi.Text = " " + oda.KisiSayisi.ToString();
                        lblOdatipi.Text = " " + oda.OdaTuru;
                        lbldurum.Text = " " + oda.Durum;
                        lblfiyat.Text = " " + oda.GecelikFiyat.ToString();  
                    }
                    else
                    {
                        MessageBox.Show("Oda bulunamadı.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Veritabanı hatası: " + ex.Message);
            }
        }
        private void btnrezervasyonolustur_Click(object sender, EventArgs e)
        {

            try
            {
                // ComboBox'tan seçilen misafiri al
                Misafirs selectedMisafir = (Misafirs)comboBox1.SelectedItem;
                if (selectedMisafir == null)
                {
                    MessageBox.Show("Lütfen bir misafir seçin.");
                    return;
                }

                int misafirID = selectedMisafir.MisafirId;
                DateTime baslangicTarihi = dateTimePickerbaslangic.Value;
                DateTime bitisTarihi = dateTimePickerbitis.Value;

                if (comboBoxDurum.SelectedItem == null)
                {
                    MessageBox.Show("Lütfen bir durum seçin.");
                    return;
                }

                string durum = comboBoxDurum.SelectedItem.ToString();

                using (var context = new OtelYonetimiDbEntities())
                {
                    // Rezervasyon nesnesi oluşturuluyor
                    var rezervasyon = new Rezervasyons()
                    {
                        MisafirId = misafirID,
                        BaslangicTarihi = baslangicTarihi,
                        BitisTarihi = bitisTarihi,
                        Durum = durum,
                        OdaNumarasi = odaNumarasi.ToString(),  // Oda numarası rezervasyona ekleniyor
                    };

                    // Rezervasyonu veritabanına ekle
                    context.Rezervasyons.Add(rezervasyon);
                    context.SaveChanges();

                    MessageBox.Show("Rezervasyon başarılı bir şekilde oluşturuldu!");

                    // Veri güncelleme işlemi
                    VerileriYenile();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Veritabanı hatası: " + ex.Message);
            }


        }

            private void VerileriYenile()
        {
            try
            {
                using (var context = new OtelYonetimiDbEntities())
                {
                    // Sadece Rezervasyon tablosundaki verileri alıyoruz
                    var rezervasyonlar = context.Rezervasyons.Select(r => new
                    {
                        r.Id,
                        r.MisafirId,   // MisafirID rezervasyonla ilişkilidir
                        r.BaslangicTarihi,
                        r.BitisTarihi,
                        
                        r.Durum // Durum gibi diğer alanları da alabilirsiniz
                    }).ToList();

                    // DataGridView'e bağla
                    dataGridViewrezervasyonlistesi.DataSource = rezervasyonlar;

                    // Kolon başlıklarını ayarla
                    dataGridViewrezervasyonlistesi.Columns[0].HeaderText = "Rezervasyon ID";
                    dataGridViewrezervasyonlistesi.Columns[1].HeaderText = "Misafir ID";
                    dataGridViewrezervasyonlistesi.Columns[2].HeaderText = "Oda Numarası";
                    dataGridViewrezervasyonlistesi.Columns[3].HeaderText = "Başlangıç Tarihi";
                    dataGridViewrezervasyonlistesi.Columns[4].HeaderText = "Bitiş Tarihi";
                    dataGridViewrezervasyonlistesi.Columns[5].HeaderText = "Durum";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Veri güncelleme hatası: " + ex.Message);
            }
        }

        private void RezervasyonKayıt_Load(object sender, EventArgs e)
        {
            OdaBilgileriniGetir();
            try
            {
                using (var context = new OtelYonetimiDbEntities())  // Entity Framework context'i
                {
                    // Misafir listesi çekiliyor
                    var misafirler = context.Misafirs.ToList();

                    // ComboBox'a ekleme
                    comboBox1.DisplayMember = "AdSoyad";  // Görüntülenmesi gereken değer
                    comboBox1.ValueMember = "MisafirID";  // Seçilen öğe olarak kullanılacak değer
                    comboBox1.DataSource = misafirler;    // Verileri ComboBox'a bağla
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Veritabanı hatası: " + ex.Message);
            }
        }
        private void btnSil_Click(object sender, EventArgs e)
        {
            // Seçilen rezervasyonun ID'sini almak için DataGridView'den alınabilir
            if (dataGridViewrezervasyonlistesi.SelectedRows.Count > 0)
            {
                // Seçilen satırdan ID'yi alalım
                var selectedRow = dataGridViewrezervasyonlistesi.SelectedRows[0];
                int rezervasyonId = (int)selectedRow.Cells["RezervasyonID"].Value;  // "RezervasyonID" doğru sütun adı olmalı

                // Silme işlemini gerçekleştirelim
                try
                {
                    using (var context = new OtelYonetimiDbEntities())  // Entity Framework context'i
                    {
                        // Silinecek rezervasyonu buluyoruz
                        var rezervasyonToDelete = context.Rezervasyons.FirstOrDefault(r => r.Id == rezervasyonId);

                        if (rezervasyonToDelete != null)
                        {
                            // Veritabanından sil
                            context.Rezervasyons.Remove(rezervasyonToDelete);
                            context.SaveChanges();  // Değişiklikleri kaydet

                            MessageBox.Show("Rezervasyon başarıyla silindi!");
                            VerileriYenile();  // Verileri yenileyerek DataGridView'i güncelle
                        }
                        else
                        {
                            MessageBox.Show("Seçilen rezervasyon bulunamadı.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Veritabanı hatası: " + ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Lütfen silmek için bir rezervasyon seçin.");
            }
        }

        private void btnRKGuncelle_Click(object sender, EventArgs e)
        {

        }
    }
}
