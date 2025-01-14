﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/// <summary>
///  let - Представляет новый локальный идентификатор, на который можно ссылаться в остальной части запроса 
///  Можно представить, как локальную переменную видимую только внутри выражения запроса
/// </summary>

namespace CSharp.Base.LINQs
{
    class _011_Linq
    {
        public _011_Linq()
        {
            var query = from x in Enumerable.Range(1, 10)
                        let numbers = Enumerable.Range(1, 10)
                        from y in numbers
                        select new { X=x, Y=y, Product = x * y };

            foreach (var item in query)
            {
                Console.WriteLine(item);
            }

            Console.ReadLine();
        }
    }
}
