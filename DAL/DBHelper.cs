using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3LayersModel.DAL
{
    internal class DBHelper
    {
        private SqlConnection cn;

        private DBHelper(string s)
        {
            cn = new SqlConnection(s);
        }

        private static DBHelper _Instance;

        public static DBHelper Instance
        {
            get
            {
                if (_Instance == null)
                {
                    _Instance = new DBHelper(@"Data Source=DESKTOP-15ST2P9;Initial Catalog=QLSV;Integrated Security=True");
                }
                return _Instance;
            }
            private set { }
        }

        public void ExecuteDB(string query)
        {
            SqlCommand cmd = new SqlCommand(query, cn);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        //public DataTable GetRecords(string query)
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.AddRange(new DataColumn[]
        //    {
        //        new DataColumn("MSSV", typeof(string)),
        //        new DataColumn("NameSV", typeof(string)),
        //        new DataColumn("Gender", typeof(bool)),
        //        new DataColumn("NS", typeof(DateTime)),
        //        new DataColumn("IDLop", typeof(int))
        //    });
        //    SqlCommand cmd = new SqlCommand(query, cn);
        //    cn.Open();
        //    SqlDataReader r = cmd.ExecuteReader();
        //    while (r.Read())
        //    {
        //        DataRow dr = dt.NewRow();
        //        dr["MSSV"] = r["MSSV"];
        //        dr["NameSV"] = r["NameSV"];
        //        dr["Gender"] = r["Gender"];
        //        dr["NS"] = r["NS"];
        //        dr["IDLop"] = r["IDLop"];
        //        dt.Rows.Add(dr);
        //    }
        //    cn.Close();
        //    return dt;
        //}

        public DataTable GetRecords(string query)
        {
            // DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            cn.Open();
            // da.Fill(ds);
            // da.Fill(ds, "SV");
            da.Fill(dt);
            cn.Close();
            // return ds.Tables[0];
            // return ds.Tables["SV"];
            return dt;
        }
    }
}