using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    class TestDeconstruct : IMethod
    {
        public void Method()
        {
            Console.WriteLine("---Test Deconstruction");
            Deconstructor deconstructor = new Deconstructor();

            var (integer1, _, isLogical1, _) = deconstructor;
            Console.WriteLine($"\tvoid Deconstruct: {integer1} - {isLogical1}");

            var (integer2, text2) = deconstructor.IntegerText();
            Console.WriteLine($"\t(int, string) IntegerText: {integer2} - {text2}");

            int integer3;
            string text3;
            bool isLogical3;
            DateTime timeNow3;
            (integer3, text3, isLogical3, timeNow3) = deconstructor;
            Console.WriteLine($"Full deconstruct : {integer3} - {text3} - {isLogical3} - {timeNow3}");
        }
    }

    class Deconstructor
    {
        int integer = 1000;
        string text = "some text";
        bool isLogical = false;
        DateTime timeNow = DateTime.Now;

        public void Deconstruct(out int _integer, out string _text, out bool _isLogical, out DateTime _time)
        {
            _integer = integer;
            _text = text;
            _isLogical = isLogical;
            _time = timeNow;
        }

        public (int, string) IntegerText()
        {
            return (integer, text);
        }
    }
}
