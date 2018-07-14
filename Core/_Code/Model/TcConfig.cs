using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Tc.Model
{
    //TcConfig
    public partial class TcConfig : CYQ.Data.Orm.OrmBase
    {
        public TcConfig()
        {
            base.SetInit(this, "TcConfig", "Conn");

            _id = 0;
            _ename = "";
            _name = "";
            _types = "";
            _content = "";
        }

        /// <summary>
        /// ID
        /// </summary>
        private int _id;

        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        /// <summary>
        /// Ename
        /// </summary>
        private string _ename;

        public string Ename
        {
            get { return _ename; }
            set { _ename = value; }
        }

        /// <summary>
        /// Name
        /// </summary>
        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        /// <summary>
        /// Types
        /// </summary>
        private string _types;

        public string Types
        {
            get { return _types; }
            set { _types = value; }
        }

        /// <summary>
        /// Content
        /// </summary>
        private string _content;

        public string Content
        {
            get { return _content; }
            set { _content = value; }
        }
    }
}