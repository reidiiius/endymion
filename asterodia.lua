#!/usr/bin/env lua

local Asterodia = {}

local bank = setmetatable(require('olympiad'), {

  __index = function(bank, sign)
    local nyx = string.rep(string.char(95), 4) .. string.char(32)

    local peg = function(key, ndx)
      local rewire = bank[key]

      if type(rewire) ~= 'string' then
        error("rewire is type ".. type(rewire), 1)
      end

      if string.len(rewire) ~= span then
        error("rewire length not ".. span .." characters", 1)
      end

      local head = string.sub(rewire, (ndx + 1), -1)
      local tail = string.sub(rewire, 1, ndx)

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

local tuning = 'beadgcf'

local stones = gearbox(tuning)

local trans = {
 Ag='s',Au='u',Cu='r',Fe='q',Hg='v',Mn='p',
 Np='y',Pb='w',Pu='z',Sn='t',Ti='o',Ur='x',
}

local function morph(str)
  local yarn;
  yarn = string.gsub(str, '(%u%l)', trans)
  yarn = string.gsub(yarn, '____', '__')

  assert(string.len(yarn) == 36, 'yarn length not 36 characters')
  return yarn
end

local toggle = true

local function tuner(str, ndx)
  local head = string.sub(str, (ndx + 1), -1)
  local tail = string.sub(str, 1, ndx)
  local rope = head .. tail

  if toggle then
    return morph(rope)
  else
    return rope
  end
end

local function tabbed(str)
  return string.format("\t%s", str)
end

local function board(header, rewire)
  print(tabbed(header))
  for pitch = 1, #stones do
    print(tabbed(tuner(rewire, stones[pitch])))
  end
  print()

  return nil
end

local cronus = os.time()

Asterodia.Eurycyda = function(sign)
  local span = 60

  if type(bank) == 'table' then

    if bank[sign] then
      local record = bank[sign]

      if type(record) ~= 'string' then
        error("record is type ".. type(record), 1)
      end

      if string.len(record) ~= span then
        error("record length not ".. span .." characters", 1)
      end

      local diadem = string.format("%s-%s-i%u", sign, tuning, cronus)

      board(diadem, record)
    else
      local mistake = string.format("\t%s ?\n", sign)

      print(mistake)
      return nil
    end

  else
    error("bank is type ".. type(bank), 1)
  end
end

Asterodia.Naxos = function()
  local bank = require('olympiad')

  if type(bank) == 'table' then
    local catalog = {}
    local liter = 1

    for clef, data in pairs(bank) do
      catalog[liter] = clef
      liter = liter + 1
    end

    catalog[#catalog + 1] = 'z0'

    table.sort(catalog)

    return catalog
  else
    error("bank is type ".. type(bank), 1)
  end
end

Asterodia.Paeon = function(list)
  print()
  for item = 1, #list, 1 do
    if (item % 7 == 0) then
      io.write(string.format("\t%s\n", list[item]))
    else
      io.write(string.format("\t%s", list[item]))
    end
  end
  print()

  return nil
end

return Asterodia

