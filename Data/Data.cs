using System;
using System.Data.SqlClient;

namespace SisCaVet.Data 
{
    public abstract class Data : IDisposable
    {
         protected SqlConnection connection;


        public Data()
        {
            string strConn = @"Data Source=localhost;
                                Initial Catalog=BDECommerce;
                                Integrated Security=true";
                                //Integrated Security=false user id=sa; Password=dba;

            connection = new SqlConnection(strConn);
            connection.Open();                 
        }

        public void Dispose()
        {
            connection.Close();
        }
    }
}