using Microsoft.AspNetCore.Identity;
using Tecmave.Api.Data;
using Tecmave.Api.Models;
using System.Threading.Tasks;

namespace Tecmave.Api.Services
{
    public class RevisionService
    {
        private const int ESTADO_FINALIZADO = 9;
        private readonly AppDbContext _context;
        private readonly FacturasService _facturasService;
        private readonly IEmailService _emailService;
        private readonly UserManager<Usuario> _userManager;

        public RevisionService(AppDbContext context, FacturasService facturasService, IEmailService emailService, UserManager<Usuario> userManager)
        {
            _context = context;
            _facturasService = facturasService;
            _emailService = emailService;
            _userManager = userManager;
        }

        //Aca necesitamos el modelo de datos para el almacenamiento temporal
        private readonly List<RevisionModel> _canton = new List<RevisionModel>();
        private int _nextId = 1;


        //funcion de obtener cantons
        public List<RevisionModel> GetRevisionModel()
        {
            return _context.revision.ToList();
        }


        public RevisionModel GetById(int id)
        {
            return _context.revision.FirstOrDefault(p => p.id_revision == id);
        }

        public RevisionModel AddRevision(RevisionModel RevisionModel)
        {
            _context.revision.Add(RevisionModel);
            _context.SaveChanges();
            return RevisionModel;
        }


        public async Task<bool> UpdateRevision(RevisionModel RevisionModel)
        {
            var entidad = _context.revision.FirstOrDefault(p => p.id_revision == RevisionModel.id_revision);

            if (entidad == null)
            {
                return false;
            }

            entidad.id_estado = RevisionModel.id_estado;
            entidad.fecha_estimada_entrega = RevisionModel.fecha_estimada_entrega;
            entidad.fecha_entrega_final = RevisionModel.fecha_entrega_final;

            if (entidad.id_estado == ESTADO_FINALIZADO)
            {
                var servicio = _context.servicios.FirstOrDefault(s => s.id_servicio == entidad.id_servicio);
                var vehiculo = _context.Vehiculos.FirstOrDefault(v => v.IdVehiculo == entidad.vehiculo_id);

                if (servicio != null && vehiculo != null)
                {
                    var factura = new FacturasModel
                    {
                        cliente_id = vehiculo.ClienteId,
                        servicio_id = entidad.id_servicio,
                        fecha_emision = DateTime.Now,
                        total = servicio.precio,
                        metodo_pago = "Pendiente",
                        status = "Pendiente"
                    };
                    _facturasService.AddFacturas(factura);

                    var cliente = await _userManager.FindByIdAsync(vehiculo.ClienteId.ToString());
                    if (cliente != null && !string.IsNullOrEmpty(cliente.Email))
                    {
                        await _emailService.SendEmailAsync(cliente.Email, "Factura de servicio", $"Se ha generado una nueva factura por el servicio de {servicio.nombre}.");
                    }
                }
            }

            _context.SaveChanges();

            return true;

        }


        public bool DeleteRevision(int id)
        {
            var entidad = _context.revision.FirstOrDefault(p => p.id_revision == id);

            if (entidad == null)
            {
                return false;
            }

            _context.revision.Remove(entidad);
            _context.SaveChanges();
            return true;

        }


    }
}
