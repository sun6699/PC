using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tc.Web
{
    public partial class contact : System.Web.UI.Page
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

        protected void btn_save_Click(object sender,EventArgs e)
        {
            if (txt_Xingming.Text.Trim()=="" || txt_Email.Text.Trim()=="" || txt_neirong.InnerText.Trim()=="")
            {
                Response.Write("<script>alert('请填写完整内容')</script>");
                return;
            }
            Model.TcLiuyan liuyanModel = new Model.TcLiuyan();
            liuyanModel.Xingming = txt_Xingming.Text.Trim();
            liuyanModel.Email = txt_Email.Text.Trim();
            liuyanModel.Dianhua = txt_Dianhua.Text.Trim();
            liuyanModel.Neirong = txt_neirong.Value.Trim();
            liuyanModel.RukuSj = DateTime.Now;
            bool flag = liuyanModel.Insert(true);
            if (flag)
            {
                Response.Write("<script>alert('发送成功')</script>");
            }
        }
    }
}