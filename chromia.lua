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
    elseif signs[1] == 'help' then
      local press = string.format("%s %s", arg[-1], arg[0])

      io.write(string.format("\n\t%s\n\n", press))
      io.write(string.format("\t%s %s\n\n", press, 'group yq'))
      io.write(string.format("\t%s %s %s\n\n", press, 'query', '^%a%dh?$'))
      io.write(string.format("\t%s %s\n\n", press, 'n0 j3'))
      io.write(string.format("\t%s %s\n\n", press, 'gamut'))
      io.write(string.format("\t%s %s\n\n", press, 'help'))
    elseif signs[1] == 'query' and signs[2] then
      local similar = {}

      for liter = 1, #clefs do
        if string.match(clefs[liter], signs[2]) then
          table.insert(similar, clefs[liter])
        end
      end
      genus.Paeon(similar)
      if #similar % 7 ~= 0 then print() end
    elseif signs[1] == 'group' and signs[2] then
      local base = require('olympiad')

      local yarn = ''
      local similar = {}

      for clef, wire in pairs(base) do
        if genus.toggle then
          yarn = genus.morph(wire)
        else
          yarn = wire
        end

        if string.match(yarn, signs[2]) then
          table.insert(similar, clef)
        end
      end

      if #similar > 0 then
        table.sort(similar)
        genus.Paeon(similar)
        if #similar % 7 ~= 0 then print() end
      else
        io.write(string.format("\n\t%s ?\n\n", signs[2]))
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

