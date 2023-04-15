using System;

using System.Collections.Generic;

using System.ComponentModel;

using System.Data;

using System.Drawing;

using System.Linq;

using System.Text;

using System.Threading.Tasks;

using System.Windows.Forms;

using System.Data.SqlClient;

namespace ex1
{
    public partial class Form1 : Form
    {
        SqlConnection cn;

        SqlDataAdapter data;

        SqlCommand cm;

        DataTable tb;

        int dk = 0;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string sql = "initial catalog = credit; data source = LAPTOP-90QEEVDN; integrated security = true";

            cn = new SqlConnection(sql);

            cn.Open();
            
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string s = "select * from username where id = '" + textBox1.Text + "' and pass = '" + textBox2.Text + "' ";
            cm = new SqlCommand(s, cn);
            data = new SqlDataAdapter(cm);

            tb = new DataTable();
            data.Fill(tb);

            if(tb.Rows.Count > 0 )
            {
                

                Form2 f2 = new Form2();
                
                f2.ShowDialog();
                this.Close();
            }
            else
            {
                MessageBox.Show("Wrong username or pass"); 
            }

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}