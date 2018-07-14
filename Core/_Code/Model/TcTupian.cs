using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Tc.Model
{
    //TcTupian
    public partial class TcTupian : CYQ.Data.Orm.OrmBase
    {
        public TcTupian()
        {
            base.SetInit(this, "TcTupian", "Conn");

            _id = 0;
            _tabname = "";
            _fid = 0;
            _fenleiid = 0;
            _name = "";
            _url = "";
            _paixu = 0;
            _rukusj = new DateTime(1900, 1, 1);
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
        /// TabName
        /// </summary>
        private string _tabname;

        public string TabName
        {
            get { return _tabname; }
            set { _tabname = value; }
        }

        /// <summary>
        /// Fid
        /// </summary>
        private int _fid;

        public int Fid
        {
            get { return _fid; }
            set { _fid = value; }
        }

        /// <summary>
        /// Fenleiid
        /// </summary>
        private int _fenleiid;

        public int Fenleiid
        {
            get { return _fenleiid; }
            set { _fenleiid = value; }
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
        /// Url
        /// </summary>
        private string _url;

        public string Url
        {
            get { return _url; }
            set { _url = value; }
        }

        /// <summary>
        /// Paixu
        /// </summary>
        private int _paixu;

        public int Paixu
        {
            get { return _paixu; }
            set { _paixu = value; }
        }

        /// <summary>
        /// RukuSj
        /// </summary>
        private DateTime _rukusj;

        public DateTime RukuSj
        {
            get { return _rukusj; }
            set { _rukusj = value; }
        }
    }
}