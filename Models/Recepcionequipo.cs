using System;
using System.Collections.Generic;

namespace prueba.Models;

public partial class Recepcionequipo
{
    public uint Id { get; set; }

    public uint ServicioId { get; set; }

    public uint ClienteId { get; set; }

    public DateTime Fecha { get; set; }

    public int TipoPc { get; set; }

    public string? Accesorio { get; set; }

    public string MarcaPc { get; set; } = null!;

    public string ModeloPc { get; set; } = null!;

    public string? Nserie { get; set; }

    public uint? CapacidadRam { get; set; }

    public int TipoAlmacenamiento { get; set; }

    public string CapacidadAlmacenamiento { get; set; } = null!;

    public int TipoGpu { get; set; }

    public string? Grafico { get; set; }

    public virtual Cliente Cliente { get; set; } = null!;

    public virtual Servicio Servicio { get; set; } = null!;
}
