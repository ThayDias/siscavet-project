using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SisCaVet.Models;
using SisCaVet.Data;


namespace SisCaVet.Data
{
    public class VeterinarioData : Data
    {        
        public List<Veterinario> Read()
        {
            List<Veterinario> lista = new List<Veterinario>();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = "SELECT * FROM Veterinarios";
        
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                Veterinario v = new Veterinario();

                v.Id =  (int)reader["Id"];
                v.Nome = (string)reader["Nome"];
                v.Cpf = (string)reader["Cpf"];
                v.Rg = (string)reader["Rg"];
                v.DataNascimento = (DateTime)reader["DataNascimento"];
                v.Telefone = (string)reader["Telefone"];
                v.Longadouro = (string)reader["Longadouro"];
                v.Bairro = (string)reader["Bairro"];
                v.Cep = (string)reader["Cep"];
                v.Cidade = (string)reader["Cidade"];
                v.Estado = (string)reader["Estado"];
                v.Especialidade = (string)reader["Especialidade"];
                v.Salario = (decimal)reader["Salario"];
                v.Crmv = (int)reader["Crmv"];
                v.Status = (int)reader["Status"];           
                
                lista.Add(c);
            }

            return lista;
        }

        public void Create(Veterinario e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;

            cmd.CommandText = @"EXEC cadVet @nome, @cpf, @rg, @dataNascimento, @telefone, 
            @longadouro, @bairro, @cep, @cidade, @estado, @especialidade, @salario, @crmv, @status";

            cmd.Parameters.AddWithValue("@nome", e.Nome);
            cmd.Parameters.AddWithValue("@cpf", e.Cpf);
            cmd.Parameters.AddWithValue("@rg", e.Rg);
            cmd.Parameters.AddWithValue("@dataNascimento", e.DataNascimento);
            cmd.Parameters.AddWithValue("@telefone", e.Telefone);
            cmd.Parameters.AddWithValue("@longadouro", e.Longadouro);
            cmd.Parameters.AddWithValue("@bairro", e.Bairro);
            cmd.Parameters.AddWithValue("@cep", e.Cep);
            cmd.Parameters.AddWithValue("@cidade", e.Cidade);
            cmd.Parameters.AddWithValue("@estado", e.Estado);
            cmd.Parameters.AddWithValue("@especialidade", e.Especialidade);
            cmd.Parameters.AddWithValue("@salario", e.salario);
            cmd.Parameters.AddWithValue("@crmv", e.Crmv);
            cmd.Parameters.AddWithValue("@status", e.Status);

            cmd.ExecuteNonQuery();
        }
        
        public void Delete(int id)
        {
            var status = 0;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = @"EXEC altVet SET Status = @status, 
            WHERE Id = @id";

            cmd.Parameters.AddWithValue( "@id", id);
            cmd.Parameters.AddWithValue( "@status", status);
            cmd.ExecuteNonQuery();
        }

        public Veterinario Read(int id)
        {
            Veterinario c = null;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = @"SELECT * FROM Veterinarios WHERE Id = @id";

                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    c = new Veterinario
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
                        Especialidade = (string)reader["Especialidade"],
                        Salario = (decimal)reader["Salario"],
                        Crmv = (int)reader["Crmv"],
                        Status = (int)reader["Status"]                        
                    };                   
                }

            return c;
        }
    
        public void Update (Veterinario e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = @"EXEC AltVet SET Nome = @nome, 
                                                Cpf = @cpf, 
                                                Rg = @rg, 
                                                DataNascimento = @dataNasc, 
                                                Telefone = @telefone, 
                                                Longadouro = @longadouro, 
                                                Bairro = @bairro, 
                                                Cep = @cep, 
                                                Cidade = @cidade, 
                                                Estado = @estado,
                                                Especialidade = @especialidade,
                                                Salario = @salario,
                                                Crmv = @crmv WHERE Id = @id";
            
            cmd.Parameters.AddWithValue("@nome", e.Nome);
            cmd.Parameters.AddWithValue("@cpf", e.Cpf);
            cmd.Parameters.AddWithValue("@rg", e.Rg);
            cmd.Parameters.AddWithValue("@dataNascimento", e.DataNascimento);
            cmd.Parameters.AddWithValue("@telefone", e.Telefone);
            cmd.Parameters.AddWithValue("@longadouro", e.Longadouro);
            cmd.Parameters.AddWithValue("@bairro", e.Bairro);
            cmd.Parameters.AddWithValue("@cep", e.Cep);
            cmd.Parameters.AddWithValue("@cidade", e.Cidade);
            cmd.Parameters.AddWithValue("@estado", e.Estado);
            cmd.Parameters.AddWithValue("@especialidade", e.Especialidade);
            cmd.Parameters.AddWithValue("@salario", e.salario);
            cmd.Parameters.AddWithValue("@crmv", e.Crmv);
            cmd.Parameters.AddWithValue("@status", e.Status);

            cmd.ExecuteNonQuery();

        }

    }   

}





