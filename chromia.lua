#!/usr/bin/env lua

local Chromia = {}

Chromia.Aetolus = function(signs)
  local genus = require('asterodia')

  if type(genus) == 'table' then
    if not signs[1] then
      genus.Paeon()
    else
      print()
      for liter = 1, #signs do
        genus.Eurycyda(tostring(signs[liter]))
      end
    end
  else
    error("genus is type ".. type(genus), 1)
  end

  return nil
end

-- validates input
Chromia.Epeius = function(input)
  local base = require('olympiad')

  if type(base) == 'table' then
    local items = 0

    for entry in pairs(base) do
      items = items + 1
    end

    -- limit number of arguments
    if #input > items then
      print('Request denied!')
    else
      local filtered = {}

      -- limit number of characters
      for liter = 1, #input do
        if string.len(input[liter]) < 9 then
          table.insert(filtered, input[liter])
        end
      end

      Chromia.Aetolus(filtered)
    end
  else
    error("base is type ".. type(base), 1)
  end

  return nil
end

Chromia.Epeius(arg)

collectgarbage('collect')

