using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Diplom
{
    public partial class MainMenu : Form
    {
        public MainMenu()
        {
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            WorkPlace fr2 = new WorkPlace();
            fr2.Show();
            Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("1. Головне меню - вiкно, на якому зображено вiтальне вiкно програми, де можна перейти до роботи з програмою, або прочитати роздiл iнструкцiї." + "\n" + "\n" +
                            "2. Основна програма - сторiнка 'Швидка вибiрка', на першiй натисканнями вiдповiдних кнопок можна вивести вiдповiднi результати." + "\n" + "\n" +
                            "3. Основна програма - сторiнка 'Заповнення даних', занесенням даних у вiдповiднi текстовi рядки та вибором у випадаючих списках данихх з-за натискання кнопки данi вносяться у вiдповiдну таблицю." + "\n" + "\n" +
                            "4. Основна програма - сторiнка 'Пошук даних', введення запрошуваних даних у текстовий рядок виконує пошук у таблицi." + "\n" + "\n" +
                            "5. Основна програма - сторiнка 'Вибiр параметрiв', обираючи декiлька параметрiв, або один, можна вивести бiльш точний пошук.");
        }


    }
}
