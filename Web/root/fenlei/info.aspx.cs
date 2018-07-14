using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tc.Common;

namespace Tc.Web.root.fenlei
{
    public partial class info : Common.AdminBase
    {
        public string types = "";
        public int id = 0;
        public string tupian = "", tupian2 = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"].GetInt();
            types = Request.QueryString["types"].GetString();
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            if (id > 0)
            {
                using (MAction action = new MAction("TcFenlei"))
                {
                    if (action.Fill(id))
                    {
                        action.UI.SetAutoPrefix("txt", "txt_", "ddl_");
                        action.UI.SetToAll(this);

                        //txtUrl.Text = action.Data["url"].GetString();

                        if (action.Data["Tupian"].GetString().Length > 0)
                            tupian = LibFile.get_img(action.Data["Tupian"].GetString(), "", "");

                        if (action.Data["SeoTitle"].GetString().Length > 0)
                            tupian2 = LibFile.get_img(action.Data["SeoTitle"].GetString(), "", "");
                    }
                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (txt_Name.Text.Trim().Length > 0)
            {
                using (MAction action = new MAction("TcFenlei"))
                {
                    action.UI.SetAutoPrefix("txt", "txt_", "ddl_");
                    action.Data.Set("types", types);
                    //action.Data.Set("url", txtUrl.Text);

                    if (filefm.HasFile)
                    {
                        action.Set("Tupian", LibFile.ProcessTupian(filefm));
                    }

                    if (filefm2.HasFile)
                    {
                        action.Set("SeoTitle", LibFile.ProcessTupian(filefm2));
                    }

                    if (id > 0)
                    {
                        action.Update("id=" + id, true);
                    }
                    else
                    {
                        action.Insert(true);
                    }
                    LibCache.remove();
                    alert("保存成功", "list.aspx?types=" + types);
                }
            }
            else
            {
                alert("请输入名称！");
            }
        }
    }
}