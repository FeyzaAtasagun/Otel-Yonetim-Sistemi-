namespace OtelYonetimSistemi
{
    partial class UrunBilgisi
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.lblUrunAdi = new System.Windows.Forms.Label();
            this.comboBoxKategori = new System.Windows.Forms.ComboBox();
            this.lblSonKullanımTarihi = new System.Windows.Forms.Label();
            this.lblKategori = new System.Windows.Forms.Label();
            this.lblBirim = new System.Windows.Forms.Label();
            this.lblMiktar = new System.Windows.Forms.Label();
            this.dtpSonKullanmaTarihi = new System.Windows.Forms.DateTimePicker();
            this.txtBirimi = new System.Windows.Forms.TextBox();
            this.txtMiktar = new System.Windows.Forms.TextBox();
            this.txtUrunAdi = new System.Windows.Forms.TextBox();
            this.btnSil = new System.Windows.Forms.Button();
            this.btnGüncelle = new System.Windows.Forms.Button();
            this.btnEkle = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(-1, 100);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(1404, 348);
            this.dataGridView1.TabIndex = 0;
            // 
            // lblUrunAdi
            // 
            this.lblUrunAdi.AutoSize = true;
            this.lblUrunAdi.Font = new System.Drawing.Font("BankGothic Lt BT", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblUrunAdi.Location = new System.Drawing.Point(11, 18);
            this.lblUrunAdi.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblUrunAdi.Name = "lblUrunAdi";
            this.lblUrunAdi.Size = new System.Drawing.Size(80, 16);
            this.lblUrunAdi.TabIndex = 10;
            this.lblUrunAdi.Text = "Ürün Adı";
            // 
            // comboBoxKategori
            // 
            this.comboBoxKategori.FormattingEnabled = true;
            this.comboBoxKategori.Location = new System.Drawing.Point(728, 11);
            this.comboBoxKategori.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.comboBoxKategori.Name = "comboBoxKategori";
            this.comboBoxKategori.Size = new System.Drawing.Size(150, 24);
            this.comboBoxKategori.TabIndex = 23;
            // 
            // lblSonKullanımTarihi
            // 
            this.lblSonKullanımTarihi.AutoSize = true;
            this.lblSonKullanımTarihi.Font = new System.Drawing.Font("BankGothic Lt BT", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblSonKullanımTarihi.Location = new System.Drawing.Point(886, 18);
            this.lblSonKullanımTarihi.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblSonKullanımTarihi.Name = "lblSonKullanımTarihi";
            this.lblSonKullanımTarihi.Size = new System.Drawing.Size(172, 16);
            this.lblSonKullanımTarihi.TabIndex = 22;
            this.lblSonKullanımTarihi.Text = "Son Kullanma Tarihi";
            // 
            // lblKategori
            // 
            this.lblKategori.AutoSize = true;
            this.lblKategori.Font = new System.Drawing.Font("BankGothic Lt BT", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblKategori.Location = new System.Drawing.Point(649, 18);
            this.lblKategori.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblKategori.Name = "lblKategori";
            this.lblKategori.Size = new System.Drawing.Size(77, 16);
            this.lblKategori.TabIndex = 21;
            this.lblKategori.Text = "Kategori";
            // 
            // lblBirim
            // 
            this.lblBirim.AutoSize = true;
            this.lblBirim.Font = new System.Drawing.Font("BankGothic Lt BT", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblBirim.Location = new System.Drawing.Point(456, 18);
            this.lblBirim.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblBirim.Name = "lblBirim";
            this.lblBirim.Size = new System.Drawing.Size(46, 16);
            this.lblBirim.TabIndex = 20;
            this.lblBirim.Text = "Birim";
            // 
            // lblMiktar
            // 
            this.lblMiktar.AutoSize = true;
            this.lblMiktar.Font = new System.Drawing.Font("BankGothic Lt BT", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblMiktar.Location = new System.Drawing.Point(242, 18);
            this.lblMiktar.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMiktar.Name = "lblMiktar";
            this.lblMiktar.Size = new System.Drawing.Size(60, 16);
            this.lblMiktar.TabIndex = 19;
            this.lblMiktar.Text = "Miktar";
            // 
            // dtpSonKullanmaTarihi
            // 
            this.dtpSonKullanmaTarihi.Location = new System.Drawing.Point(1066, 12);
            this.dtpSonKullanmaTarihi.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtpSonKullanmaTarihi.Name = "dtpSonKullanmaTarihi";
            this.dtpSonKullanmaTarihi.Size = new System.Drawing.Size(249, 22);
            this.dtpSonKullanmaTarihi.TabIndex = 18;
            // 
            // txtBirimi
            // 
            this.txtBirimi.Location = new System.Drawing.Point(510, 12);
            this.txtBirimi.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtBirimi.Name = "txtBirimi";
            this.txtBirimi.Size = new System.Drawing.Size(124, 22);
            this.txtBirimi.TabIndex = 17;
            // 
            // txtMiktar
            // 
            this.txtMiktar.Location = new System.Drawing.Point(310, 12);
            this.txtMiktar.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtMiktar.Name = "txtMiktar";
            this.txtMiktar.Size = new System.Drawing.Size(124, 22);
            this.txtMiktar.TabIndex = 16;
            // 
            // txtUrunAdi
            // 
            this.txtUrunAdi.Location = new System.Drawing.Point(91, 12);
            this.txtUrunAdi.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtUrunAdi.Name = "txtUrunAdi";
            this.txtUrunAdi.Size = new System.Drawing.Size(124, 22);
            this.txtUrunAdi.TabIndex = 15;
            // 
            // btnSil
            // 
            this.btnSil.Location = new System.Drawing.Point(841, 56);
            this.btnSil.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btnSil.Name = "btnSil";
            this.btnSil.Size = new System.Drawing.Size(395, 23);
            this.btnSil.TabIndex = 26;
            this.btnSil.Text = "ÜRÜN SİL";
            this.btnSil.UseVisualStyleBackColor = true;
            // 
            // btnGüncelle
            // 
            this.btnGüncelle.Location = new System.Drawing.Point(428, 56);
            this.btnGüncelle.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btnGüncelle.Name = "btnGüncelle";
            this.btnGüncelle.Size = new System.Drawing.Size(395, 23);
            this.btnGüncelle.TabIndex = 25;
            this.btnGüncelle.Text = "ÜRÜN GÜNCELLE";
            this.btnGüncelle.UseVisualStyleBackColor = true;
            // 
            // btnEkle
            // 
            this.btnEkle.Location = new System.Drawing.Point(15, 56);
            this.btnEkle.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btnEkle.Name = "btnEkle";
            this.btnEkle.Size = new System.Drawing.Size(395, 23);
            this.btnEkle.TabIndex = 24;
            this.btnEkle.Text = "YENİ ÜRÜN EKLE";
            this.btnEkle.UseVisualStyleBackColor = true;
            // 
            // UrunBilgisi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightPink;
            this.ClientSize = new System.Drawing.Size(1378, 397);
            this.Controls.Add(this.btnSil);
            this.Controls.Add(this.btnGüncelle);
            this.Controls.Add(this.btnEkle);
            this.Controls.Add(this.comboBoxKategori);
            this.Controls.Add(this.lblSonKullanımTarihi);
            this.Controls.Add(this.lblKategori);
            this.Controls.Add(this.lblBirim);
            this.Controls.Add(this.lblMiktar);
            this.Controls.Add(this.dtpSonKullanmaTarihi);
            this.Controls.Add(this.txtBirimi);
            this.Controls.Add(this.txtMiktar);
            this.Controls.Add(this.txtUrunAdi);
            this.Controls.Add(this.lblUrunAdi);
            this.Controls.Add(this.dataGridView1);
            this.Name = "UrunBilgisi";
            this.Text = "UrunBilgisi";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label lblUrunAdi;
        private System.Windows.Forms.ComboBox comboBoxKategori;
        private System.Windows.Forms.Label lblSonKullanımTarihi;
        private System.Windows.Forms.Label lblKategori;
        private System.Windows.Forms.Label lblBirim;
        private System.Windows.Forms.Label lblMiktar;
        private System.Windows.Forms.DateTimePicker dtpSonKullanmaTarihi;
        private System.Windows.Forms.TextBox txtBirimi;
        private System.Windows.Forms.TextBox txtMiktar;
        private System.Windows.Forms.TextBox txtUrunAdi;
        private System.Windows.Forms.Button btnSil;
        private System.Windows.Forms.Button btnGüncelle;
        private System.Windows.Forms.Button btnEkle;
    }
}