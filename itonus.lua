#!/usr/bin/env lua

local Itonus = {}

Itonus.Chromia = require('chromia')

local okay, errs = pcall(Itonus.Chromia.Epeius, arg)
if not okay then print(errs) end

