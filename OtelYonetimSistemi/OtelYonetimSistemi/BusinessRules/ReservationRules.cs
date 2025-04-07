using OtelYonetimSistemi.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//namespace OtelYonetimSistemi.BusinessRules
//{
//    internal class ReservationRules
//    {
//        public string SaveReservation(Misafirs misafir, Odalar oda, int kisiSayisi)
//        {
//            if (oda.Durum == "Dolu")
//            {
//                return "Oda doludur";
//            }

//            if (misafir.TC.Length == 12)
//            {
//                return "Yanlış Tc Girdiniz";
//            }

//            var db = new OtelYonetimiDbEntities();

//            var rezerve = new Rezervasyons
//            {
//                MisafirId = misafir.Id,
//                OdaId = oda.OdaID,
//                KisiSayisi  = kisiSayisi
//            };


//            db.Rezervasyons.Add(rezerve);
//            db.SaveChanges();
//            return "Rezervasyon Başarılı";
//        }
//    }
//}
