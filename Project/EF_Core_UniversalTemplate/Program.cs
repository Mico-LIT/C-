﻿using Microsoft.EntityFrameworkCore;
using System;
using CSharp.Base.UniversalTemplate.EF_Core_Example;
using System.Linq;
using EF_Core_UniversalTemplate.DataBase;

namespace EF_Core_UniversalTemplate
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            using (_001_Model.IRepository<_001_Model.Employee> sqlRepository =
                    new SqlRepository<_001_Model.Employee>(new CompanyDb()))
            {
                AddEmployee(sqlRepository);
                CountEmployee(sqlRepository);
                QueryEmployee(sqlRepository);
                DumpPeople(sqlRepository);
            }

            Console.ReadLine();
        }

        private static void DumpPeople(_001_Model.IRepository<_001_Model.Employee> sqlRepository)
        {
            var emps = sqlRepository.FindAll();
            foreach (var item in emps)
            {
                Console.WriteLine(item.Name);
            }
        }

        private static void QueryEmployee(_001_Model.IRepository<_001_Model.Employee> sqlRepository)
        {
            var emp = sqlRepository.FindById(1);
            Console.WriteLine(emp.Name);
        }

        private static void CountEmployee(_001_Model.IRepository<_001_Model.Employee> sqlRepository)
        {
            var countEmp = sqlRepository.FindAll().Count();
            Console.WriteLine(countEmp);
        }

        private static void AddEmployee(_001_Model.IRepository<_001_Model.Employee> sqlRepository)
        {
            sqlRepository.Add(new _001_Model.Employee() { Name = "Misha" });
            sqlRepository.Add(new _001_Model.Employee() { Name = "Vika" });
            sqlRepository.Add(new _001_Model.Employee() { Name = "Ira" });
            sqlRepository.Commit();
        }
    }
}
