namespace DiccionarioChino
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

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
