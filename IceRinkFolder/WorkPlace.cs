using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;


namespace Diplom
{
    public partial class WorkPlace : Form
    {

        private SqlConnection icerinkconnection = null;
        public WorkPlace()
        {
            InitializeComponent();
        }
        private void Form2_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "iceRinkDataSet.Subdivision". При необходимости она может быть перемещена или удалена.
            this.subdivisionTableAdapter.Fill(this.iceRinkDataSet.Subdivision);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "iceRinkDataSet.PriceList". При необходимости она может быть перемещена или удалена.
            this.priceListTableAdapter.Fill(this.iceRinkDataSet.PriceList);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "iceRinkDataSet.Receipt". При необходимости она может быть перемещена или удалена.
            this.receiptTableAdapter.Fill(this.iceRinkDataSet.Receipt);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "iceRinkDataSet.Sessions". При необходимости она может быть перемещена или удалена.
            this.sessionsTableAdapter.Fill(this.iceRinkDataSet.Sessions);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "iceRinkDataSet.SessionsDetails". При необходимости она может быть перемещена или удалена.
            this.sessionsDetailsTableAdapter.Fill(this.iceRinkDataSet.SessionsDetails);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "iceRinkDataSet.Staff". При необходимости она может быть перемещена или удалена.
            this.staffTableAdapter.Fill(this.iceRinkDataSet.Staff);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "iceRinkDataSet.Equipment". При необходимости она может быть перемещена или удалена.
            this.equipmentTableAdapter.Fill(this.iceRinkDataSet.Equipment);
            icerinkconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["IceRink"].ConnectionString);

            icerinkconnection.Open();

            SqlDataAdapter dataAdapter = new SqlDataAdapter($"Exec p_staff", icerinkconnection);

            DataSet db = new DataSet();

            dataAdapter.Fill(db);

            dataGridView2.DataSource = db.Tables[0];
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Exec p_posl", icerinkconnection);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Exec p_staff", icerinkconnection);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Exec p_sea", icerinkconnection);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Exec p_equip", icerinkconnection);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
        }

        private void button5_Click(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Exec p_receipt", icerinkconnection);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
        }

        private void button6_Click_1(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand($"INSERT INTO [PriceList] (Name, Cost) VALUES (@Name, @Cost)", icerinkconnection);

            command.Parameters.AddWithValue("Name", textBox1.Text);
            command.Parameters.AddWithValue("Cost", textBox2.Text);

            MessageBox.Show(command.ExecuteNonQuery().ToString("Данi внесено!"));
        }

        private void button7_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand($"INSERT INTO [Subdivision] (KindOfActivity, Salary) VALUES (@KindOfActivity, @Salary)", icerinkconnection);

            command.Parameters.AddWithValue("KindOfActivity", textBox3.Text);
            command.Parameters.AddWithValue("Salary", textBox4.Text);

            MessageBox.Show(command.ExecuteNonQuery().ToString("Данi внесено!"));
        }

        private void button8_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand($"INSERT INTO [Staff] (Name, Surname, PhoneNumber, KindOfActivity) VALUES (@Name, @Surname, @PhoneNumber, @KindOfActivity)", icerinkconnection);

            command.Parameters.AddWithValue("Name", textBox5.Text);
            command.Parameters.AddWithValue("Surname", textBox6.Text);
            command.Parameters.AddWithValue("PhoneNumber", textBox7.Text);
            command.Parameters.AddWithValue("KindOfActivity", comboBox1.SelectedValue);

            MessageBox.Show(command.ExecuteNonQuery().ToString("Данi внесено!"));
        }

        private void button9_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand($"INSERT INTO [SessionsDetails] (Cost, KindOfSession) VALUES (@Cost, @KindOfSession)", icerinkconnection);

            command.Parameters.AddWithValue("Cost", textBox8.Text);
            command.Parameters.AddWithValue("KindOfSession", textBox9.Text);

            MessageBox.Show(command.ExecuteNonQuery().ToString("Данi внесено!"));
        }

        private void button10_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand($"INSERT INTO [Sessions] (Data, Time, KindOfSession) VALUES (@Data, @Time, @KindOfSession)", icerinkconnection);

            DateTime date = DateTime.Parse(textBox10.Text);

            command.Parameters.AddWithValue("Data", $"{date.Day}/{date.Month}/{date.Year}");
            command.Parameters.AddWithValue("Time", textBox11.Text);
            command.Parameters.AddWithValue("KindOfSession", comboBox2.SelectedValue);

            MessageBox.Show(command.ExecuteNonQuery().ToString("Данi внесено!"));
        }

        private void button11_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand($"INSERT INTO [Equipment] (Name, Quantity, Cost, Responsible) VALUES (@Name, @Quantity, @Cost, @Responsible)", icerinkconnection);

            command.Parameters.AddWithValue("Name", textBox12.Text);
            command.Parameters.AddWithValue("Quantity", textBox13.Text);
            command.Parameters.AddWithValue("Cost", textBox14.Text);
            command.Parameters.AddWithValue("Responsible", comboBox3.SelectedValue);

            MessageBox.Show(command.ExecuteNonQuery().ToString("Данi внесено!"));
        }

        private void button12_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand($"INSERT INTO [Receipt] (Number, Information) VALUES (@Number, @Information)", icerinkconnection);

            command.Parameters.AddWithValue("Number", textBox15.Text);
            command.Parameters.AddWithValue("Information", comboBox4.SelectedValue);

            MessageBox.Show(command.ExecuteNonQuery().ToString("Данi внесено!"));
        }

        private void button13_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand($"INSERT INTO [ReceiptDetails] (Number, PriceList, Equipment, Instructor) VALUES (@Number, @PriceList, @Equipment, @Instructor)", icerinkconnection);

            command.Parameters.AddWithValue("Number", comboBox5.SelectedValue);
            command.Parameters.AddWithValue("PriceList", comboBox6.SelectedValue);
            command.Parameters.AddWithValue("Equipment", comboBox7.SelectedValue);
            command.Parameters.AddWithValue("Instructor", comboBox8.SelectedValue);

            MessageBox.Show(command.ExecuteNonQuery().ToString("Данi внесено!"));
        }

        private void textBox16_TextChanged(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter($"Select sf.Name as 'Імена співробітників', sf.Surname as 'Прізвище', sf.PhoneNumber as 'Номер телефону', sub.KindOfActivity as 'Вид діяльності', cast(sub.Salary as varchar)as 'Зарплата' from Staff sf inner join Subdivision sub on sf.KindOfActivity = sub.SubID where PhoneNumber LIKE '%{textBox16.Text}%'", icerinkconnection);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            dataGridView2.DataSource = dataSet.Tables[0];
        }

        private void button14_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("p_seans", icerinkconnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date", dateTimePicker1.Value);
            cmd.Parameters.AddWithValue("@kind", comboBox9.SelectedValue);
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            adapter.SelectCommand = cmd;
            adapter.Fill(ds);
            dataGridView3.DataSource = ds.Tables[0];
        }

        private void comboBox10_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("p_equipment", icerinkconnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", comboBox10.SelectedValue);
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            adapter.SelectCommand = cmd;
            adapter.Fill(ds);
            dataGridView3.DataSource = ds.Tables[0];
        }
    }
}

