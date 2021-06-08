using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SisCaVet.Models;

namespace SisCaVet.Data
{
    public virtual class ProcedimentoData : Data 
    {

        public List<Procedimento> Read()
        {
            List<Procedimento> lista = new List<Procedimento>();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = "SELECT * FROM Procedimentos";
        
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                Procedimento p = new Procedimento();

                p.Id =  (int)reader["Id"];
                p.Descricao = (string)reader["Descricao"];
                p.Valor = (decimal)reader["Valor"];
                lista.Add(p);
            }

            return lista;
        }

        public void Create(Procedimento e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;

            cmd.CommandText = @"INSERT INTO Procedimentos VALUES(@desc, @valor)";

            cmd.Parameters.AddWithValue("@desc", e.Descricao);
            cmd.Parameters.AddWithValue( "@valor", e.Valor);

            cmd.ExecuteNonQuery();
        }
        
        public void Delete(int id){
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = @"DELETE FROM Procedimentos WHERE Id=@id";

            cmd.Parameters.AddWithValue( "@id", id);

            cmd.ExecuteNonQuery();
        }


        public Procedimento Read(int id)
        {
            Procedimento p = null;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = @"SELECT * FROM Procedimentos WHERE id = @id";

                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    p = new Procedimento
                    {
                        Id = (int)reader["Id"], 
                        Descricao = (string)reader["Descricao"], 
                        Valor = (decimal)reader["Valor"]
                    };
                   
                }

            return p;
        }
    
        public void Update (Procedimento e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = @"UPDATE Procedimentos SET Descricao = @desc, 
            Valor = @valor WHERE Id = @id";
            
            cmd.Parameters.AddWithValue("@desc", e.Descricao);
            cmd.Parameters.AddWithValue( "@valor", e.Valor);
            cmd.Parameters.AddWithValue("@id", e.Id);

            cmd.ExecuteNonQuery();

        }

    }   

}