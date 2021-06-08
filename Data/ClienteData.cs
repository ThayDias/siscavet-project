using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SisCaVet.Models;

namespace SisCaVet.Data
{
    public class ClienteData : Data 
    {
        public List<Cliente> Read()
        {
            List<Cliente> lista = new List<Cliente>();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = "SELECT * FROM Clientes";
        
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                Cliente c = new Cliente();

                c.Id =  (int)reader["Id"];
                c.Nome = (string)reader["Nome"];
                c.Cpf = (string)reader["Cpf"];
                c.Rg = (string)reader["Rg"];
                c.DataNascimento = (DateTime)reader["DataNascimento"];
                c.Telefone = (string)reader["Telefone"];
                c.Longadouro = (string)reader["Longadouro"];
                c.Bairro = (string)reader["Bairro"];
                c.Cep = (string)reader["Cep"];
                c.Cidade = (string)reader["Cidade"];
                c.Estado = (string)reader["Estado"];
                c.QuantidadeConsultasAberto = (int)reader["QuantidadeConsultasAberto"];                
                c.Status = (int)reader["Status"];           
               
                lista.Add(c);
            }

            return lista;
        }

        public void Create(Cliente e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;

            cmd.CommandText = @"EXEC CadCli @nome, @cpf, @rg, @dataNascimento, @telefone, 
            @longadouro, @bairro, @cep, @cidade, @estado, @quant, @status";

            cmd.Parameters.AddWithValue("@nome", e.Nome);
            cmd.Parameters.AddWithValue( "@cpf", e.Cpf);
            cmd.Parameters.AddWithValue( "@rg", e.Rg);
            cmd.Parameters.AddWithValue( "@dataNascimento", e.DataNascimento);
            cmd.Parameters.AddWithValue( "@telefone", e.Telefone);
            cmd.Parameters.AddWithValue( "@longadouro", e.Longadouro);
            cmd.Parameters.AddWithValue( "@bairro", e.Bairro);
            cmd.Parameters.AddWithValue( "@cep", e.Cep);
            cmd.Parameters.AddWithValue( "@cidade", e.Cidade);
            cmd.Parameters.AddWithValue( "@estado", e.Estado);
            cmd.Parameters.AddWithValue( "@quant", e.QuantidadeConsultasAberto);
            cmd.Parameters.AddWithValue( "@status", e.Status);

            cmd.ExecuteNonQuery();
        }
        
        public void Delete(int id)
        {
            var status = 0;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = @"EXEC AltCli SET Status = @status, 
            WHERE Id = @id";

            cmd.Parameters.AddWithValue( "@id", id);
            cmd.Parameters.AddWithValue( "@status", status);
            cmd.ExecuteNonQuery();
        }

        public Cliente Read(int id)
        {
            Cliente c = null;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = @"SELECT * FROM Clientes WHERE Id = @id";

                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    c = new Cliente
                    {
                        Id = (int)reader["Id"], 
                        Nome = (int)reader["Nome"], 
                        Cpf = (int)reader["Cpf"], 
                        Rg = (int)reader["Rg"], 
                        DataNascimento = (int)reader["DataNascimento"], 
                        Telefone = (int)reader["Telefone"], 
                        Longadouro = (int)reader["Longadouro"], 
                        Bairro = (int)reader["Bairro"], 
                        Cep = (int)reader["Cep"], 
                        Cidade = (int)reader["Cidade"], 
                        Estado = (int)reader["Estado"], 
                        QuantidadeConsultasAberto = (int)reader["QuantidadeConsultasAberto"], 
                        Status = (int)reader["Status"]                        
                    };
                   
                }

            return c;
        }
    
        public void Update (Cliente e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = @"EXEC AltCli SET Nome = @nome, 
                                                    Cpf = @cpf, 
                                                    Rg = @rg, 
                                                    DataNascimento = @dataNasc, 
                                                    Telefone = @telefone, 
                                                    Longadouro = @longadouro, 
                                                    Bairro = @bairro, 
                                                    Cep = @cep, 
                                                    Cidade = @cidade, 
                                                    Estado = @estado,
                                                    QuantidadeConsultasAberto = @quant WHERE Id = @id";
            
            cmd.Parameters.AddWithValue("@nome", e.Nome);
            cmd.Parameters.AddWithValue( "@cpf", e.Cpf);
            cmd.Parameters.AddWithValue( "@rg", e.Rg);
            cmd.Parameters.AddWithValue( "@dataNascimento", e.DataNascimento);
            cmd.Parameters.AddWithValue( "@telefone", e.Telefone);
            cmd.Parameters.AddWithValue( "@longadouro", e.Longadouro);
            cmd.Parameters.AddWithValue( "@bairro", e.Bairro);
            cmd.Parameters.AddWithValue( "@cep", e.Cep);
            cmd.Parameters.AddWithValue( "@cidade", e.Cidade);
            cmd.Parameters.AddWithValue( "@estado", e.Estado);
            cmd.Parameters.AddWithValue( "@quant", e.QuantidadeConsultasAberto);
            cmd.Parameters.AddWithValue( "@status", e.Status);

            cmd.ExecuteNonQuery();

        }

    }   

}