using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace Tc.Common
{
    public class LibFile
    {
        public static string rootpath = "/upload/";

        /// <summary>
        /// 图片转换为带有尺寸路径的图片
        /// </summary>
        /// <param name="imgpath">数据库内存入的路径(格式为 201211/_文件名称)</param>
        /// <param name="width">可以留空</param>
        /// <param name="height">可以留空</param>
        /// <returns></returns>
        public static string get_img(string imgpath, string width, string height)
        {
            if (imgpath.Length > 0)
            {
                if (width.Length <= 0 && height.Length <= 0)
                {
                    return rootpath + imgpath;
                }
                else
                {
                    var res = rootpath + imgpath.Replace("/", "/" + width + height + "_");
                    var server = HttpContext.Current.Server;
                    if (!File.Exists(server.MapPath(res)))
                    {
                        if (File.Exists(server.MapPath(rootpath + imgpath)))
                            new ProcessImage().CreateThumbnail(server.MapPath(rootpath + imgpath), server.MapPath(res), width.GetInt(), height.GetInt(), false);
                    }
                    return res;
                }
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 获取原图
        /// </summary>
        /// <param name="imgpath"></param>
        /// <returns></returns>
        public static string get_img_y(string imgpath)
        {
            if (imgpath.Length > 0)
            {
                var res = rootpath + imgpath.Replace("/", "/y_");
                var server = HttpContext.Current.Server;
                return res;
            }

            else
            {
                return "";
            }
        }

        #region 处理上传文件

        /// <summary>
        /// postfile 处理
        /// </summary>
        /// <param name="postfile"></param>
        /// <returns></returns>
        public static string ProcessTupian(HttpPostedFile postfile)
        {
            var resfile = "";
            string path = LibFile.rootpath;
            string filename = "";
            var sj = DateTime.Now.ToString("yyyyMM");
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path + sj)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path + sj));
            }
            try
            {
                path = path + sj + "/";
                FileInfo file = new FileInfo(postfile.FileName);
                string ext = file.Extension;
                Random rd = new Random();
                var randomname = DateTime.Now.ToString("ddHHmmss") + rd.Next(100000, 200000);
                filename = randomname + ext;

                ProcessImage p = new ProcessImage();

                //0:创建缩略图失败，1：传入的文件格式错误，2：创建成功
                int r = p.CreateThumbnail(postfile, HttpContext.Current.Server.MapPath(path + filename));
                if (r == 2)
                {
                    #region 创建缩略图成功的情况下，在保存原图

                    postfile.SaveAs(HttpContext.Current.Server.MapPath(path + "y_" + filename));

                    #endregion 创建缩略图成功的情况下，在保存原图
                }
                else
                {
                    try
                    {
                        File.Delete(HttpContext.Current.Server.MapPath(path + sj + "/y_" + filename));
                    }
                    catch { }
                }
                if (r == 2)
                {
                    resfile = sj + "/" + filename;
                }
            }
            catch
            {
            }

            return resfile;
        }

        /// <summary>
        /// FineUI.FileUpload 图片处理
        /// </summary>
        /// <param name="filefm"></param>
        /// <returns></returns>
        public static string ProcessTupian(FileUpload filefm)
        {
            var resfile = "";
            string path = LibFile.rootpath;
            string filename = "";
            var sj = DateTime.Now.ToString("yyyyMM");
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path + sj)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path + sj));
            }
            try
            {
                path = path + sj + "/";
                FileInfo file = new FileInfo(filefm.FileName);
                string ext = file.Extension;
                Random rd = new Random();
                var randomname = DateTime.Now.ToString("ddHHmmss") + rd.Next(100000, 200000);
                filename = randomname + ext;

                filefm.SaveAs(HttpContext.Current.Server.MapPath(path + "y_" + filename));

                ProcessImage p = new ProcessImage();

                //0:创建缩略图失败，1：传入的文件格式错误，2：创建成功
                int r = p.CreateThumbnail(HttpContext.Current.Server.MapPath(path + "y_" + filename), HttpContext.Current.Server.MapPath(path + filename));
                if (r == 2)
                {
                }
                else
                {
                    try
                    {
                        File.Delete(HttpContext.Current.Server.MapPath(path + "y_" + filename));
                    }
                    catch { }
                }
                if (r == 2)
                {
                    resfile = sj + "/" + filename;
                }
            }
            catch
            {
            }

            return resfile;
        }

        /// <summary>
        /// FineUI.FileUpload 图片处理
        /// </summary>
        /// <param name="filefm"></param>
        /// <returns></returns>
        public static string ProcessFile(FileUpload filefm)
        {
            var resfile = "";
            string path = LibFile.rootpath;
            string filename = "";
            var sj = DateTime.Now.ToString("yyyyMM");
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path + sj)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path + sj));
            }
            try
            {
                path = path + sj + "/";
                FileInfo file = new FileInfo(filefm.FileName);
                string ext = file.Extension;
                Random rd = new Random();
                var randomname = DateTime.Now.ToString("ddHHmmss") + rd.Next(100000, 200000);
                filename = randomname + ext;

                filefm.SaveAs(HttpContext.Current.Server.MapPath(path + filename));

                resfile = sj + "/" + filename;
            }
            catch
            {
            }

            return resfile;
        }

        #endregion 处理上传文件

        public static Model.TcTupian ProcessModelTupian(HttpPostedFile postfile)
        {
            var mdtp = new Model.TcTupian();
            var resfile = "";
            string path = LibFile.rootpath;
            string filename = "";
            string yuanshiname = "";//原始文件名
            var sj = DateTime.Now.ToString("yyyyMM");
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path + sj)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path + sj));
            }
            try
            {
                path = path + sj + "/";
                FileInfo file = new FileInfo(postfile.FileName);
                string ext = file.Extension;
                Random rd = new Random();
                var randomname = DateTime.Now.ToString("ddHHmmss") + rd.Next(100000, 200000);
                filename = randomname + ext;
                yuanshiname = file.Name.Replace(file.Extension, "");

                postfile.SaveAs(HttpContext.Current.Server.MapPath(path + "y_" + filename));

                ProcessImage p = new ProcessImage();

                //0:创建缩略图失败，1：传入的文件格式错误，2：创建成功
                int r = p.CreateThumbnail(HttpContext.Current.Server.MapPath(path + "y_" + filename), HttpContext.Current.Server.MapPath(path + filename));
                if (r == 2)
                {
                }
                else
                {
                    try
                    {
                        File.Delete(HttpContext.Current.Server.MapPath(path + "y_" + filename));
                    }
                    catch { }
                }
                if (r == 2)
                {
                    resfile = sj + "/" + filename;
                }
            }
            catch
            {
            }

            mdtp.Name = yuanshiname;
            mdtp.Url = resfile;

            return mdtp;
        }
    }
}