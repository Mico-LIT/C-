﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace CSharp.Professional.SystemCollection._Stack
{
    class StackDemo1
    {
        public StackDemo1()
        {
            Stack stack = new Stack();
            stack.Push("First");
            stack.Push("Second");
            stack.Push("Third");
            stack.Push("Fourth");

            if (stack.Peek() is string)
            {
                Console.WriteLine(stack.Pop());
            }

            while (stack.Count > 0)
            {
                Console.WriteLine(stack.Pop());
            }


            Console.ReadLine();
        }
    }
}
