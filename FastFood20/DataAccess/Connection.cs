using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DataAccess
{
    public class Connection
    {
        private SqlConnection conection;
        private SqlCommand command;
        private SqlDataReader read;

        public Connection()
        {
            this.conection = new SqlConnection("server=.\\SQLEXPRESS; database=FASTFOOD_DB; integrated security= true");
            this.command = new SqlCommand();
        }

        public SqlDataReader Read { get { return read; } }

        public void setConsult(string consult)
        {
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = consult;
        }
        public void storedProcedureConsult(string storedProcedure)
        {
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = storedProcedure;
        }
        public void executeAction()
        {
            command.Connection = conection;

            try
            {
                conection.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void executeRead()
        {
            command.Connection = conection;

            try
            {
                conection.Open();
                read = command.ExecuteReader();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int executeActionScalar()
        {
            command.Connection = conection;
            try
            {
                conection.Open();
                return int.Parse(command.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {

                throw ex;

            }
        }
        public void closeConection()
        {
            if (read != null)
            {
                read.Close();
            }

            conection.Close();


        }
        public void SetParameter(string data, object items)
        {
            command.Parameters.AddWithValue(data, items);
        }
        public void clearParameter()
        {
            command.Parameters.Clear();

        }

    }
}
