using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    class Tuples : IMethod
    {
        public void Method()
        {
            Console.WriteLine("--- Tuples and nullable");

            var anonymous = new { Name = "NoName", age = 100 };
            Console.WriteLine("anonymous string : " + anonymous.ToString());

            var person = Person();

            (int? age, string name) = person;

            if (!person.Item1.HasValue)
                person.Item1 = 20;

            ShowPerson(person);
        }

        private static (int?, string) Person()
        {
            return (null, "Bob");
        }

        private static void ShowPerson((int? age, string name) person)
        {
            Console.WriteLine("Person name " + (person.name ?? "DefaultName") + " age - " + (person.age ?? 0));

            if(person.age >= 18)
                Console.WriteLine("Person can buy beer!");
            else
                Console.WriteLine("Sorry, person can buy only sweets!");
        }
    }
}
