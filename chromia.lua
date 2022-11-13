#!/usr/bin/env lua

local Chromia = {}

local function helper(genus)
  local press = string.format("%s %s", arg[-1], arg[0])

  io.write("\nUsage:\n")
  io.write(string.format("\t%s %s\n\n", press, 'help'))
  io.write(string.format("\t%s\n\n", press))
  io.write(string.format("\t%s %s %s\n\n", press, 'group', 'yq'))
  io.write(string.format("\t%s %s %s\n\n", press, 'query', '^%a%dh?$'))
  io.write(string.format("\t%s %s\n\n", press, 'n0 j3'))
  io.write("  Tunings:")
  for liter = 1, #genus.stocks do
    io.write(string.format(" %s", genus.stocks[liter]))
  end
  io.write("\n\n")
  io.write(string.format("\t%s %s %s\n\n", press, 'eadgbe', 'n0 j3'))
  io.write(string.format("\t%s %s %s\n\n", press, 'cgdae', 'gamut'))
  return nil
end

local function querier(clefs, sign)
  local similar = {}

  for liter = 1, #clefs do
    if string.match(clefs[liter], sign) then
      table.insert(similar, clefs[liter])
    end
  end

  return similar
end

local function grouper(genus, sign)
  local base = require('olympiad')
  local yarn, similar = type(nil), {}

  for clef, wire in pairs(base) do
    if genus.toggle then
      yarn = genus.morph(wire)
    else
      yarn = wire
    end

    if string.match(yarn, sign) then
      table.insert(similar, clef)
    end
  end

  table.sort(similar)
  return similar
end

local function machine(genus, sign)
  for liter = 1, #genus.stocks do
    if string.match(sign, genus.stocks[liter]) then
      genus.tuning = sign
      genus.stones = genus.gearbox(genus.tuning)
      break
    end
  end

  return nil
end

Chromia.Aetolus = function(signs)
  local genus = require('asterodia')
  local columns = 7

  if type(genus) == 'table' then
    local clefs = genus.Naxos()

    if not signs[1] then
      genus.Paeon(clefs)
      if #clefs % columns ~= 0 then print() end
    elseif signs[1] == 'gamut' then
      print()
      for liter = 1, #clefs do
        genus.Eurycyda(clefs[liter])
      end
    elseif signs[1] == 'help' then
      helper(genus)
    elseif signs[1] == 'query' and signs[2] then
      local similar = querier(clefs, signs[2])

      if #similar > 0 then
        genus.Paeon(similar)
        if #similar % columns ~= 0 then print() end
      else
        io.write(string.format("\n\t%s ?\n\n", signs[2]))
      end
    elseif signs[1] == 'group' and signs[2] then
      local similar = grouper(genus, signs[2])

      if #similar > 0 then
        genus.Paeon(similar)
        if #similar % columns ~= 0 then print() end
      else
        io.write(string.format("\n\t%s ?\n\n", signs[2]))
      end
    elseif string.match(signs[1], '^[a-g]+[j-n]?') and signs[2] then
      machine(genus, signs[1]) -- stones setter

      if rawequal(genus.tuning, signs[1]) then
        table.remove(signs, 1)
        -- signs[2] shifts to signs[1]
        if rawequal('gamut', signs[1]) then
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
        io.write(string.format("\n\t%s ?\n\n", signs[1]))
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

