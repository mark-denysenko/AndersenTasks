using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
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
    // Exception filters catch (Exception e) when (e.Field == someValue) { }
    // anonymous type is READ ONLY
    // tuples read/write, work with generic Dictionary<int,(int, string)>
    class Program
    {
        static void Main(string[] args)
        {
            ReflectionCall("Method");

            Console.ReadKey();
        }

        public static void ReflectionCall(string methodName)
        {
            Assembly currentAssembly = Assembly.GetExecutingAssembly();

            foreach (var type in currentAssembly.DefinedTypes)
            {
                MethodInfo method = type.GetDeclaredMethod(methodName);

                if(method != null 
                    && method.IsPublic 
                    && method.IsStatic 
                    && method.ReturnType == typeof(void))
                {
                    method.Invoke(null, null);
                }
            }
        }
    }
}
