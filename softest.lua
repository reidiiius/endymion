#!/usr/bin/env lua

local Softest = {}

local scribe = function(style, ...)
  io.write(string.format(style, ...))
  return nil
end

local tested, passed, failed = 0, 0, 0

local process = function(name, numb, okay, errs)
  if okay then
    scribe("%s success [%u] %s\n", name, numb, okay)
    passed = passed + 1
  else
    scribe("%s failure [%u] %s\n", name, numb, errs)
    failed = failed + 1
  end

  return nil
end

Softest.dispatch = function(duos)
  for name, refun in pairs(duos) do
    if rawequal(type(refun), 'function') then
      local okay, errs = pcall(refun, nil)

      if not okay then
        scribe("\n\t%s: %s\n\n", name, errs)
        return nil
      end
    else
      error(name .." is not a function reference")
    end
  end

  return nil
end

Softest.report = function()
  local style = "\n\tTested: %u, Passed: %u, Failed: %u\n\n"

  scribe(style, tested, passed, failed)
  return nil
end

Softest.epeius = function()
  local okay, errs
  local name = 'epeius'
  local refun = require('chromia')
  local inputs = {{nil}, {'j3k56m4h'}}
  local maxine = {}

  for niter = 0, 99 do
    table.insert(maxine, niter)
  end

  -- can govern amount of arguments?
  table.insert(inputs, maxine)

  -- can govern amount of characters?
  table.insert(inputs, {'0123456789'})

  for liter = 1, #inputs do
    okay, errs = pcall(refun.Epeius, inputs[liter])
    tested = tested + 1
    process(name, liter, okay, errs)
  end

  return nil
end

Softest.aetolus = function()
  local okay, errs
  local name = 'aetolus'
  local refun = require('chromia')
  local values = {
    {'gamut'},
    {'cgdae', 'gamut'},
    {'help'},
    {nil},
    {'group', 'yq'},
    {'group', 'what'},
    {'query', '^%a%dh?$'},
    {'query', 'which'},
    {'n0', 'k9', 'k4j7'},
    {'eadgbe', 'n0', 'j8', 'z0'},
  }

  for liter = 1, #values do
    okay, errs = pcall(refun.Aetolus, values[liter])
    tested = tested + 1
    process(name, liter, okay, errs)
  end

  return nil
end

Softest.eurycyda = function()
  local okay, errs
  local name = 'eurycyda'
  local refun = require('asterodia')
  local inputs = {nil, 'k9', 'n0', 'j367', 'z0'}

  for liter = 1, #inputs do
    print()
    okay, errs = pcall(refun.Eurycyda, inputs[liter])
    tested = tested + 1
    process(name, liter, okay, errs)
  end

  return nil
end

Softest.naxos = function()
  local okay, errs
  local name = 'naxos'
  local refun = require('asterodia')

  okay, errs = pcall(refun.Naxos, nil)

  if okay then
    local list = refun.Naxos()

    print()
    for liter = 1, #list do
      scribe('\t%s', list[liter])
      if (liter % 7 == 0) then print() end
    end
    print()
  end

  tested = tested + 1
  process(name, 1, okay, errs)

  return nil
end

Softest.paeon = function()
  local okay, errs
  local name = 'paeon'
  local refun = require('asterodia')
  local list = refun.Naxos()

  okay, errs = pcall(refun.Paeon, list)
  tested = tested + 1
  process(name, 1, okay, errs)

  return nil
end

Softest.toggle = function()
  local okay, errs
  local name = 'toggle'
  local refun = require('asterodia')
  local value = refun.toggle
  local boole = rawequal(type(value), 'boolean')

  okay, errs = pcall(assert, boole, 'toggle not boolean')
  tested = tested + 1
  process(name, 1, okay, errs)

  return nil
end

Softest.morph = function()
  local okay, errs
  local name = 'morph'
  local refun = require('asterodia')
  local lyres = require('olympiad')
  local value = lyres.n0

  okay, errs = pcall(refun.morph, value)
  tested = tested + 1
  process(name, 1, okay, errs)

  return nil
end

Softest.stones = function()
  local okay, errs
  local name = 'stones'
  local refun = require('asterodia')
  local tuned = refun.tuning
  local value = refun.gearbox(tuned)
  local boole = rawequal(type(value), 'table')

  okay, errs = pcall(assert, boole, 'stones not table')
  tested = tested + 1
  process(name, 1, okay, errs)

  return nil
end

Softest.gearbox = function()
  local okay, errs
  local name = 'gearbox'
  local refun = require('asterodia')
  local values = refun.stocks

  table.insert(values, 'abcdefg') -- matchless

  for liter = 1, #values do
    okay, errs = pcall(refun.gearbox, values[liter])
    tested = tested + 1
    process(name, liter, okay, errs)
  end

  return nil
end

Softest.olympiad = function()
  local desc, okay, errs
  local name = 'olympiad'
  local lyres = require('olympiad')
  local numb = 0

  for clef, value in pairs(lyres) do
    desc = string.format("  %s: %s  \t", name, clef)
    numb = numb + 1
    okay, errs = pcall(assert, string.len(value) == 60)
    tested = tested + 1
    process(desc, numb, okay, errs)
  end

  return nil
end

scribe('\n\n\t\t%s\n\n', string.upper('Chromia test'))

local Chromia_test = {
   epeius = Softest.epeius,
  aetolus = Softest.aetolus,
}

Softest.dispatch(Chromia_test)

scribe('\n\n\t\t%s\n\n', string.upper('Asterodia test'))

local Asterodia_test = {
  eurycyda = Softest.eurycyda,
     naxos = Softest.naxos,
     paeon = Softest.paeon,
    toggle = Softest.toggle,
     morph = Softest.morph,
    stones = Softest.stones,
   gearbox = Softest.gearbox,
}

Softest.dispatch(Asterodia_test)

scribe('\n\n\t\t%s\n\n', string.upper('Olympiad test'))

local Olympiad_test = {
  olympiad = Softest.olympiad,
}

Softest.dispatch(Olympiad_test)

Softest.report()

