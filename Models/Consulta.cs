using System;

namespace SisCaVet.Models
{
    public class Consulta
    {
        public int Id { get; set; }
        public Veterinario  Veterinario { get; set; }
        public Cliente Cliente { get; set; }
        public Animal Animal { get; set; }
        public Procedimento Procedimento { get; set; }
        public DateTime Data { get; set; }
        public string Descricao { get; set; }
        public int Status { get; set; }
    }
}