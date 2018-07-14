using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tc.Common
{
    public class Lib
    {
        public static string zanwutp = "/images/zanwu.jpg";

        /// <summary>
        /// 获取时间
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public static string get_sj(DateTime? dt, string format = "yyyy-MM-dd")
        {
            var res = "";
            if (dt.HasValue)
            {
                if (dt.GetDateTime().ToString("yyyy-MM-dd") == "1900-01-01")
                {
                    res = "";
                }
                else
                {
                    return dt.GetDateTime().ToString(format);
                }
            }
            return res;
        }
    }
}