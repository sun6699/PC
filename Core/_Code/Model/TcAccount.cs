using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tc.Model
{
    public class TcAccount : CYQ.Data.Orm.OrmBase
    {
        public TcAccount()
        {
            base.SetInit(this, "TcAccount", "Conn");

            _id = 0;
            _leixing = 0;
            _fenleiid = 0;
            _jine = 0;
            _kehumc = "";
            _zhanghuid = 0;
            _shijian = new DateTime(1900, 1, 1);
            _rukusj = new DateTime(1900, 1, 1);
            _yue = 0;
            _userid = 0;
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
        /// Fid
        /// </summary>
        private int _userid;
        public int Userid
        {
            get { return _userid; }
            set { _userid = value; }
        }
        /// <summary>
        /// Leixing
        /// </summary>
        private int _leixing;
        public int Leixing
        {
            get { return _leixing; }
            set { _leixing = value; }
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
        /// Jine
        /// </summary>
        private decimal _jine;
        public decimal Jine
        {
            get { return _jine; }
            set { _jine = value; }
        }

        /// <summary>
        /// KehuMc
        /// </summary>
        private string _kehumc;
        public string KehuMc
        {
            get { return _kehumc; }
            set { _kehumc = value; }
        }

        /// <summary>
        /// Zhanghuid
        /// </summary>
        private int _zhanghuid;
        public int Zhanghuid
        {
            get { return _zhanghuid; }
            set { _zhanghuid = value; }
        }
        /// <summary>
        /// Shijian
        /// </summary>
        private DateTime _shijian;
        public DateTime Shijian
        {
            get { return _shijian; }
            set { _shijian = value; }
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
        /// <summary>
        /// Yue
        /// </summary>
        private decimal _yue;
        public decimal Yue
        {
            get { return _yue; }
            set { _yue = value; }
        }
    }
}
