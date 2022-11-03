#!/usr/bin/env lua

local function Selene()
  local protogeneia = require('asterodia')

  if type(protogeneia) == 'table' then
    if not arg[1] then
      protogeneia.Deucalion()
    else
      print()
      for liter = 1, #arg do
        protogeneia.Eurycyda(tostring(arg[liter]))
      end
    end
  else
    print(string.format(
      "\n\t%s\n", "protogeneia is " .. type(protogeneia)
    ))
  end

  return nil
end

Selene()

collectgarbage('collect')

