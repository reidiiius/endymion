#!/usr/bin/env lua

local function Selene()

  local protogeneia = require('asterodia')

  if not arg[1] then
    protogeneia.Deucalion()
    return nil
  end

  if type(protogeneia) == 'table' then

    print()
    for k, v in ipairs(arg) do
      protogeneia.Eurycyda(tostring(v))
    end

  else

    print(string.format("\n\t%s\n", "protogeneia is " .. type(protogeneia)))

  end

end

Selene()

collectgarbage('collect')

