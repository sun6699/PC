using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Tc.Common
{
    public class LibZidian
    {
        /// <summary>
        /// 获取下拉的默认选项
        /// </summary>
        /// <returns></returns>
        public static ListItem get_default_item()
        {
            return new ListItem("--请选择--", "-1");
        }
    }
}