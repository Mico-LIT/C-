﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CSharp.Base.Threads.Thread8
{
    class Thread8
    {
        //[ThreadStatic]
        static public int counter;

        public Thread8()
        {
            Console.WriteLine("Главный поток {0}",Thread.CurrentThread.GetHashCode());

            Thread thread = new Thread(Method);
            thread.Start();
            thread.Join();

            Console.WriteLine("Поток завершился {0}", Thread.CurrentThread.GetHashCode());
        }

        void Method()
        {
            if (counter<100)
            {
                counter++;
                Console.WriteLine(counter + "--START--" + Thread.CurrentThread.GetHashCode());

                Thread thread = new Thread(Method);
                thread.Start();
                thread.Join();
            }

            Console.WriteLine("Поток завершился {0}",Thread.CurrentThread.GetHashCode());
            Console.Read();
        }

    }
}
