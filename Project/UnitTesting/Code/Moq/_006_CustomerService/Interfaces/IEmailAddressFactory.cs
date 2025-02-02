﻿using Code.Moq._006_CustomerService.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Code.Moq._006_CustomerService.Interfaces
{
    public interface IEmailAddressFactory
    {
        bool TryParse(string mail, out Address address);
    }
}
