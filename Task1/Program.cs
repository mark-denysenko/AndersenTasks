using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    // pattern matching (with null and cond) p 65
    // var1 is Type myVar; myVar =12;
    // using static 
    // local methods
    // void Deconstruct(out .., out .., ...) - (var var1, var var2) || var (var1, var2) = object; p 77
    // partial methods are private and return void
    class Program
    {
        static void Main(string[] args)
        {

            Delegates.Method();

            Generics.Method();

            Events.Method();

            Console.ReadKey();
        }
    }
}
