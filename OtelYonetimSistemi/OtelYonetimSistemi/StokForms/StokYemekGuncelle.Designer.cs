namespace OtelYonetimSistemi
{
    partial class StokYemekGuncelle
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
            this.comboBoxOgunTuru = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnYemeklerGüncel = new System.Windows.Forms.Button();
            this.comboBoxYemekUrun = new System.Windows.Forms.ComboBox();
            this.lblYemekUrunGuncelle = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // comboBoxOgunTuru
            // 
            this.comboBoxOgunTuru.FormattingEnabled = true;
            this.comboBoxOgunTuru.Location = new System.Drawing.Point(134, 90);
            this.comboBoxOgunTuru.Name = "comboBoxOgunTuru";
            this.comboBoxOgunTuru.Size = new System.Drawing.Size(116, 24);
            this.comboBoxOgunTuru.TabIndex = 19;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("BankGothic Lt BT", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(28, 90);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(57, 16);
            this.label1.TabIndex = 18;
            this.label1.Text = "ÖĞÜN";
            // 
            // btnYemeklerGüncel
            // 
            this.btnYemeklerGüncel.BackColor = System.Drawing.Color.Pink;
            this.btnYemeklerGüncel.Font = new System.Drawing.Font("BankGothic Lt BT", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnYemeklerGüncel.Location = new System.Drawing.Point(28, 148);
            this.btnYemeklerGüncel.Name = "btnYemeklerGüncel";
            this.btnYemeklerGüncel.Size = new System.Drawing.Size(219, 49);
            this.btnYemeklerGüncel.TabIndex = 17;
            this.btnYemeklerGüncel.Text = "YEMEK GÜNCELLE";
            this.btnYemeklerGüncel.UseVisualStyleBackColor = false;
            // 
            // comboBoxYemekUrun
            // 
            this.comboBoxYemekUrun.FormattingEnabled = true;
            this.comboBoxYemekUrun.Location = new System.Drawing.Point(134, 33);
            this.comboBoxYemekUrun.Name = "comboBoxYemekUrun";
            this.comboBoxYemekUrun.Size = new System.Drawing.Size(116, 24);
            this.comboBoxYemekUrun.TabIndex = 16;
            // 
            // lblYemekUrunGuncelle
            // 
            this.lblYemekUrunGuncelle.AutoSize = true;
            this.lblYemekUrunGuncelle.Font = new System.Drawing.Font("BankGothic Lt BT", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblYemekUrunGuncelle.Location = new System.Drawing.Point(28, 37);
            this.lblYemekUrunGuncelle.Name = "lblYemekUrunGuncelle";
            this.lblYemekUrunGuncelle.Size = new System.Drawing.Size(98, 16);
            this.lblYemekUrunGuncelle.TabIndex = 15;
            this.lblYemekUrunGuncelle.Text = "YEMEK ADI";
            // 
            // StokYemekGuncelle
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SeaShell;
            this.ClientSize = new System.Drawing.Size(299, 230);
            this.Controls.Add(this.comboBoxOgunTuru);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnYemeklerGüncel);
            this.Controls.Add(this.comboBoxYemekUrun);
            this.Controls.Add(this.lblYemekUrunGuncelle);
            this.Name = "StokYemekGuncelle";
            this.Text = "StokYemekGuncelle";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox comboBoxOgunTuru;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnYemeklerGüncel;
        private System.Windows.Forms.ComboBox comboBoxYemekUrun;
        private System.Windows.Forms.Label lblYemekUrunGuncelle;
    }
}