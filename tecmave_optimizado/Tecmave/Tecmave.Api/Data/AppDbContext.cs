using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Tecmave.Api.Models;

namespace Tecmave.Api.Data
{
    public class AppDbContext : IdentityDbContext<Usuario, AppRole, int,
        IdentityUserClaim<int>, IdentityUserRole<int>, IdentityUserLogin<int>,
        IdentityRoleClaim<int>, IdentityUserToken<int>>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<EstadosModel> estados { get; set; }
        public DbSet<TipoServiciosModel> tipo_servicios { get; set; }
        public DbSet<Vehiculo> Vehiculos { get; set; }
        public DbSet<ServiciosModel> servicios { get; set; }
        public DbSet<RevisionModel> revision { get; set; }
        public DbSet<FacturasModel> factura { get; set; }
        public DbSet<DetalleFacturaModel> detalle_factura { get; set; }

        protected override void OnModelCreating(ModelBuilder b)
        {
            base.OnModelCreating(b);

            b.Entity<Usuario>().ToTable("aspnetusers");
            b.Entity<AppRole>().ToTable("aspnetroles");

            b.Entity<IdentityUserRole<int>>(e =>
            {
                e.ToTable("aspnetuserroles");
                e.HasKey(x => new { x.UserId, x.RoleId });

                e.HasOne<Usuario>()
                    .WithMany()
                    .HasForeignKey(ur => ur.UserId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);

                e.HasOne<AppRole>()
                    .WithMany()
                    .HasForeignKey(ur => ur.RoleId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);
            });

            b.Entity<IdentityUserLogin<int>>().ToTable("aspnetuserlogins");
            b.Entity<IdentityUserToken<int>>().ToTable("aspnetusertokens");
            b.Entity<IdentityUserClaim<int>>().ToTable("aspnetuserclaims");
            b.Entity<IdentityRoleClaim<int>>().To-Table("aspnetroleclaims");

            b.Entity<AppRole>(e =>
            {
                e.Property(r => r.Description).HasMaxLength(256);
                e.Property(r => r.IsActive).HasDefaultValue(true);
            });

            b.Entity<Usuario>(b =>
            {
                b.Property(u => u.Nombre).HasMaxLength(50);
                b.Property(u => u.Apellidos).HasMaxLength(50);
            });

            b.Entity<EstadosModel>().ToTable("estados").HasKey(x => x.id_estado);
            b.Entity<TipoServiciosModel>().ToTable("tipo_servicios").HasKey(x => x.id_tipo_servicio);
            b.Entity<Vehiculo>().ToTable("vehiculos").HasKey(x => x.IdVehiculo);
            b.Entity<ServiciosModel>().ToTable("servicios").HasKey(x => x.id_servicio);
            b.Entity<RevisionModel>().ToTable("revision").HasKey(x => x.id_revision);
            b.Entity<FacturasModel>().ToTable("factura").HasKey(x => x.id_factura);
            b.Entity<DetalleFacturaModel>().ToTable("detalle_factura").HasKey(x => x.id_detalle);
        }
    }
}
