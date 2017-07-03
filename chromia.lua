#!/usr/bin/env lua

local function Selene()

  local protogeneia = require('asterodia')

  if type(protogeneia) == 'table' then

    protogeneia.Eurycyda(arg[1])

  else

    print(string.format("\n\t%s\n", "protogeneia is " .. type(protogeneia)))

  end

end

Selene()

collectgarbage('collect')

