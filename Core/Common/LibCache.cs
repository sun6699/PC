using CYQ.Data.Table;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Tc.Common
{
    public class LibCache
    {
        /// <summary>
        /// 缓存时间（天）
        /// </summary>
        public static int c_day = 10;

        /// <summary>
        /// 清空指定名称的缓存
        /// </summary>
        public static void remove()
        {
            HttpContext.Current.Cache.Remove(tc_fenlei);
        }

        /// <summary>
        /// 清空指定名称的缓存
        /// </summary>
        /// <param name="cache_name"></param>
        public static void remove(string cache_name)
        {
            HttpContext.Current.Cache.Remove(cache_name);
        }

        #region 分类表缓存

        /// <summary>
        /// 分类表缓存名称
        /// </summary>
        public static string tc_fenlei = "tc_fenlei";

        /// <summary>
        /// 获取分类名称
        /// </summary>
        /// <param name="bianhao"></param>
        /// <returns></returns>
        public static string get_fenlei_name(int id)
        {
            return get_fenlei(id).Name.GetString();
        }

        /// <summary>
        /// 获取datable
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public static DataTable get_fenlei_dt(string where)
        {
            return get_fenlei_mdt().ToDataTable().Where(where);
        }

        private static MDataTable get_fenlei_mdt()
        {
            var mdt = new MDataTable();
            if (HttpContext.Current.Cache[tc_fenlei] == null)
            {
                mdt = new Model.TcFenlei().Select("order by Paixu");
                HttpContext.Current.Cache.Insert(tc_fenlei, mdt, null, DateTime.Now.AddDays(c_day), TimeSpan.Zero);
                return mdt;
            }
            else
            {
                mdt = HttpContext.Current.Cache[tc_fenlei] as MDataTable;
            }
            return mdt;
        }

        public static List<Model.TcFenlei> get_fenleis()
        {
            return get_fenlei_mdt().ToList<Model.TcFenlei>();
        }

        /// <summary>
        /// 获取分类model类
        /// </summary>
        /// <param name="bianhao"></param>
        /// <returns></returns>
        public static Model.TcFenlei get_fenlei(int id)
        {
            var m = new Model.TcFenlei();
            var list = get_fenleis().Where(p => p.ID == id).ToList();

            if (list.Count > 0)
            {
                m = list[0];
            }
            return m;
        }

        /// <summary>
        /// 获取某种types的分类
        /// </summary>
        /// <param name="types"></param>
        /// <returns></returns>
        public static List<Model.TcFenlei> get_fenleis(string types)
        {
            return get_fenleis().Where(p => p.Types == types).ToList();
        }

        /// <summary>
        /// 获取分类
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        public static List<Model.TcFenlei> get_fenleis(int pid)
        {
            return get_fenleis().Where(p => p.Pid == pid).ToList();
        }

        /// <summary>
        /// 获取分类
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        public static List<Model.TcFenlei> get_fenleis(string types, int pid)
        {
            return get_fenleis().Where(p => p.Types == types && p.Pid == pid).ToList();
        }

        #endregion 分类表缓存
    }
}