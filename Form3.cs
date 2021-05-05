using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PBL
{
    public partial class Form3 : Form
    {
        public delegate void MyDel(int id, string ms);
        public MyDel d { get; set; }
        public Form3(string ms)
        {
            InitializeComponent();
        }
    }
}
