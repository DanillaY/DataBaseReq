using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseReq
{
    public class User
    {
        public User(string role,string firstName,string secondName,int Id) 
        {
            ID= Id;
            Role= role;
            FirstName= firstName;
            SecondName= secondName;
        }
        public int ID { get; private set; }
        public string Role { get; private set; }
        public string FirstName { get; private set; }
        public string SecondName { get; private set; }
    }
}
