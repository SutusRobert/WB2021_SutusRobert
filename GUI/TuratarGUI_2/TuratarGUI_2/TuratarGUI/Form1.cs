using System;
using System.Collections.Generic;
using System.Data; // A DataTable-hez szükséges
using System.Drawing; // A színekhez (Color.LightGreen) szükséges
using System.Windows.Forms;
using MySqlConnector;

namespace TuratarGUI
{
    public partial class Form1 : Form
    {
        string connectionString = "Server=localhost;Database=turak;Uid=root;Pwd=mysql;";
        public Form1()
        {
            InitializeComponent();

            List<Kategoria> kategoriak = new List<Kategoria>();
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                MySqlCommand command = new MySqlCommand("SELECT * FROM kategoria", conn);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        kategoriak.Add(new Kategoria()
                        {
                            id = reader.GetInt32("id"),
                            nev = reader.GetString("nev")
                        });
                        comboBox1.Items.Add(reader.GetString("nev"));
                    }
                }
                conn.Close();
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            dataGridView1.Columns.Add("id", "Azonosító");
            dataGridView1.Columns.Add("leiras", "Leírás");
            dataGridView1.Columns.Add("tav", "Hossz");
            dataGridView1.Columns.Add("emelkedes", "Emelkedés");
            dataGridView1.Columns.Add("lejtes", "Lejtés");
            dataGridView1.Columns.Add("indulas", "Indulás");
            dataGridView1.Columns.Add("erkezes", "Érkezés");
        }
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = comboBox1.SelectedIndex + 1;
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            MySqlCommand command = new MySqlCommand("SELECT * FROM turak WHERE kategoria = @id", conn);

            dataGridView1.Rows.Clear();
            command.Parameters.AddWithValue("id", id);
            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    int ujSorIndex = dataGridView1.Rows.Add(
                        reader.GetInt32("id"),
                        reader.GetString("leiras"),
                        reader.GetInt32("tav"),
                        reader.GetInt32("emelkedes"),
                        reader.GetInt32("lejtes"),
                        reader.GetDateTime("indulas"),
                        reader.GetDateTime("erkezes")
                        );
                    bool aktiv = reader.GetBoolean("aktiv");
                    if (!aktiv)
                    {
                        dataGridView1.Rows[ujSorIndex].DefaultCellStyle.BackColor = Color.LightCoral;
                    } else
                    {
                        dataGridView1.Rows[ujSorIndex].DefaultCellStyle.BackColor = Color.LightGreen;
                    }
                }
            }
            conn.Close();
        }
    }

    class Kategoria
    {
        public int id { get; set; }
        public string nev { get; set; }
    }
}