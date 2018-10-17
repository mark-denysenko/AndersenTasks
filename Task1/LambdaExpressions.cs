using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    class LambdaExpressions
    {
        public static void Method()
        {
            Console.WriteLine("--- Lambda Expressions");

            int localNumber = 10;
            Func<int>  closureExample = () => localNumber += 2;

            closureExample += Closure();
            closureExample();

            Console.WriteLine($"Variables were changed using closure {closureExample()} {localNumber}");

            IterativeVariables();
        }

        private static Func<int> Closure()
        {
            int number = 0;
            return () => number++;
        }

        private static void IterativeVariables()
        {
            Console.WriteLine("Iterations");
            Action[] actionsWithOneVariable = new Action[5];
            for (int i = 0; i < actionsWithOneVariable.Length; i++)
            {
                actionsWithOneVariable[i] = () => Console.Write(i + " ");
            }
            foreach (var a in actionsWithOneVariable) a();
            Console.WriteLine();

            Action[] actionsWithDifferentVariables = new Action[5];
            for (int i = 0; i < actionsWithDifferentVariables.Length; i++)
            {
                int localVariable = i;
                actionsWithDifferentVariables[i] = () => Console.Write(localVariable + " ");
            }
            foreach (var a in actionsWithDifferentVariables) a();
            Console.WriteLine();
        }
    }
}
