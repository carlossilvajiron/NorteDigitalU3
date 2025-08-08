using System.ComponentModel.DataAnnotations; 

namespace prueba.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Ingresa una contraseña")]
        [DataType(DataType.Password)]
        public string Contraseña { get; set; }

        [Required(ErrorMessage = "Ingresa un email")]
        [EmailAddress(ErrorMessage = "Email invalido")]
        public string Email { get; set; }
    }
}
