#!/usr/bin/env lua

local Chromia = {}

Chromia.Aetolus = function(signs)
  local genus = require('asterodia')

  if type(genus) == 'table' then
    local clefs = genus.Naxos()

    if not signs[1] then
      genus.Paeon(clefs)
    elseif signs[1] == 'gamut' then
      print()
      for liter = 1, #clefs do
        genus.Eurycyda(clefs[liter])
      end
    else
      print()
      for liter = 1, #signs do
        genus.Eurycyda(signs[liter])
      end
    end
  else
    error("genus is type ".. type(genus), 1)
  end

  return nil
end

-- validate input
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
      local keychain = {}

      -- limit number of characters
      for liter = 1, #input do
        if string.len(input[liter]) < 9 then
          table.insert(keychain, input[liter])
        end
      end

      Chromia.Aetolus(keychain)
    end
  else
    error("base is type ".. type(base), 1)
  end

  return nil
end

local okay, errs = pcall(Chromia.Epeius, arg)
if not okay then print(errs) end

collectgarbage('collect')

