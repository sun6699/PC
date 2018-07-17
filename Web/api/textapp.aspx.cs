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
    public partial class textapp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable().AddColumn("status").AddColumn("msg").AddColumn("result");
            DataRow dr = dt.NewRow();
            dr["status"] = 99;
            dr["msg"] = "100";
            dr["result"] = null;

            DataTable dt2 = new DataTable().AddColumn("Name").AddColumn("Pwd");
            DataRow dr2 = dt2.NewRow();
            dr2["Name"] = "sun123";
            dr2["Pwd"] = "123456";
            dt2.Rows.Add(dr2);
            string result = Tc.Core.Common.ProPublic.ToJson(dt2);

            dr["result"] = result;
            dt.Rows.Add(dr);

            string json = Tc.Core.Common.ProPublic.ToJson2(dt);
            json = "{\"status\":\"99\",\"msg\":\"100\",\"result\":[{\"Name\":\"sun123\",\"Pwd\":\"123456\"}]}";
            Response.Write(json);
        }
    }
}