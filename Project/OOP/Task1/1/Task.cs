﻿using System.Security.Cryptography;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP.Task1._1
{
    public class Task
    {
        public void main()
        {
            library lib = new library();
            
            lib.Add(new Book() { ID = 1,Name="d12", Type = BookType.журнал });
            var g=lib.Find(1);
            var g1 = lib.Find("d12");
            foreach (var item in g1)
            {
                var gg = item;
            }
        }
    }
}
