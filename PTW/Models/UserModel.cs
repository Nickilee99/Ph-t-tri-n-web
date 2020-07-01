using System.ComponentModel.DataAnnotations;

namespace PTW.Models
{
    public class UserModel
    {
        [Display(Name = "User Name")]
        [Required(ErrorMessage = "User Name không được bỏ trống")]
        public string username {get; set;}
        [Display(Name = "Email")]
        [Required(ErrorMessage = "Email không được bỏ trống")]
        [EmailAddress(ErrorMessage = "Email không hợp lệ")]
        public string email { get; set; }
        [Display(Name = "Password")]
        [Required(ErrorMessage = "Password không được bỏ trống")]
        [DataType(DataType.Password)]
        public string password { get; set; }
        [Display(Name = "Confirm Password")]
        [Required(ErrorMessage = "Confirm Password không được bỏ trống")]
        [DataType(DataType.Password)]
        [Compare("password", ErrorMessage = "Password không trùng")]
        public string confirmpassword { get; set; }
        [Display(Name = "Name")]
        [Required(ErrorMessage = "Name không được bỏ trống")]
        public string name { get; set; }
        [RegularExpression(@"((09|03|05|07|08)+([0-9]{8}))", ErrorMessage = "Số điện thoại không hợp lệ!")]
        public string sdt { get; set; }
        public string address { get; set; }
    }
    public class LoginModel
    {
        [Required]
        public string username { get; set; }
        [Required]
        public string password { get; set; }
    }
}