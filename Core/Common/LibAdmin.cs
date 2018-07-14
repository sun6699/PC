using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Tc.Common
{
    public class LibAdmin
    {
        public static string Session_admin = "TcAdmin";
        public static string Session_admin_caozuo = "TcAdminCaozuo";

        /// <summary>
        /// 获取当前登陆的
        /// </summary>
        /// <returns></returns>
        public static Model.TcAdmin GetCurrentAdmin()
        {
            //开发方便，默认写上一个登陆用户
#if DEBUG
            var md = new Model.TcAdmin();
            md.Fill("name='admin'");
            return md;
#else
            try
            {
                if (HttpContext.Current.Session[Session_admin] == null)
                {
                    HttpContext.Current.Response.Redirect("~/root/login.aspx");
                }
                Model.TcAdmin admin = HttpContext.Current.Session[Session_admin] as Model.TcAdmin;
                if (admin == null)
                {
                    HttpContext.Current.Response.Redirect("~/root/login.aspx");
                }
                return admin;
            }
            catch
            {
                HttpContext.Current.Response.Redirect("~/root/login.aspx");
                return null;
            }
#endif
        }

        #region 获取管理员信息

        public static string get_admin_name(int id)
        {
            return get_admin(id).Name;
        }

        public static Model.TcAdmin get_admin(int id)
        {
            var m = new Model.TcAdmin();
            if (m.Fill("id=" + id))
            {
                return m;
            }
            else
            {
                new Model.TcAdmin();
            }

            return m;
        }

        #endregion 获取管理员信息
    }
}