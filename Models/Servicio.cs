using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace prueba.Models;

public partial class Servicio
{
    public uint Id { get; set; }

    [Required]

    public string Nombre { get; set; } = null!;

    public uint Precio { get; set; }

    public string Sku { get; set; } = null!;

    public int Estado { get; set; }

    public uint UsuarioId { get; set; }

    public virtual ICollection<Descripcionservicio> Descripcionservicios { get; set; } = new List<Descripcionservicio>();

    public virtual ICollection<Recepcionequipo> Recepcionequipos { get; set; } = new List<Recepcionequipo>();

    public virtual Usuario Usuario { get; set; } = null!;
}
