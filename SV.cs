using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3LayersModel.DTO
{
    public class SV
    {
        public string MSSV { get; set; }
        public string NameSV { get; set; }
        public bool Gender { get; set; }
        public DateTime NS { get; set; }
        public int ID_Lop { get; set; }

        public static bool MSSVCompare(SV s1, SV s2)
        {
            return (s1.MSSV.CompareTo(s2.MSSV) > 0);
        }

        public static bool NameCompare(SV s1, SV s2)
        {
            return (s1.NameSV.CompareTo(s2.NameSV) > 0);
        }

        public static bool NSCompare(SV s1, SV s2)
        {
            return (s1.NS.CompareTo(s2.NS) > 0);
        }

        public static bool GenderCompare(SV s1, SV s2)
        {
            return (s1.Gender.CompareTo(s2.Gender) > 0);
        }

        public static bool IDLopCompare(SV s1, SV s2)
        {
            return s1.ID_Lop > s2.ID_Lop;
        }
    }
}