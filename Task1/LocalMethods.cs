using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    class LocalMethods: IMethod
    {
        public void Method()
        {
            Console.WriteLine("---Main method in LocalMethods");
            LocalMethod1();
            LocalMethod2();

            void LocalMethod1()
            {
                Console.WriteLine("\tLocal Method 1");
            }

            void LocalMethod2()
            {
                Console.WriteLine("\tLocal Method 2 " + DateTime.Now);
            }
        }
    }
}
