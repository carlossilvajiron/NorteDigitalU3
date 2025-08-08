using System;
using System.Collections.Generic;

namespace prueba.Models;

public partial class Descripcionservicio
{
    public uint Id { get; set; }

    public string Nombre { get; set; } = null!;

    public uint ServicioId { get; set; }

    public virtual Servicio Servicio { get; set; } = null!;
}
