namespace SisCaVet.Models
{
    public class Animal
    {
       
        public int Id { get; set; }       
        public Cliente Cliente { get; set; }
        public string Nome { get; set; }
        public int Idade { get; set; }
        public decimal Peso { get; set; }
        public string Raca { get; set; }
        public string Especie { get; set; }
        public string Status {get; set;}
    }
}