namespace DiccionarioChino
{
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("TemaPalabra")]
    public partial class TemaPalabra
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int IdTema { get; set; }

        public int IdPalabra { get; set; }

        public virtual Palabra Palabra { get; set; }

        public virtual Tema Tema { get; set; }
    }
}
