using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace szamonkeres20260317
{


    public partial class menulap : Form
    {
       private List<string> nevlista = new List<string>();
        private List<int> kicsilista = new List<int>();
        private List<int> nagylista = new List<int>();
        public menulap()
        {
            InitializeComponent();
            OpenFileDialog ofd = new OpenFileDialog();
         

            try
            {
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    string[] lines = System.IO.File.ReadAllLines(ofd.FileName);
                    for (int i = 0; i < lines.Length; i++)
                    {
                        string[] parts = lines[i].Split(';');
                        if (parts.Length == 3)
                        {
                            string nev = parts[0];
                            int kicsi = int.Parse(parts[1]);
                            int nagy = int.Parse(parts[2]);
                            nevlista.Add(nev);
                            kicsilista.Add(kicsi);
                            nagylista.Add(nagy);



                        }
                    }



                }
            }
            catch (Exception)
            {

                MessageBox.Show("Hiba adatbevitel közben");
                this.Close();
            }
        }

        private void menulap_Load(object sender, EventArgs e)
        {
            


            int y = 10;

            for (int i = 0; i < nevlista.Count; i++)
            {
                Panel sorPanel = new Panel();
                sorPanel.Width = panelMenu.Width - 25;
                sorPanel.Height = 40;
                sorPanel.Location = new Point(10, y);
                sorPanel.BackColor = Color.Green;


                CheckBox cb = new CheckBox();
                cb.Text = nevlista[i];
                cb.Location = new Point(5, 10);
                cb.Width = 120;
                cb.CheckedChanged += (s, ev) => FizetendoTorles();

        
                RadioButton rbKicsi = new RadioButton();
                rbKicsi.Text = kicsilista[i] + " Ft";
                rbKicsi.Location = new Point(140, 10);
                rbKicsi.AutoSize = true;
                rbKicsi.ForeColor = Color.Black;
                rbKicsi.BringToFront();
                rbKicsi.CheckedChanged += (s, ev) => FizetendoTorles();

     
                RadioButton rbNagy = new RadioButton();
                rbNagy.Text = nagylista[i] + " Ft";
                rbNagy.Location = new Point(220, 10);
                rbNagy.AutoSize = true;
                rbNagy.ForeColor = Color.Black;
                rbNagy.BringToFront();
                rbNagy.CheckedChanged += (s, ev) => FizetendoTorles();

         
                TextBox darab = new TextBox();
                darab.Location = new Point(320, 8);
                darab.Width = 40;
                darab.TextChanged += (s, ev) => FizetendoTorles();

                Label darabb = new Label();
                darabb.Location = new Point(380, 8);
                darabb.Visible = true;
                darabb.Text = "Darab";

      
                sorPanel.Controls.Add(cb);
                sorPanel.Controls.Add(rbKicsi);
                sorPanel.Controls.Add(rbNagy);
                sorPanel.Controls.Add(darab);
                sorPanel.Controls.Add(darabb);

 
                panelMenu.Controls.Add(sorPanel);

                y += 45;

                
            }

           





        }


        void FizetendoTorles()
        {
            txbfizetendo.Text = "";
        }

        private void btnexit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btntorol_Click(object sender, EventArgs e)
        {
            foreach (Panel sor in panelMenu.Controls)
            {
                foreach (Control c in sor.Controls)
                {
                    if (c is CheckBox cb)
                        cb.Checked = false;

                    if (c is RadioButton rb)
                        rb.Checked = false;

                    if (c is TextBox tb)
                        tb.Text = "";
                }
            }

            txbfizetendo.Text = "";
      
        }

        private void btnszamol_Click(object sender, EventArgs e)
        {
            int osszeg = 0;
            bool voltKivalasztas = false;

            foreach (Panel sor in panelMenu.Controls)
            {
                CheckBox cb = null;
                RadioButton rbKicsi = null;
                RadioButton rbNagy = null;
                TextBox tb = null;

                foreach (Control c in sor.Controls)
                {
                    if (c is CheckBox) cb = (CheckBox)c;
                    if (c is RadioButton rb)
                    {
                        if (rb.Location.X < 200)
                            rbKicsi = rb;
                        else
                            rbNagy = rb;
                    }
                    if (c is TextBox) tb = (TextBox)c;
                }

                if (cb.Checked)
                {
                    voltKivalasztas = true;

                    int db;

                    if (tb == null || !int.TryParse(tb.Text.Trim(), out db) || db <= 0)
                    {
                        MessageBox.Show("Hibás darabszám!");
                        return;
                    }

                    int ar = 0;

                    if (rbKicsi.Checked)
                        ar = int.Parse(rbKicsi.Text.Replace(" Ft", ""));
                    else if (rbNagy.Checked)
                        ar = int.Parse(rbNagy.Text.Replace(" Ft", ""));
                    else
                    {
                        MessageBox.Show("Válassz méretet!");
                        return;
                    }

                    osszeg += ar * db;
                }
            }

            if (!voltKivalasztas)
            {
                MessageBox.Show("Nincs kiválasztva pizza!");
                return;
            }

            txbfizetendo.Text = osszeg + " Ft";
        }
    }
}
