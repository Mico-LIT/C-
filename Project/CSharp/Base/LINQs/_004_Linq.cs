﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharp.Base.LINQs.LINQ_
{
    static class Myset
    {
        public static IEnumerable<T> Where<T>(this IEnumerable<T> source, Func<T, bool> predicate)
        {
            Console.WriteLine("Вызвана собственная реализация Where");
            return System.Linq.Enumerable.Where(source, predicate);
        }

        public static IEnumerable<R> Select<T,R>(this IEnumerable<T> source, Func<T,R> selector)
        {
            Console.WriteLine("Вызвана собственная реализация Select");
            return System.Linq.Enumerable.Select(source, selector);
        }
    }

    class _004_Linq
    {
        public _004_Linq()
        {
            int[] numbers = { 1, 2, 3, 4, 5 };

            var query = from x in numbers
                        where x % 2 == 0
                        select x * 2;

            foreach (var item in query)
            {
                Console.WriteLine(item);
            }
            Console.ReadLine();
        }
    }
}
