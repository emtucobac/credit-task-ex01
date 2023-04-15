using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace ex1
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void showitem()
        {
            SqlConnection conn = new SqlConnection("initial catalog = credit; data source = LAPTOP-90QEEVDN; integrated security = true");

            // Create a command to retrieve data from a table
            SqlCommand cmd = new SqlCommand("select * from item where Ma in (SELECT  top 3 itemId FROM order_Detail GROUP BY itemId HAVING COUNT(itemId) > 0 ORDER BY COUNT(itemId) desc )", conn);

            // Create a DataTable to store the retrieved data
            DataTable dt = new DataTable();

            // Fill the DataTable with data from the database
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            // Bind the DataTable to the DataGridView
            dataGridView1.DataSource = dt;
        }

        private void showagent()
        {
            SqlConnection conn = new SqlConnection("initial catalog = credit; data source = LAPTOP-90QEEVDN; integrated security = true");

            // Create a command to retrieve data from a table
            SqlCommand cmd = new SqlCommand(" select* from Agent where agentId in (SELECT top 3 agentId FROM Orders GROUP BY agentId HAVING COUNT(agentId) > 1 ORDER BY COUNT(agentId) desc)", conn);

            // Create a DataTable to store the retrieved data
            DataTable dt = new DataTable();

            // Fill the DataTable with data from the database
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            // Bind the DataTable to the DataGridView
            dataGridView1.DataSource = dt;
        }

       
        private void button1_Click(object sender, EventArgs e)
        {
            showitem();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            showagent();
        }
    }
}
