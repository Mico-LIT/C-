﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AML = CSharp.Base.OOP.Полиморфизм.AccessModifiersLibrary;

namespace CSharp.Base.OOP.Полиморфизм
{
    /// <summary>
    /// Помнить :
    /// Базовый класс всегда обеспечивает большую доступность, чем производный класс. 
    /// Возвращаемые значения метода должны иметь большую доступность, чем метод самого метода.
    /// </summary>
    /// --------------------------------------------------------------------------------------------------------
    /// | public               Доступ не ограничен.
    /// | protected            Доступ ограничен содержащим классом или типами, производными от содержащего класса.
    /// | internal             Доступ ограничен текущей сборкой.
    /// | protected internal   Доступ ограничен текущей сборкой или типами, полученными из содержащего класса.
    /// | private              Доступ ограничивается содержащим типом.
    /// --------------------------------------------------------------------------------------------------------

    /// 1) Модификатор доступа по умолчанию является приватным для членов класса.
    /// 2) Класс, помеченный как внутренний, может ограничивать доступ только к текущей сборке.
    /// 3) Пространства имен, которые мы видим по умолчанию, вообще не имеют спецификаторов доступности.
    ///     Они по умолчанию общедоступны, и мы не можем добавлять никаких других модификаторов доступа, 
    ///     включая публикацию снова.
    /// 4) Класс может быть только открытым или внутренним.
    ///     Он не может быть помечен как защищенный или закрытый.Значение по умолчанию является внутренним для класса.
    /// 5) Члены класса могут быть отмечены всеми модификаторами доступа, а модификатор доступа по умолчанию является закрытым.
    /// 6) Защищенные внутренние средства могут иметь доступ к производному классу и классу в одном файле исходного кода.
    /// 7) Между публикой и внутренним, общественность всегда обеспечивает больший доступ к своим членам.
    /// 8) Базовый класс всегда обеспечивает большую доступность, чем производный класс.
    /// 9) Возвращаемые значения метода должны иметь большую доступность, чем метод самого метода.
    /// 10) Класс, отмеченный опечатанным, не может выступать в качестве базового класса для любого другого класса.
    /// 11) Поскольку мы не можем выводить из закрытых классов, код из закрытых классов нельзя переопределить.
    /// 12) Нам нужно инициализировать константную переменную во время ее создания.
    ///      Нам не разрешается инициализировать его позже в нашем коде или программе.
    /// 13) Подобно классам const переменные не могут быть круговыми, другими словами, они не могут зависеть друг от друга.
    /// 14) Поле const ссылочного типа, отличное от строки, может быть инициализировано только нулем.
    /// 15) Можно инициализировать переменную const только для значения времени компиляции,
    ///      другими словами, значение, доступное компилятору во время его выполнения.
    /// 16) По умолчанию константа статична, и мы не можем использовать ссылку на экземпляр, 
    ///      другими словами, имя для ссылки на const. Константа должна быть статичной, 
    ///      так как никто не может вносить какие-либо изменения в константную переменную.
    /// 17) Константная переменная не может быть помечена как статическая.
    /// 18) Переменная в C # никогда не может иметь неинициализированное значение.
    /// 19) Статические переменные всегда инициализируются при первом загрузке класса.
    ///      Интенту присваивается значение по умолчанию, равное нулю, а bool присваивается значение false.
    /// 20) Переменная экземпляра всегда инициализируется во время создания своего экземпляра.
    /// 21) Статическое поле readonly нельзя назначить (кроме статического конструктора или инициализатора переменной)

    class ModifiersBase
    {
        static void AAA()
        {
            Console.WriteLine("AAA");
        }
        public static void BBB()
        {
            Console.WriteLine("BBB");
        }
        protected static void CCC()
        {
            Console.WriteLine("CCC");
        }
    }

    class Modifiers : ModifiersBase
    {

        public static void XXX()
        {
            //AAA();
            BBB();
            CCC();
        }

    }

    class AccessModifiers
    {
        class AAA
        {
            protected int a;
            void MethodAAA(AAA aaa, BBB bbb)
            {
                aaa.a = 100;
                bbb.a = 200;
            }
        }
        class BBB : AAA
        {
            void MethodBBB(AAA aaa, BBB bbb)
            {
                //aaa.a = 100; Доступа нет
                bbb.a = 200;
            }
        }

        public AccessModifiers()
        {
            Modifiers.BBB();
            AML.ClassC classc = new AML.ClassC();
            classc.MethodClassC();
        }
    }
}
