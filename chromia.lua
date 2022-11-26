#!/usr/bin/env lua

local Chromia = {}

local function scribe(style, ...)
  assert(type(style) == 'string', 'scribe param style not string')

  local varies = table.pack(...)
  assert(rawequal(#varies, varies.n), 'scribe varies length equality')
  for liter = 1, varies.n do
    assert(type(varies[liter]) == 'string', 'scribe param not string')
  end

  io.write(string.format(style, ...))
  return nil
end

local function question(word)
  assert(type(word) == 'string', 'question param not string')

  scribe('\n\t%s ?\n\n', word)
  return nil
end

local function manual(genus)
  assert(type(genus) == 'table', 'manual param not table')

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

local function inquire(clefs, regex)
  assert(type(clefs) == 'table', 'inquire param clefs not table')
  assert(type(regex) == 'string', 'inquire param regex not string')

  local similar = {}

  for liter = 1, #clefs do
    if string.match(clefs[liter], regex) then
      table.insert(similar, clefs[liter])
    end
  end

  return similar
end

local function grouper(genus, graph)
  assert(type(genus) == 'table', 'grouper param genus not table')
  assert(type(graph) == 'string', 'grouper param graph not string')

  local base = require('olympiad')
  local similar = {}
  local yarn

  for clef, wire in pairs(base) do
    if genus.toggle then
      yarn = genus.morph(wire)
    else
      yarn = wire
    end

    if string.match(yarn, graph) then
      table.insert(similar, clef)
    end
  end

  table.sort(similar)
  return similar
end

local function machine(genus, tuned)
  assert(type(genus) == 'table', 'machine param genus not table')
  assert(type(tuned) == 'string', 'machine param tuned not string')

  for liter = 1, #genus.stocks do
    if string.match(tuned, genus.stocks[liter]) then
      genus.tuning = tuned
      genus.stones = genus.gearbox(genus.tuning)
      break
    end
  end

  return nil
end

local function weaver(genus, clefs)
  assert(type(genus) == 'table', 'weaver param genus not table')
  assert(type(clefs) == 'table', 'weaver param clefs not table')

  print()
  for liter = 1, #clefs do
    genus.Eurycyda(clefs[liter])
  end

  return nil
end

local function layout(hash)
  assert(type(hash) == 'table', 'layout param not table')

  if #hash.list > 0 then
    hash.proc(hash.list)
    if #hash.list % hash.numb ~= 0 then print() end
  else
    question(hash.sign)
  end

  return nil
end

Chromia.Aetolus = function(signs)
  assert(type(signs) == 'table', 'Aetolus param not table')

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
      manual(genus)
    elseif signs[1] == 'query' and signs[2] then
      local similar = inquire(clefs, signs[2])

      layout{
        proc = genus.Paeon, list = similar, numb = columns, sign = signs[2]
      }
    elseif signs[1] == 'group' and signs[2] then
      local similar = grouper(genus, signs[2])

      layout{
        proc = genus.Paeon, list = similar, numb = columns, sign = signs[2]
      }
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
  assert(type(input) == 'table', 'Epeius param not table')

  local base = require('olympiad')

  if type(base) == 'table' then
    local items = 0

    for _ in pairs(base) do
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

