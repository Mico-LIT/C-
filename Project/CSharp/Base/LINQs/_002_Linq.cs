﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharp.Base.LINQs
{
    class _002_Linq
    {
        class Employee
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public DateTime DateStart { get; set; }
            public decimal Salary { get; set; }
        }

        public _002_Linq()
        {
            List<Employee> employee = new List<Employee>() {
                new Employee()
                {
                    DateStart = DateTime.Now,
                    FirstName = "Тестов",
                    LastName = "Тестович",
                    Salary = 40000
                },
                new Employee()
                {
                    DateStart = DateTime.Parse("11.11.11"),
                    FirstName = "Иванов",
                    LastName = "Иванов",
                    Salary = 40000
                },
                new Employee()
                {
                    DateStart = DateTime.Parse("1.11.11"),
                    FirstName = "Петр",
                    LastName = "Петров",
                    Salary = 10000
                },
                new Employee()
                {
                    DateStart = DateTime.Parse("3.11.11"),
                    FirstName = "Андрей",
                    LastName = "Андреев",
                    Salary = 40000
                }
            };

            var query = employee
                .Where(x => x.Salary > 10000)
                .OrderBy(x => x.LastName)
                .OrderBy(x => x.FirstName)
                .Select(t => new
                {
                    lastName = t.LastName,
                    FirstName = t.LastName
                });

            Console.WriteLine("Высокооплачиваемый сотрудник");

            foreach (var item in query)
            {
                Console.WriteLine($"{item.FirstName} {item.lastName}");
            }

            Console.ReadLine();
        }
    }
}
