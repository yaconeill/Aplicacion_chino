namespace DiccionarioChino
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

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
