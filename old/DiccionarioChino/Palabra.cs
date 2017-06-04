namespace DiccionarioChino
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Palabra
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Palabra()
        {
            TemaPalabras = new HashSet<TemaPalabra>();
        }

        public int Id { get; set; }

        [StringLength(255)]
        public string headword { get; set; }

        [StringLength(255)]
        public string pron { get; set; }

        [StringLength(255)]
        public string defn { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TemaPalabra> TemaPalabras { get; set; }
    }
}
