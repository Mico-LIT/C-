﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharp.Base.LINQs
{
    class _006_Linq
    {
        public _006_Linq()
        {
            ArrayList list = new ArrayList();
            list.Add(1);
            list.Add(2);

            // Явное указание типа Int32 переменной диапазона
            // (var - НЕВОЗМОЖНО использовать т.к. IEnumerable не параметризированный)

            var query = from int x in list
                        select x;

            foreach (var item in query)   Console.WriteLine(item);

            Console.ReadLine();
        }
    }
}
