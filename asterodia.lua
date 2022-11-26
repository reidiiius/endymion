#!/usr/bin/env lua

local Asterodia = {}

local bank = setmetatable(require('olympiad'), {

  __index = function(bank, sign)
    local tune = function(key, ndx)
      assert(type(key) == 'string', 'tune param key not string')
      assert(type(ndx) == 'number', 'tune param ndx not number')

      local wire = bank[key]
      local head = string.sub(wire, (ndx + 1), -1)
      local tail = string.sub(wire, 1, ndx)
      local rope = head .. tail

      assert(string.len(rope) == 60, 'rope length not 60 characters')
      return rope
    end

    if sign == 'i0' or sign == 'z0' then
      local erebus = string.char(32)
      local hypnos = string.char(95)
      local aether = string.rep(hypnos, 4) .. erebus
      local hemera = string.rep(aether, 12)

      assert(string.len(hemera) == 60, 'hemera length not 60 characters')
      return hemera
    elseif sign == 'n145' then return tune('n0', 20)
    elseif sign == 'j367' then return tune('n0', 45)
    elseif sign == 'j37'  then return tune('n0', 10)
    elseif sign == 'j7'   then return tune('n0', 35)
    elseif sign == 'n8'   then return tune('n0',  0)
    elseif sign == 'k4'   then return tune('n0', 25)
    elseif sign == 'k14'  then return tune('n0', 50)
    elseif sign == 'k145' then return tune('n0', 15)
    elseif sign == 'n367' then return tune('n0', 40)
    -- altered
    elseif sign == 'n45'  then return tune('j3', 20)
    elseif sign == 'n124' then return tune('j3', 45)
    elseif sign == 'j237' then return tune('j3', 10)
    elseif sign == 'j67'  then return tune('j3', 35)
    elseif sign == 'k4j7' then return tune('k1', 35)
    elseif sign == 'k45'  then return tune('k1', 25)
    elseif sign == 'k124' then return tune('k1', 50)
    elseif sign == 'n237' then return tune('k1', 15)
    elseif sign == 'n67'  then return tune('k1', 40)
    else return nil
    end

  end
})

local pegs = {
  Cn = 0,
  Ck = 5, Dj = 5,
  Dn = 10,
  Dk = 15, Ej = 15,
  En = 20,
  Fn = 25,
  Fk = 30, Gj = 30,
  Gn = 35,
  Gk = 40, Aj = 40,
  An = 45,
  Ak = 50, Bj = 50,
  Bn = 55,
}

Asterodia.stocks = {
  'beadgcf', 'bfbfb', 'cgdae', 'eadgbe', 'fkbjdn'
}

Asterodia.gearbox = function(tuned)
  assert(type(tuned) == 'string', 'gearbox param not string')

  local box;
  if tuned == 'beadgcf' then
    box = {pegs.Fn, pegs.Cn, pegs.Gn, pegs.Dn, pegs.An, pegs.En, pegs.Bn}
  elseif tuned == 'bfbfb' then
    box = {pegs.Bn, pegs.Fn, pegs.Bn, pegs.Fn, pegs.Bn}
  elseif tuned == 'cgdae' then
    box = {pegs.En, pegs.An, pegs.Dn, pegs.Gn, pegs.Cn}
  elseif tuned == 'eadgbe' then
    box = {pegs.En, pegs.Bn, pegs.Gn, pegs.Dn, pegs.An, pegs.En}
  elseif tuned == 'fkbjdn' then
    box = {pegs.Dn, pegs.Bj, pegs.Fk, pegs.Dn, pegs.Bj, pegs.Fk}
  else
    box = {pegs.Cn}
  end

  return box
end

Asterodia.tuning = 'beadgcf' -- default

Asterodia.stones = Asterodia.gearbox(Asterodia.tuning)

local trans = {
 Ag='s',Au='u',Cu='r',Fe='q',Hg='v',Mn='p',
 Np='y',Pb='w',Pu='z',Sn='t',Ti='o',Ur='x',
}

Asterodia.morph = function(str)
  assert(type(str) == 'string', 'morph param not string')

  local yarn;
  yarn = string.gsub(str, '(%u%l)', trans)
  yarn = string.gsub(yarn, '____', '__')

  assert(string.len(yarn) == 36, 'yarn length not 36 characters')
  return yarn
end

Asterodia.toggle = true

local function tuner(str, ndx)
  assert(type(str) == 'string', 'tuner param str not string')
  assert(type(ndx) == 'number', 'tuner param ndx not number')

  local head = string.sub(str, (ndx + 1), -1)
  local tail = string.sub(str, 1, ndx)
  local rope = head .. tail

  assert(string.len(rope) == 60, 'rope length not 60 characters')
  if Asterodia.toggle then
    return Asterodia.morph(rope)
  else
    return rope
  end
end

local function tabbed(str)
  assert(type(str) == 'string', 'tabbed param not string')
  return string.format("\t%s", str)
end

local function board(header, stream)
  assert(type(header) == 'string', 'board param header not string')
  assert(type(stream) == 'string', 'board param stream not string')

  print(tabbed(header))
  for pitch = 1, #Asterodia.stones do
    print(tabbed(tuner(stream, Asterodia.stones[pitch])))
  end
  print()

  return nil
end

local cronus = os.time()

Asterodia.Eurycyda = function(sign)
  assert(type(sign) == 'string', 'Eurycyda param not string')

  if type(bank) == 'table' then

    if bank[sign] then
      local cord = bank[sign]
      local span = 60

      if type(cord) ~= 'string' then
        error("cord is type ".. type(cord), 1)
      end

      if string.len(cord) ~= span then
        error("cord length not ".. span .." characters", 1)
      end

      local band = string.format("%s-%s-i%u", sign, Asterodia.tuning, cronus)

      board(band, cord)
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
  local base = require('olympiad')

  if type(base) == 'table' then
    local catalog = {}
    local liter = 1

    for clef, _ in pairs(base) do
      catalog[liter] = clef
      liter = liter + 1
    end

    catalog[#catalog + 1] = 'z0'

    table.sort(catalog)
    return catalog
  else
    error("base is type ".. type(base), 1)
  end
end

Asterodia.Paeon = function(list)
  assert(type(list) == 'table', 'Paeon param not table')

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

