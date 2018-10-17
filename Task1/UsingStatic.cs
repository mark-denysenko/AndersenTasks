using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    using static MyStatic.UsingStatic;

    class TestClass
    {
        public static void Method()
        {
            Console.WriteLine($"---CONST from static class \n\t{nameof(MY_NUMBER)} - {MY_NUMBER}"
                + $"\n\t{nameof(METRO_TICKET)} - {METRO_TICKET}"
                + $"\n\t{nameof(INFO)} - {INFO}");
        }
    }

    namespace MyStatic
    {
        static class UsingStatic
        {
            public static string INFO = "Some info in static variable";
            public static int MY_NUMBER = 1;
            public static decimal METRO_TICKET = 8m;
        }
    }
}
