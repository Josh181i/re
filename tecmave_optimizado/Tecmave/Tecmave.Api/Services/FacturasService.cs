using Tecmave.Api.Data;
using Tecmave.Api.Models;

namespace Tecmave.Api.Services
{
    public class FacturasService
    {

        private readonly AppDbContext _context;

        public FacturasService(AppDbContext context)
        {
            _context = context;
        }

        //Aca necesitamos el modelo de datos para el almacenamiento temporal
        private readonly List<FacturasModel> _canton = new List<FacturasModel>();
        private int _nextid_factura = 1;


        //funcion de obtener cantons
        public List<FacturasModel> GetFacturasModel()
        {
            return _context.factura.ToList();
        }

        public List<FacturasModel> GetFacturasByFilter(DateTime? fecha, int? clienteId)
        {
            var query = _context.factura.AsQueryable();

            if (fecha.HasValue)
            {
                query = query.Where(f => f.fecha_emision.Date == fecha.Value.Date);
            }

            if (clienteId.HasValue)
            {
                query = query.Where(f => f.cliente_id == clienteId.Value);
            }

            return query.ToList();
        }

        public List<FacturasModel> GetFacturasForReport(int? month, int? clienteId, string status)
        {
            var query = _context.factura.AsQueryable();

            if (month.HasValue)
            {
                query = query.Where(f => f.fecha_emision.Month == month.Value);
            }

            if (clienteId.HasValue)
            {
                query = query.Where(f => f.cliente_id == clienteId.Value);
            }

            if (!string.IsNullOrEmpty(status))
            {
                query = query.Where(f => f.status == status);
            }

            return query.ToList();
        }


        public FacturasModel GetByid_factura(int id)
        {
            return _context.factura.FirstOrDefault(p => p.id_factura == id);
        }

        public FacturasModel AddFacturas(FacturasModel FacturasModel)
        {
            _context.factura.Add(FacturasModel);
            _context.SaveChanges();
            return FacturasModel;
        }


        public bool UpdateFacturas(FacturasModel FacturasModel)
        {
            var entidad = _context.factura.FirstOrDefault(p => p.id_factura == FacturasModel.id_factura);

            if (entidad == null)
            {
                return false;
            }

            entidad.total = FacturasModel.total;
            entidad.metodo_pago = FacturasModel.metodo_pago;
            entidad.status = FacturasModel.status;


            _context.SaveChanges();

            return true;

        }


        public bool DeleteFacturas(int id)
        {
            var entidad = _context.factura.FirstOrDefault(p => p.id_factura == id);

            if (entidad == null)
            {
                return false;
            }

            _context.factura.Remove(entidad);
            _context.SaveChanges();
            return true;

        }


    }
}
