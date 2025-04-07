using OtelYonetimSistemi.Database;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OtelYonetimSistemi
{
    public partial class MusteriKayit : Form
    {
        public MusteriKayit()
        {
            InitializeComponent();
        }
        OtelYonetimiDbEntities db = new OtelYonetimiDbEntities();
        private int seciliMisafirID = -1;

        private byte[] ConvertImageToByteArray(Image image)
        {
            if (image != null)
            {
                try
                {
                    using (MemoryStream ms = new MemoryStream())
                    {
                        image.Save(ms, image.RawFormat);
                        return ms.ToArray();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Resim dönüştürme hatası: " + ex.Message);
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {

                string email = txtbxEmail.Text;

                if (!email.Contains("@"))
                {
                    MessageBox.Show("Lütfen geçerli bir e-posta adresi giriniz. '@' işareti eksik!", "Geçersiz E-Posta", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

            try
            {
                if (string.IsNullOrEmpty(txtbxAdSoyad.Text) || string.IsNullOrEmpty(maskedTextBox1.Text))
                {
                    MessageBox.Show("Ad Soyad ve TC alanlarını doldurun!", "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                Misafirs tbl = new Misafirs();
                tbl.AdSoyad = txtbxAdSoyad.Text;
                tbl.TC = maskedTextBox1.Text;
                tbl.Telefon = mtxtbxTelefon.Text;
                tbl.Mail = txtbxEmail.Text;
                tbl.Adres = txtbxAdres.Text;
                tbl.Aciklama = txtaciklama.Text;
                tbl.KimlikFoto1 = ConvertImageToByteArray(pictureBox4.Image);
                tbl.KimlikFoto2 = ConvertImageToByteArray(pictureBox1.Image);

                db.Misafirs.Add(tbl);
                db.SaveChanges();

                MessageBox.Show("Misafir kaydedildi!");
                LoadMisafirler();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata: " + ex.Message);
            }
        }

        private void btnVazgeç_Click(object sender, EventArgs e)
        {
            txtbxAdSoyad.Clear();
            txtbxEmail.Clear();
            txtbxAdres.Clear();
            txtaciklama.Clear();
            maskedTextBox1.Clear();
            mtxtbxTelefon.Clear();
            pictureBox4.Image = null;
            pictureBox5.Image = null;
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "JPG|*.jpg|PNG|*.png|JPEG|*.jpeg";

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    pictureBox4.Image = new Bitmap(openFileDialog.FileName);  // Bu satırda hata olabilir
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Resim yüklenirken hata oluştu: " + ex.Message);
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "JPG|*.jpg|PNG|*.png|JPEG|*.jpeg";

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                pictureBox1.Image = new Bitmap(openFileDialog.FileName);
            }
        }

        private void mtxtbxTelefon_MaskInputRejected(object sender, MaskInputRejectedEventArgs e)
        {
            mtxtbxTelefon.Select(0, 0);
        }

        private void maskedTextBox1_MaskInputRejected(object sender, MaskInputRejectedEventArgs e)
        {
            maskedTextBox1.Select(0, 0); // İmleç en başa gider
        }



        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if (seciliMisafirID == -1)
                {
                    MessageBox.Show("Güncellenecek misafir seçilmedi!", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                var guncellenecekMisafir = db.Misafirs.FirstOrDefault(x => x.MisafirId == seciliMisafirID);

                if (guncellenecekMisafir != null)
                {
                    guncellenecekMisafir.AdSoyad = txtbxAdSoyad.Text;
                    guncellenecekMisafir.TC = maskedTextBox1.Text;
                    guncellenecekMisafir.Telefon = mtxtbxTelefon.Text;
                    guncellenecekMisafir.Mail = txtbxEmail.Text;
                    guncellenecekMisafir.Adres = txtbxAdres.Text;
                    guncellenecekMisafir.Aciklama = txtaciklama.Text;
                    guncellenecekMisafir.KimlikFoto1 = ConvertImageToByteArray(pictureBox4.Image);
                    guncellenecekMisafir.KimlikFoto2 = ConvertImageToByteArray(pictureBox5.Image);

                    // Resim güncelleme işlemi
                    if (pictureBox4.Image != null)
                    {
                        guncellenecekMisafir.KimlikFoto1 = ConvertImageToByteArray(pictureBox4.Image);
                    }
                    else
                    {
                        guncellenecekMisafir.KimlikFoto1 = null;  // Eğer resim yoksa null
                    }

                    if (pictureBox5.Image != null)
                    {
                        guncellenecekMisafir.KimlikFoto2 = ConvertImageToByteArray(pictureBox5.Image);
                    }
                    else
                    {
                        guncellenecekMisafir.KimlikFoto2 = null;  // Eğer resim yoksa null
                    }
                    db.SaveChanges();
                    MessageBox.Show("Misafir bilgileri güncellendi!", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    LoadMisafirler(); // ✅ Listeyi yenile
                }
                else
                {
                    MessageBox.Show("Güncellenecek misafir bulunamadı!", "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata: " + ex.Message, "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void LoadMisafirler()
        {
            try
            {
                var misafirler = db.Misafirs
                    .Select(x => new
                    {
                        x.MisafirId, // ID'yi de ekledim
                        x.AdSoyad,
                        x.TC,
                        x.Telefon,
                        x.Mail,
                        x.Adres,
                        x.Aciklama
                    }).ToList();





                dataGridViewMisafirListesi.DataSource = null;  // Önce veriyi temizle
                dataGridViewMisafirListesi.DataSource = misafirler;

                dataGridViewMisafirListesi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill; // Sütunları uygun boyutlandır
                dataGridViewMisafirListesi.SelectionMode = DataGridViewSelectionMode.FullRowSelect; // Satır seçimi aktif et
                dataGridViewMisafirListesi.ReadOnly = true; // Kullanıcı değişiklik yapamasın
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata: " + ex.Message, "Veritabanı Hatası", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void dataGridViewMisafirListesi_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                int misafirID = Convert.ToInt32(dataGridViewMisafirListesi.Rows[e.RowIndex].Cells["MisafirId"].Value);
                string adSoyad = dataGridViewMisafirListesi.Rows[e.RowIndex].Cells["AdSoyad"].Value.ToString();

            }
            if (e.RowIndex >= 0)
            {
                DataGridViewRow satir = dataGridViewMisafirListesi.Rows[e.RowIndex];

                seciliMisafirID = Convert.ToInt32(satir.Cells["MisafirId"].Value); // Kolon ismi Id olmalı

                txtbxAdSoyad.Text = satir.Cells["AdSoyad"].Value.ToString();
                maskedTextBox1.Text = satir.Cells["TC"].Value.ToString();
                mtxtbxTelefon.Text = satir.Cells["Telefon"].Value.ToString();
                txtbxEmail.Text = satir.Cells["Mail"].Value.ToString();
                txtbxAdres.Text = satir.Cells["Adres"].Value.ToString();
                txtaciklama.Text = satir.Cells["Aciklama"].Value.ToString();

                // Fotoğrafları da yüklemek istersen:
                var misafir = db.Misafirs.FirstOrDefault(x => x.MisafirId == seciliMisafirID);
                if (misafir != null)
                {
                    if (misafir.KimlikFoto1 != null)
                    {
                        using (MemoryStream ms = new MemoryStream(misafir.KimlikFoto1))
                        {
                            pictureBox4.Image = Image.FromStream(ms);
                        }
                    }

                    if (misafir.KimlikFoto2 != null)
                    {
                        using (MemoryStream ms = new MemoryStream(misafir.KimlikFoto2))
                        {
                            pictureBox1.Image = Image.FromStream(ms);
                        }
                    }
                }
            }
        }

        private void MusteriKayit_Load(object sender, EventArgs e)
        {
            LoadMisafirler();
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            try
            {
                if (seciliMisafirID == -1)
                {
                    MessageBox.Show("Lütfen silmek istediğiniz misafiri seçin.", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Silinecek misafiri veritabanında bul
                var silinecekMisafir = db.Misafirs.FirstOrDefault(x => x.MisafirId == seciliMisafirID);

                if (silinecekMisafir != null)
                {
                    DialogResult result = MessageBox.Show("Bu misafiri silmek istediğinize emin misiniz?", "Onay", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                    if (result == DialogResult.Yes)
                    {
                        db.Misafirs.Remove(silinecekMisafir);
                        db.SaveChanges();

                        MessageBox.Show("Misafir silindi!", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // Listeyi yenile
                        LoadMisafirler();

                        // Formu temizle
                        btnVazgeç.PerformClick();
                        seciliMisafirID = -1;
                    }
                }
                else
                {
                    MessageBox.Show("Silinecek misafir bulunamadı!", "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata: " + ex.Message, "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
