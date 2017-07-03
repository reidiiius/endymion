#!/usr/bin/env lua

local PROTOGENEIA = {}

PROTOGENEIA.Eurycyda = function(paeon)

  local axius = require('olympiad')

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

      fingerboard = {Fn, Cn, Gn, Dn, An, En, Bn} -- instrument tuning

      print "\n"
      print(headstock(aetolus))
      for pitch = 1, #fingerboard do
        print(headstock(tuner(fingerboard[pitch])))
      end
      print "\n"

    else

      local catalogue = {}
      local itera = 1

      for clave, data in pairs(axius) do
        catalogue[itera] = clave
        itera = itera + 1
      end

      table.sort(catalogue)

      print()

      for carte = 1, #catalogue, 1 do
        if (carte % 7 == 0) then
          io.write(string.format("\t%s\n", catalogue[carte]))
        else
          io.write(string.format("\t%s", catalogue[carte]))
        end
      end

      print "\n"

    end

  else

    return nil

  end

end

return PROTOGENEIA

