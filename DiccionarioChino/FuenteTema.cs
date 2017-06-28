namespace DiccionarioChino
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("FuenteTema")]
    public partial class FuenteTema
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FuenteTema()
        {
            FuenteTema1 = new HashSet<FuenteTema>();
            FuenteTema11 = new HashSet<FuenteTema>();
        }

        public int Id { get; set; }

        public int IdFuente { get; set; }

        public int IdTema { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FuenteTema> FuenteTema1 { get; set; }

        public virtual FuenteTema FuenteTema2 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FuenteTema> FuenteTema11 { get; set; }

        public virtual FuenteTema FuenteTema3 { get; set; }
    }
}
