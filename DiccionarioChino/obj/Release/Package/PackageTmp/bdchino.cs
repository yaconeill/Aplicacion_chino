namespace DiccionarioChino
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class bdchino : DbContext
    {
        public bdchino()
            : base("name=bdchino")
        {
        }

        public virtual DbSet<Fuente> Fuentes { get; set; }
        public virtual DbSet<FuenteTema> FuenteTemas { get; set; }
        public virtual DbSet<Palabra> Palabras { get; set; }
        public virtual DbSet<TemaPalabra> TemaPalabras { get; set; }
        public virtual DbSet<Tema> Temas { get; set; }
        public virtual DbSet<PalabrasSuplementaria> PalabrasSuplementarias { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FuenteTema>()
                .HasMany(e => e.FuenteTema1)
                .WithRequired(e => e.FuenteTema2)
                .HasForeignKey(e => e.IdFuente);

            modelBuilder.Entity<FuenteTema>()
                .HasMany(e => e.FuenteTema11)
                .WithRequired(e => e.FuenteTema3)
                .HasForeignKey(e => e.IdTema);

            modelBuilder.Entity<Palabra>()
                .HasMany(e => e.TemaPalabras)
                .WithRequired(e => e.Palabra)
                .HasForeignKey(e => e.IdPalabra)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tema>()
                .Property(e => e.Temas)
                .IsUnicode(false);

            modelBuilder.Entity<Tema>()
                .HasMany(e => e.TemaPalabras)
                .WithRequired(e => e.Tema)
                .HasForeignKey(e => e.IdTema)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Fuente>()
                .Property(e => e.Fuente1)
                .IsUnicode(true);
        }
    }
}
