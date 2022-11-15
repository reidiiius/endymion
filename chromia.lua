#!/usr/bin/env lua

local Chromia = {}

local function scribe(style, ...)
  io.write(string.format(style, ...))
  return nil
end

local function question(sign)
  scribe('\n\t%s ?\n\n', sign)
  return nil
end

local function helper(genus)
  local cmd = string.format("%s %s", arg[-1], arg[0])

  scribe('\n%s\n', 'Usage:')
  scribe('\t%s %s\n\n', cmd, 'help')
  scribe('\t%s\n\n', cmd)
  scribe('\t%s %s %s\n\n', cmd, 'group', 'yq')
  scribe('\t%s %s %s\n\n', cmd, 'query', '^%a%dh?$')
  scribe('\t%s %s\n\n', cmd, 'n0 j3')
  io.write('  Tunings:')
  for liter = 1, #genus.stocks do
    io.write(string.format(" %s", genus.stocks[liter]))
  end
  io.write("\n\n")
  scribe('\t%s %s %s\n\n', cmd, 'eadgbe', 'n0 j3')
  scribe('\t%s %s %s\n\n', cmd, 'cgdae', 'gamut')
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

local function weaver(genus, list)
  print()
  for liter = 1, #list do
    genus.Eurycyda(list[liter])
  end

  return nil
end

local function layout(refun, list, numb, sign)
  if #list > 0 then
    refun(list)
    if #list % numb ~= 0 then print() end
  else
    question(sign)
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
      weaver(genus, clefs)
    elseif signs[1] == 'help' then
      helper(genus)
    elseif signs[1] == 'query' and signs[2] then
      local similar = querier(clefs, signs[2])

      layout(genus.Paeon, similar, columns, signs[2])
    elseif signs[1] == 'group' and signs[2] then
      local similar = grouper(genus, signs[2])

      layout(genus.Paeon, similar, columns, signs[2])
    elseif string.match(signs[1], '^[a-g]+[j-n]?') and signs[2] then
      machine(genus, signs[1]) -- stones setter

      if rawequal(genus.tuning, signs[1]) then
        table.remove(signs, 1) -- signs[2] shifts to signs[1]

        if rawequal('gamut', signs[1]) then
          weaver(genus, clefs)
        else
          weaver(genus, signs)
        end
      else
        question(signs[1])
      end
    else
      weaver(genus, signs)
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

return Chromia

