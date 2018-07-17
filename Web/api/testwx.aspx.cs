using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tc.Web.api
{
    public partial class testwx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetInfo()
        {
            DataTable dt = new DataTable().AddColumn("ID").AddColumn("Name").AddColumn("Info");
            DataRow dr = dt.NewRow();
            dr["ID"] = "1";
            dr["Name"] = "赵";
            dr["Info"] = "zhao@qq.com";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["ID"] = "2";
            dr["Name"] = "钱";
            dr["Info"] = "qian@qq.com";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["ID"] = "3";
            dr["Name"] = "孙";
            dr["Info"] = "sun@qq.com";
            dt.Rows.Add(dr);

            string json = Tc.Core.Common.ProPublic.ToJson(dt);
            return json;
        }
    }
}