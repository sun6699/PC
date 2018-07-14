using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Tc.UI
{
    public class Danye : UIBase
    {
        public Model.TcArticle mdy = new Model.TcArticle();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        public void LoadData()
        {
            var s = Request.QueryString["n"].GetString().FilterSql();
            if (s.Length > 0)
            {
                var type = "danye";

                var list = new Model.TcArticle().Select("types='" + type + "' and url='" + s + "'").ToList<Model.TcArticle>();
                if (list.Count > 0)
                {
                    mdy = list[0];
                }
            }
        }
    }
}