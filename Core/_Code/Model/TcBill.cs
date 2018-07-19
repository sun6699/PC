using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tc.Model
{
    public class TcBill : CYQ.Data.Orm.OrmBase
    {
        public TcBill()
        {
            base.SetInit(this, "TcZhanghu", "Conn");

            _id = 0;
            _leixing = 0;
            _name = "";
            _zhanghao = "";
            _chushijine = 0;
            _yue = 0;
            _rukusj = new DateTime(1900, 1, 1);
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
        /// ID
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
        /// Name
        /// </summary>
        private string _name;
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        /// <summary>
        /// Zhanghao
        /// </summary>
        private string _zhanghao;
        public string Zhanghao
        {
            get { return _zhanghao; }
            set { _zhanghao = value; }
        }
        /// <summary>
        /// ChushiJine
        /// </summary>
        private decimal _chushijine;
        public decimal ChushiJine
        {
            get { return _chushijine; }
            set { _chushijine = value; }
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
        /// <summary>
        /// Beizhu
        /// </summary>
        private string _beizhu;
        public string Beizhu
        {
            get { return _beizhu; }
            set { _beizhu = value; }
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
