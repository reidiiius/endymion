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
    error("protogeneia is type ".. type(protogeneia), 1)
  end

  return nil
end

Selene()

collectgarbage('collect')

