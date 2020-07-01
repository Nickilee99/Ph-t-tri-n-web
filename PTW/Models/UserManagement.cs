using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTW.Models
{
    public class UserManagement
    {
        public bool CheckUserName(string username)
        {
            Model1 db = new Model1();
            List<Account> user_finded = (from nd in db.Account where nd.Username == username select nd).ToList();
            if (user_finded.Count == 1)
            {
                return true;
            }
            else { return false; }
        }
        public bool CheckEmail(string email)
        {
            Model1 db = new Model1();
            List<Account> user_finded = (from nd in db.Account where nd.Email == email select nd).ToList();
            if (user_finded.Count == 1)
            {
                return true;
            }
            else { return false; }
        }
        public bool CheckLogin(string username, string password)
        {
            Model1 db = new Model1();
            List<Account> user_finded = (from nd in db.Account where (nd.Username == username && nd.Password == password) select nd).ToList();
            if (user_finded.Count == 1)
            {
                //Tồn tại
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}