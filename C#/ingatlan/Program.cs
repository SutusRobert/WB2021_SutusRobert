using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Net.NetworkInformation;
using System.Globalization;

namespace ingatlan
{
    
    
        //ingatlan kategóriajat repetezentáló osztály
        class Category
        {
            public int id { get; set; }
            public string Name { get; set; }

        }

        class Seller
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Phone { get; set; }

        }

        class Ad
        {
            public int Area { get; set; }
            public Category Category { get; set; }
            public DateTime CreatetAt { get; set; }
            public string Description { get; set; }
            public int Floors { get; set; }
            public bool FreeOfCharge { get; set; }
            public int Id { get; set; }
            public string ImageUrl { get; set; }
            public string LatLong { get; set; }
            public int Rooms { get; set; }
            public Seller Seller { get; set; }



            public Ad(string sor)
            {

                string[] adatok = sor.Split(';');
                this.Id = int.Parse(adatok[0]);
                this.Rooms = int.Parse(adatok[1]);
                this.LatLong = adatok[2];
                this.Floors = int.Parse(adatok[3]);
                this.Area = int.Parse(adatok[4]);
                this.Description = adatok[5];
                this.FreeOfCharge = adatok[6] == "1";
                this.ImageUrl = adatok[7];
                this.CreatetAt = DateTime.Parse(adatok[8]);
                this.Seller = new Seller();
                this.Seller.Id = int.Parse(adatok[9]);
                this.Seller.Name = adatok[10];
                this.Seller.Phone = adatok[11];
                this.Category = new Category();
                this.Category.id = int.Parse(adatok[12]);
                this.Category.Name = adatok[13];



            }
        public double DistanceTo(double masikLat, double masikLon)
        {
            // 1. Szétszedjük az ingatlan saját koordinátáit a vessző (',') mentén
            string[] reszek = LatLong.Split(',');

            // 2. Szövegből számmá alakítás (double)
            // A CultureInfo.InvariantCulture használatával biztosítjuk, hogy a tizedespontot ('.') 
            // helyesen értelmezze a program, függetlenül a magyar/angol Windows beállításoktól.
            double sajatLat = double.Parse(reszek[0], CultureInfo.InvariantCulture);
            double sajatLon = double.Parse(reszek[1], CultureInfo.InvariantCulture);

            // 3. Pitagorasz-tétel segítségével kiszámoljuk a két pont (koordináta) közötti légvonalbeli távolságot
            double tav = Math.Sqrt(
                (masikLat - sajatLat) * (masikLat - sajatLat) +
                (masikLon - sajatLon) * (masikLon - sajatLon)
            );

            // 4. Visszaadjuk a kiszámított távolságot
            return tav;
        }

    }


    internal class Program
       {
        
                static void Main(string[] args)
                {
                     var ad = LoadFromCsv("realestates.csv");
                     
                     Console.WriteLine($"1. Földszinten lévő ingatlanok átlagos alapterülete: {Atlagszamitas(ad):0.00} m2");


                    // 3.feladat: Megkeressük a megadott óvodához legközelebbi tehermentes ingatlant
            var leg = Legkozelebbi(ad);
            if (leg != null)
            {
                Console.WriteLine("2. Mesevár óvodához légvonalban legközelebbi tehermentes ingatlan adatai:");
                Console.WriteLine($"\tEladó neve\t  : {leg.Seller.Name}");
                Console.WriteLine($"\tEladó telefonszáma: {leg.Seller.Phone}");
                Console.WriteLine($"\tAlapterület\t  : {leg.Area}");
                Console.WriteLine($"\tSzobák száma\t  : {leg.Rooms}");
            }
            else
            {
                Console.WriteLine("Nincs tehermentes ingatlan.");
            }




            Console.ReadKey();
                }


        static List<Ad> LoadFromCsv(string fajlnev)
        {
            List<Ad> lista = new List<Ad>();

            // Fájl összes sorának beolvasása, a .Skip(1) átugorja a legelső sort (a fejlécet)
            var sorok = File.ReadAllLines(fajlnev).Skip(1);

            // Minden beolvasott sorra létrehozunk egy új Ad objektumot
            foreach (var sor in sorok)
            {
                lista.Add(new Ad(sor));
            }
            return lista;
        }

        static double Atlagszamitas(List<Ad> lista)
        {
            int osszeg = 0;
            int db = 0;
            foreach (var r in lista )
            {
                if (r.Floors == 0)
                {
                    osszeg += r.Area;
                    db++;
                }
            }
            return (double)osszeg / db;
        }
        static Ad Legkozelebbi(List<Ad> lista)
        {
            double ovodaLat = 47.4164220114023;
            double ovodaLon = 19.066342425796986;

            double minTav = double.MaxValue;
            Ad legkozelebbi = null; // Ide fogjuk elmenteni a legjobb találatot

            foreach (var r in lista)
            {
                // Csak tehermentes ingatlanokat vizsgálunk
                if (r.FreeOfCharge)
                {
                    // Távolság kiszámítása az aktuális ingatlan és az óvoda között
                    double tav = r.DistanceTo(ovodaLat, ovodaLon);

                    // Ha a most kiszámolt távolság kisebb az eddigi legkisebbnél, akkor találtunk egy új legközelebbit
                    if (tav < minTav)
                    {
                        minTav = tav;
                        legkozelebbi = r;
                    }
                }
                

            }
            return legkozelebbi;
        }
    }
}