#!/usr/bin/env lua

local PROTOGENEIA = {}

PROTOGENEIA.Deucalion = function()

  local bank = setmetatable(require('olympiad'), {})

  local catalogue = {}
  local itera = 1

  for clave, data in pairs(bank) do
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

PROTOGENEIA.Eurycyda = function(sign)

  local bank = setmetatable(require('olympiad'), {

    __index = function(bank, sign)
      local nyx = string.rep(string.char(95), 4) .. string.char(32)

      local peg = function(ndx)
        local head = string.sub(bank.n0, (ndx + 1), -1)
        local tail = string.sub(bank.n0, 1, ndx)

        return head .. tail
      end

      if sign == 'z0' then return string.rep(nyx, 12)
      elseif sign == 'j367' then return peg(45)
      elseif sign == 'j37' then return peg(10)
      elseif sign == 'j7' then return peg(35)
      elseif sign == 'n8' then return peg(0)
      elseif sign == 'k4' then return peg(25)
      elseif sign == 'k14' then return peg(50)
      elseif sign == 'k145' then return peg(15)
      else return nil
      end

    end
  })

  if type(bank) == 'table' then

    if bank[sign] then
      local record = bank[sign]

      local tuning = 'beadgcf'

      local diadem = string.format("%s-%s-i%u", sign, tuning, os.time())

      local Bj, Fn, Cn, Gn, Dn, An, En, Bn, Fk =
            50, 25,  0, 35, 10, 45, 20, 55, 30

      local gearbox = function(tuned)
        if tuned == 'beadgcf' then
          return {Fn, Cn, Gn, Dn, An, En, Bn}
        elseif tuned == 'bfbfb' then
          return {Bn, Fn, Bn, Fn, Bn}
        elseif tuned == 'cgdae' then
          return {En, An, Dn, Gn, Cn}
        elseif tuned == 'eadgbe' then
          return {En, Bn, Gn, Dn, An, En}
        elseif tuned == 'fkbjdn' then
          return {Dn, Bj, Fk, Dn, Bj, Fk}
        else
          return {Cn}
        end
      end

      local headstock = gearbox(tuning)

      local function tuner(ndx)
        local head = string.sub(record, (ndx + 1), -1)
        local tail = string.sub(record, 1, ndx)

        return head .. tail
      end

      local function tabbed(str)
        return string.format("\t%s", str)
      end

      local function boards(header, stones)
        print(tabbed(header))
        for pitch = 1, #stones do
          print(tabbed(tuner(stones[pitch])))
        end
        print()

        return nil
      end

      boards(diadem, headstock)
    else
      local mistake = string.format("\t%s ?\n", sign)

      print(mistake)
    end

  else
    return nil
  end

end

return PROTOGENEIA

