#!/usr/bin/env lua

PROTOGENEIA = {}

PROTOGENEIA.Eurycyda = function()

  local aetolus = os.time()

  print()

  for paeon, epeius in pairs(AXIUS) do

    local Fn, Cn, Gn, Dn, An, En, Bn =
          25,  0, 35, 10, 45, 20, 55
    -- instrument tuning
    print()
    print(paeon .. '-v' .. aetolus)
    print(string.sub(epeius, (Fn + 1), -1) .. string.sub(epeius, Cn, (Fn - 1)))
    print(string.sub(epeius, (Cn + 1), -1) .. string.sub(epeius, Cn, (Cn - 0)))
    print(string.sub(epeius, (Gn + 1), -1) .. string.sub(epeius, Cn, (Gn - 1)))
    print(string.sub(epeius, (Dn + 1), -1) .. string.sub(epeius, Cn, (Dn - 1)))
    print(string.sub(epeius, (An + 1), -1) .. string.sub(epeius, Cn, (An - 1)))
    print(string.sub(epeius, (En + 1), -1) .. string.sub(epeius, Cn, (En - 1)))
    print(string.sub(epeius, (Bn + 1), -1) .. string.sub(epeius, Cn, (Bn - 1)))
    print()

  end

  print()

end


