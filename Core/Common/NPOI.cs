using System;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using NPOI.HSSF.UserModel;

namespace Tc.Core.Common
{
    public class NPOI
    {
        #region 模板导出
        public static void DownloadExcel(string reportName, DataTable dt, string exportTemplatePath)
        {
            Stream s = RenderDataTableToExcel(dt, exportTemplatePath);
            if (s != null)
            {
                MemoryStream ms = s as MemoryStream;
                HttpContext.Current.Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}.xls", HttpUtility.UrlEncode(DateTime.Now.ToString("yyyy-MM-dd"), System.Text.Encoding.UTF8)));
                HttpContext.Current.Response.BinaryWrite(ms.ToArray());
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();
                ms.Close();
                ms.Dispose();
            }
            else
                HttpContext.Current.Response.Write("出错，无法下载！");
        }

        public static Stream RenderDataTableToExcel(DataTable sourceTable, string exportTemplatePath)
        {
            HSSFWorkbook workbook = null;
            MemoryStream ms = null;
            ISheet sheet = null;
            string templetFileName = HttpContext.Current.Server.MapPath(exportTemplatePath);
            FileStream file = new FileStream(templetFileName, FileMode.Open, FileAccess.Read);
            workbook = new HSSFWorkbook(file);
            try
            {
                ms = new MemoryStream();
                sheet = workbook.GetSheet("Sheet1");
                int rowIndex = sheet.LastRowNum;
                ICellStyle style = workbook.CreateCellStyle();
                IFont font = workbook.CreateFont();
                font.FontHeightInPoints = 12;
                font.FontName = "宋体";
                style.SetFont(font);
                foreach (DataRow row in sourceTable.Rows)
                {
                    IRow dataRow = sheet.CreateRow(rowIndex + 1);
                    foreach (DataColumn column in sourceTable.Columns)
                    {
                        dataRow.CreateCell(column.Ordinal).SetCellValue(row[column].ToString());
                        dataRow.RowStyle = style;
                    }
                    ++rowIndex;
                }

                //列宽自适应，只对英文和数字有效
                for (int i = 0; i <= sourceTable.Columns.Count; ++i)
                    sheet.AutoSizeColumn(i);
                workbook.Write(ms);
                ms.Flush();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ms.Close();
                sheet = null;
                workbook = null;
            }
            return ms;
        }
        #endregion 模板导出
    }
}
