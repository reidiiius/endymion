#!/usr/bin/env lua

local PROTOGENEIA = {}

PROTOGENEIA.Deucalion = function()

  local axius = setmetatable(require('olympiad'), {})

  local catalogue = {}
  local itera = 1

  for clave, data in pairs(axius) do
    catalogue[itera] = clave
    itera = itera + 1
  end

  catalogue[#catalogue + 1] = 'z0'

  table.sort(catalogue)

  print()

  for carte = 1, #catalogue, 1 do
    if (carte % 7 == 0) then
      io.write(string.format("\t%s\n", catalogue[carte]))
    else
      io.write(string.format("\t%s", catalogue[carte]))
    end
  end

  print()

end

PROTOGENEIA.Eurycyda = function(paeon)

  local axius = setmetatable(require('olympiad'), {

    __index = function(axius, stone)

      local nyx = string.rep(string.char(95), 4) .. string.char(32)

      local function peg(qp)
        return string.sub(axius.n0, (qp + 1), -1) .. string.sub(axius.n0, 0, qp)
      end

      if stone == 'z0' then return string.rep(nyx, 12)
      elseif stone == 'j367' then return peg(45)
      elseif stone == 'j37' then return peg(10)
      elseif stone == 'j7' then return peg(35)
      elseif stone == 'n8' then return peg(0)
      elseif stone == 'k4' then return peg(25)
      elseif stone == 'k14' then return peg(50)
      elseif stone == 'k145' then return peg(15)
      else return nil
      end

    end
  })

  if type(axius) == 'table' then

    if axius[paeon] then

      local epeius = axius[paeon]

      local aetolus = paeon .. '-beadgcf-v' .. os.time()

      local Bj, Fn, Cn, Gn, Dn, An, En, Bn, Fk =
            50, 25,  0, 35, 10, 45, 20, 55, 30

      local function tuner(qp)
        return string.sub(epeius, (qp + 1), -1) .. string.sub(epeius, 0, qp)
      end

      local function headstock(qp)
        return string.format("\t%s", qp)
      end

      local fingerboard = {Fn, Cn, Gn, Dn, An, En, Bn} -- instrument tuning

      print(headstock(aetolus))
      for pitch = 1, #fingerboard do
        print(headstock(tuner(fingerboard[pitch])))
      end
      print()

    else

      print("\t" .. paeon .. " ?\n")

    end

  else

    return nil

  end

end

return PROTOGENEIA

