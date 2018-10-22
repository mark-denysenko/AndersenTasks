using System;

namespace Task1
{
    // pattern matching (with null and cond) p 65
    // var1 is Type myVar; myVar =12;
    // using static 
    // local methods
    // void Deconstruct(out .., out .., ...) - (var var1, var var2) || var (var1, var2) = object; p 77
    // partial methods are private and return void
    // Exception filters catch (Exception e) when (e.Field == someValue) { }
    // anonymous type is READ ONLY
    // tuples read/write, work with generic Dictionary<int,(int, string)>

    class Program
    {
        static void Main(string[] args)
        {
            //MethodInvoker.ReflectionCallStatic("Method");

            MethodInvoker.ReflectionCallNonStatic("Method");

            Console.ReadKey();
        }
    }
}
