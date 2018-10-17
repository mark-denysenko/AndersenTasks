using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    public delegate int Calculate(int a, int b);
    public delegate void ShowMessage(string message);

    class Delegates
    {
        public static void Method()
        {
            Console.WriteLine("---Delegates");
            ShowMessage messages = MessageLow;
            messages += MessageUp;
            messages += MessageReverse;

            messages("My message!");

            Calculate calculator = Calculator.Add;
            calculator += Calculator.Multiply;
            calculator += Calculator.Subtract;
            Console.WriteLine(" int Calculate(int a, int b): 7, 3 ");
            calculator(7, 3);

            Func<int, int, int> calc = Calculator.Add;
            calc += Calculator.Multiply;
            calc += Calculator.Subtract;
            Console.WriteLine(" Func<int, int, int>: 5, 4");
            calc(5, 4);
        }

        public static void MessageLow(string mess)
        {
            Console.WriteLine("Message1: " + mess.ToLower());
        }

        public static void MessageUp(string mess)
        {
            Console.WriteLine("Message2: " + mess.ToUpper());
        }

        public static void MessageReverse(string mess)
        {
            char[] arrMessage = mess.ToCharArray();
            Array.Reverse(arrMessage);
            Console.WriteLine("Message3: " + new string(arrMessage));
        }
    }

    static class Calculator
    {
        public static int Add(int a, int b)
        {
            Console.WriteLine("Add " + (a + b));
            return a + b;
        }

        public static int Multiply(int a, int b)
        {
            Console.WriteLine("Mult " + (a * b));
            return a * b;
        }

        public static int Subtract(int a, int b)
        {
            Console.WriteLine("Substract " + (a - b));
            return a - b;
        }
    }
}
