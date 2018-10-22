using System;
using System.Reflection;

namespace Task1
{
    static class MethodInvoker
    {
        public static void ReflectionCallStatic(string methodName)
        {
            var currentAssembly = Assembly.GetExecutingAssembly();

            foreach (var type in currentAssembly.DefinedTypes)
            {
                MethodInfo method = type.GetDeclaredMethod(methodName);
                method?.Invoke(null, null);
            }

            /*/ 2-nd variant of realization
            foreach (var type in currentAssembly.GetTypes())
            {
                MethodInfo method = type.GetMethod(methodName, 
                      BindingFlags.Public 
                    | BindingFlags.DeclaredOnly 
                    | BindingFlags.Static);

                method?.Invoke(null, null);
            } */
        }

        /// <summary>
        /// This method will call non static methods
        /// For example: we can create interface for testing with one method, which will invoke for testing
        /// it looks like a part of solid
        /// I - interface segregation
        /// </summary>
        /// <param name="methodName">name of method which will invoke</param>
        public static void ReflectionCallNonStatic(string methodName)
        {
            Assembly currentAssembly = Assembly.GetExecutingAssembly();

            // 1 variant
            Type iMethod = typeof(IMethod); // or  = currentAssembly.GetType(methodName); but FULL name
            MethodInfo testMethod = iMethod.GetMethod(methodName);

            foreach(var type in currentAssembly.DefinedTypes)
            {
                if (iMethod.IsAssignableFrom(type) && !type.IsInterface)
                {
                    type.GetDeclaredMethod(testMethod.Name)
                        .Invoke(Activator.CreateInstance(type), null);
                }
            }

            /* 2 variant
            foreach (var type in currentAssembly.DefinedTypes)
            {
                MethodInfo method = type.GetDeclaredMethod(methodName);
                if (method != null
                    && !type.IsInterface
                    && method.IsPublic
                    && method.ReturnType == typeof(void))
                {
                    method.Invoke(Activator.CreateInstance(type),
                                  null);
                }
            } */
        }
    }
}
