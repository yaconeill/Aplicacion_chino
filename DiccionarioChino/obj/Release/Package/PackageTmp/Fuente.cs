namespace DiccionarioChino
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Fuente")]
    public partial class Fuente
    {
        public int Id { get; set; }

        [Column("Fuente")]
        [Required]
        [StringLength(150)]
        public string Fuente1 { get; set; }
    }
}
