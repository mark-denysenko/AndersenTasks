using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    class PatternMatching : IMethod
    {
        public void Method()
        {
            Console.WriteLine("--- Test pattern matching");
            object testValue = 10;

            switch(testValue)
            {
                case "text":
                    Console.WriteLine("case: \"text\"");
                    break;
                case string s:
                    Console.WriteLine("string value: " + s);
                    break;
                case 10.12m:
                    Console.WriteLine("case: 10.12m");
                    break;
                case int n when n > 100:
                    Console.WriteLine("value is bigger than 100");
                    break;
                case int n:
                    Console.WriteLine("value is " + n.ToString());
                    break;
                case DateTime time:
                    Console.WriteLine("Current time is " + DateTime.Now);
                    break;
                case null:
                    Console.WriteLine("Null !");
                    break;
            }
        }
    }
}
