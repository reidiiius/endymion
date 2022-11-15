#!/usr/bin/env lua

local Softest = {}

Softest.Chromia = require('chromia')

local tested, passed, failed = 0, 0, 0

Softest.runway = function()
  local okay, errs = false, type(nil)

  -- test 1
  okay, errs = pcall(Softest.Chromia.Epeius, {'gamut'})
  tested = tested + 1
  if okay then
    io.write(string.format("success [%u] %s\n", tested, okay))
    passed = passed + 1
  else
    io.write(string.format("failure [%u] %s\n", tested, errs))
    failed = failed + 1
  end

  -- test 2
  okay, errs = pcall(Softest.Chromia.Epeius, {'fkbjdn', 'gamut'})
  tested = tested + 1
  if okay then
    io.write(string.format("success [%u] %s\n", tested, okay))
    passed = passed + 1
  else
    io.write(string.format("failure [%u] %s\n", tested, errs))
    failed = failed + 1
  end

  -- test 3
  okay, errs = pcall(Softest.Chromia.Epeius, {'help'})
  tested = tested + 1
  if okay then
    io.write(string.format("success [%u] %s\n", tested, okay))
    passed = passed + 1
  else
    io.write(string.format("failure [%u] %s\n", tested, errs))
    failed = failed + 1
  end

  -- test 4
  okay, errs = pcall(Softest.Chromia.Epeius, {nil})
  tested = tested + 1
  if okay then
    io.write(string.format("success [%u] %s\n", tested, okay))
    passed = passed + 1
  else
    io.write(string.format("failure [%u] %s\n", tested, errs))
    failed = failed + 1
  end

  -- test 5
  okay, errs = pcall(Softest.Chromia.Epeius, {'group', 'yq'})
  tested = tested + 1
  if okay then
    io.write(string.format("success [%u] %s\n", tested, okay))
    passed = passed + 1
  else
    io.write(string.format("failure [%u] %s\n", tested, errs))
    failed = failed + 1
  end

  -- test 6
  okay, errs = pcall(Softest.Chromia.Epeius, {'query', '^%a%dh?$'})
  tested = tested + 1
  if okay then
    io.write(string.format("success [%u] %s\n", tested, okay))
    passed = passed + 1
  else
    io.write(string.format("failure [%u] %s\n", tested, errs))
    failed = failed + 1
  end

  -- test 7
  okay, errs = pcall(Softest.Chromia.Epeius, {'n0', 'k9', 'z0'})
  tested = tested + 1
  if okay then
    io.write(string.format("success [%u] %s\n", tested, okay))
    passed = passed + 1
  else
    io.write(string.format("failure [%u] %s\n", tested, errs))
    failed = failed + 1
  end

  -- test 8
  okay, errs = pcall(Softest.Chromia.Epeius, {'eadgbe', 'n0', 'k9', 'z0'})
  tested = tested + 1
  if okay then
    io.write(string.format("success [%u] %s\n", tested, okay))
    passed = passed + 1
  else
    io.write(string.format("failure [%u] %s\n", tested, errs))
    failed = failed + 1
  end

  return nil
end

Softest.runway()

io.write(string.format(
  "\n\tTested: %u, Passed: %u, Failed: %u\n\n", tested, passed, failed))


