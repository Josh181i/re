using Microsoft.AspNetCore.Mvc;
using System.Text;
using Tecmave.Api.Models;
using Tecmave.Api.Services;

namespace Tecmave.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class FacturasController : Controller
    {
        private readonly FacturasService _FacturasService;

        public FacturasController(FacturasService FacturasService)
        {
            _FacturasService = FacturasService;
        }

        //Apis GET, POST, PUT   y DELETE
        [HttpGet]
        public ActionResult<IEnumerable<FacturasModel>> GetFacturasModel([FromQuery] DateTime? fecha, [FromQuery] int? clienteId)
        {
            if (fecha.HasValue || clienteId.HasValue)
            {
                return _FacturasService.GetFacturasByFilter(fecha, clienteId);
            }
            else
            {
                return _FacturasService.GetFacturasModel();
            }
        }

        [HttpGet("export")]
        public IActionResult Export([FromQuery] int? month, [FromQuery] int? clienteId, [FromQuery] string status)
        {
            var facturas = _FacturasService.GetFacturasForReport(month, clienteId, status);
            var builder = new StringBuilder();
            builder.AppendLine("id_factura,cliente_id,servicio_id,fecha_emision,total,metodo_pago,status");

            foreach (var factura in facturas)
            {
                builder.AppendLine($"{factura.id_factura},{factura.cliente_id},{factura.servicio_id},{factura.fecha_emision},{factura.total},{factura.metodo_pago},{factura.status}");
            }

            return File(Encoding.UTF8.GetBytes(builder.ToString()), "text/csv", "facturas.csv");
        }

        [HttpGet("{id}")]
        public ActionResult<FacturasModel> GetById(int id)
        {
            return _FacturasService.GetByid_factura(id);
        }

        //Apis POST
        [HttpPost]
        public ActionResult<FacturasModel> AddFacturas(FacturasModel FacturasModel)
        {

            var newFacturasModel = _FacturasService.AddFacturas(FacturasModel);

            return
                CreatedAtAction(
                        nameof(GetFacturasModel), new
                        {
                            id = newFacturasModel.id_factura,
                        },
                        newFacturasModel);

        }

        //APIS PUT
        [HttpPut]
        public IActionResult UpdateFacturas(FacturasModel FacturasModel)
        {

            if (!_FacturasService.UpdateFacturas(FacturasModel))
            {
                return NotFound(
                        new
                        {
                            elmsneaje = "La  factura no fue encontrado"
                        }
                    );
            }

            return NoContent();

        }

        //APIS DELETE
        [HttpDelete]
        public IActionResult DeleteFacturasModel(int id)
        {

            if (!_FacturasService.DeleteFacturas(id))
            {
                return NotFound(
                        new
                        {
                            elmsneaje = "La  factura no fue encontrado"
                        }
                    );
            }

            return NoContent();

        }

    }
}
