using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using prueba.Models;
using Microsoft.AspNetCore.Authorization;

namespace prueba.Controllers
{
    [Authorize]
    public class RecepcionequiposController : Controller
    {
        private readonly MercyDeveloperContext _context;

        public RecepcionequiposController(MercyDeveloperContext context)
        {
            _context = context;
        }

        // GET: Recepcionequipos
        public async Task<IActionResult> Index()
        {
            var mercyDeveloperContext = _context.Recepcionequipos.Include(r => r.Cliente).Include(r => r.Servicio);
            return View(await mercyDeveloperContext.ToListAsync());
        }

        // GET: Recepcionequipos/Details/5
        public async Task<IActionResult> Details(uint? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var recepcionequipo = await _context.Recepcionequipos
                .Include(r => r.Cliente)
                .Include(r => r.Servicio)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (recepcionequipo == null)
            {
                return NotFound();
            }

            return View(recepcionequipo);
        }

        // GET: Recepcionequipos/Create
        public IActionResult Create()
        {
            ViewData["ClienteId"] = new SelectList(_context.Clientes, "Id", "Id");
            ViewData["ServicioId"] = new SelectList(_context.Servicios, "Id", "Id");
            return View();
        }

        // POST: Recepcionequipos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,ServicioId,ClienteId,Fecha,TipoPc,Accesorio,MarcaPc,ModeloPc,Nserie,CapacidadRam,TipoAlmacenamiento,CapacidadAlmacenamiento,TipoGpu,Grafico")] Recepcionequipo recepcionequipo)
        {
            if (ModelState.IsValid)
            {
                _context.Add(recepcionequipo);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ClienteId"] = new SelectList(_context.Clientes, "Id", "Id", recepcionequipo.ClienteId);
            ViewData["ServicioId"] = new SelectList(_context.Servicios, "Id", "Id", recepcionequipo.ServicioId);
            return View(recepcionequipo);
        }

        // GET: Recepcionequipos/Edit/5
        public async Task<IActionResult> Edit(uint? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var recepcionequipo = await _context.Recepcionequipos.FindAsync(id);
            if (recepcionequipo == null)
            {
                return NotFound();
            }
            ViewData["ClienteId"] = new SelectList(_context.Clientes, "Id", "Id", recepcionequipo.ClienteId);
            ViewData["ServicioId"] = new SelectList(_context.Servicios, "Id", "Id", recepcionequipo.ServicioId);
            return View(recepcionequipo);
        }

        // POST: Recepcionequipos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(uint id, [Bind("Id,ServicioId,ClienteId,Fecha,TipoPc,Accesorio,MarcaPc,ModeloPc,Nserie,CapacidadRam,TipoAlmacenamiento,CapacidadAlmacenamiento,TipoGpu,Grafico")] Recepcionequipo recepcionequipo)
        {
            if (id != recepcionequipo.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(recepcionequipo);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RecepcionequipoExists(recepcionequipo.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ClienteId"] = new SelectList(_context.Clientes, "Id", "Id", recepcionequipo.ClienteId);
            ViewData["ServicioId"] = new SelectList(_context.Servicios, "Id", "Id", recepcionequipo.ServicioId);
            return View(recepcionequipo);
        }

        // GET: Recepcionequipos/Delete/5
        public async Task<IActionResult> Delete(uint? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var recepcionequipo = await _context.Recepcionequipos
                .Include(r => r.Cliente)
                .Include(r => r.Servicio)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (recepcionequipo == null)
            {
                return NotFound();
            }

            return View(recepcionequipo);
        }

        // POST: Recepcionequipos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(uint id)
        {
            var recepcionequipo = await _context.Recepcionequipos.FindAsync(id);
            if (recepcionequipo != null)
            {
                _context.Recepcionequipos.Remove(recepcionequipo);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool RecepcionequipoExists(uint id)
        {
            return _context.Recepcionequipos.Any(e => e.Id == id);
        }
    }
}
