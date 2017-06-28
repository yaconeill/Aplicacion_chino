namespace DiccionarioChino
{
    using System.ComponentModel.DataAnnotations;

    public partial class PalabrasSuplementaria
    {
        public int Id { get; set; }

        [StringLength(255)]
        public string headword { get; set; }

        [StringLength(255)]
        public string pron { get; set; }

        [StringLength(255)]
        public string defn { get; set; }
    }
}
