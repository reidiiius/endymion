#!/usr/bin/env lua

local Softest = {}

local scribe = function(style, ...)
  io.write(string.format(style, ...))
  return nil
end

local tested, passed, failed = 0, 0, 0

local process = function(name, okay, errs)
  if okay then
    scribe("%s success [%u] %s\n", name, tested, okay)
    passed = passed + 1
  else
    scribe("%s failure [%u] %s\n", name, tested, errs)
    failed = failed + 1
  end
end

Softest.report = function()
  local style = "\n\tTested: %u, Passed: %u, Failed: %u\n\n"

  scribe(style, tested, passed, failed)
  return nil
end

Softest.epeius = function()
  local name, okay, errs = 'epeius', false, type(nil)
  local refun = require('chromia')
  local values = {
    {'gamut'},
    {'fkbjdn', 'gamut'},
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
    okay, errs = pcall(refun.Epeius, values[liter])
    tested = tested + 1
    process(name, okay, errs)
    liter = liter + 1
  end

  return nil
end

Softest.aetolus = function()
  local name, okay, errs = 'aetolus', false, type(nil)
  local refun = require('chromia')
  local values = {
    {'gamut'},
    {'fkbjdn', 'gamut'},
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
    process(name, okay, errs)
    liter = liter + 1
  end

  return nil
end

do
  local okay, errs = pcall(Softest.epeius, nil)

  if not okay then
    scribe("\n\tepeius: %s\n\n", errs)
    return nil
  end
end

do
  local okay, errs = pcall(Softest.aetolus, nil)

  if not okay then
    scribe("\n\taetolus: %s\n\n", errs)
    return nil
  end
end

Softest.report()

