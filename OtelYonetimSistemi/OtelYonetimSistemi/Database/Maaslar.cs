//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OtelYonetimSistemi.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Maaslar
    {
        public int MaasID { get; set; }
        public Nullable<int> PersonelID { get; set; }
        public decimal BrutMaas { get; set; }
        public decimal NetMaas { get; set; }
        public int MaasAyi { get; set; }
        public int MaasYili { get; set; }
        public Nullable<System.DateTime> OdemeTarihi { get; set; }
        public string Aciklama { get; set; }
    
        public virtual Personel Personel { get; set; }
    }
}
