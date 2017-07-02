#!/usr/bin/env lua

PROTOGENEIA = {}

PROTOGENEIA.Eurycyda = function()

  local aetolus = os.time()

  local Fn, Cn, Gn, Dn, An, En, Bn =
        25,  0, 35, 10, 45, 20, 55

  print()

  for paeon, epeius in pairs(AXIUS) do

    local s0, s1, s2, s3, s4, s5, s6, s7 =
    paeon .. '-beadgcf-v' .. aetolus,
    string.sub(epeius, (Fn + 1), -1) .. string.sub(epeius, Cn, Fn),
    string.sub(epeius, (Cn + 1), -1) .. string.sub(epeius, Cn, Cn),
    string.sub(epeius, (Gn + 1), -1) .. string.sub(epeius, Cn, Gn),
    string.sub(epeius, (Dn + 1), -1) .. string.sub(epeius, Cn, Dn),
    string.sub(epeius, (An + 1), -1) .. string.sub(epeius, Cn, An),
    string.sub(epeius, (En + 1), -1) .. string.sub(epeius, Cn, En),
    string.sub(epeius, (Bn + 1), -1) .. string.sub(epeius, Cn, Bn)

    print()
    print(string.format("\t%s", s0))
    print(string.format("\t%s", s1))
    print(string.format("\t%s", s2))
    print(string.format("\t%s", s3))
    print(string.format("\t%s", s4))
    print(string.format("\t%s", s5))
    print(string.format("\t%s", s6))
    print(string.format("\t%s", s7))
    print()

  end

  print()

end


