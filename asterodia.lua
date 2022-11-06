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
  local span = 60
  local bank = setmetatable(require('olympiad'), {

    __index = function(bank, sign)
      local nyx = string.rep(string.char(95), 4) .. string.char(32)

      local peg = function(key, ndx)
        local str = bank[key]

        if (string.len(str) ~= span) then
          error("string length not ".. span .." characters", 1)
        end

        local head = string.sub(str, (ndx + 1), -1)
        local tail = string.sub(str, 1, ndx)

        return head .. tail
      end

      if sign == 'z0' then return string.rep(nyx, 12)
      elseif sign == 'n145' then return peg('n0', 20)
      elseif sign == 'j367' then return peg('n0', 45)
      elseif sign == 'j37'  then return peg('n0', 10)
      elseif sign == 'j7'   then return peg('n0', 35)
      elseif sign == 'n8'   then return peg('n0',  0)
      elseif sign == 'k4'   then return peg('n0', 25)
      elseif sign == 'k14'  then return peg('n0', 50)
      elseif sign == 'k145' then return peg('n0', 15)
      elseif sign == 'n367' then return peg('n0', 40)
      -- altered
      elseif sign == 'n45'  then return peg('j3', 20)
      elseif sign == 'n124' then return peg('j3', 45)
      elseif sign == 'j237' then return peg('j3', 10)
      elseif sign == 'j67'  then return peg('j3', 35)
      elseif sign == 'k4j7' then return peg('k1', 35)
      elseif sign == 'k45'  then return peg('k1', 25)
      elseif sign == 'k124' then return peg('k1', 50)
      elseif sign == 'n237' then return peg('k1', 15)
      elseif sign == 'n67'  then return peg('k1', 40)
      else return nil
      end

    end
  })

  if type(bank) == 'table' then

    if bank[sign] then
      local record = bank[sign]

      if (string.len(record) ~= span) then
        error("string length not ".. span .." characters", 1)
      end

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

      local stock = gearbox(tuning)

      local function tuner(ndx)
        local head = string.sub(record, (ndx + 1), -1)
        local tail = string.sub(record, 1, ndx)

        return head .. tail
      end

      local function tabbed(str)
        return string.format("\t%s", str)
      end

      local function board(header, stones)
        print(tabbed(header))
        for pitch = 1, #stones do
          print(tabbed(tuner(stones[pitch])))
        end
        print()

        return nil
      end

      board(diadem, stock)
    else
      local mistake = string.format("\t%s ?\n", sign)

      print(mistake)
    end

  else
    return nil
  end

end

return PROTOGENEIA

