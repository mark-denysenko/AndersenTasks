using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    class Generics
    {
        public static void Method()
        {
            Console.WriteLine("--- Test generic stack!");

            Stack<int> myStack = new Stack<int>(5);

            for(int i = 0; i < 20; ++i)
            {
                myStack.Push(i);
                if(i % 5 == 0)
                    Console.WriteLine("Count: " + myStack.Count);
            }

            Console.WriteLine("Elements in stack");
            while(myStack.Count > 0)
            {
                Console.Write(" " + myStack.Pop());
            }
            Console.WriteLine();
        }
    }

    class Stack<T>
    {
        T[] elements = null;
        int counter = 0;

        public int Count => counter;

        public Stack() : this(10) { }

        public Stack(int capacity)
        {
            elements = new T[capacity];
        }

        public void Push(T element)
        {
            if (counter >= elements.Length)
                Resize();

            elements[counter] = element;

            counter++;
        }

        public T Pop()
        {
            if (counter < 0)
            {
                Console.WriteLine("No elements!");
                throw new Exception();
            }

            counter--;

            return elements[counter];
        }

        public void Resize()
        {
            T[] newArray = new T[elements.Length * 2];
            elements.CopyTo(newArray, 0);

            elements = newArray;
        }
    }
}
