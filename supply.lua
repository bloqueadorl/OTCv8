setDefaultTab("Tools")

    local interface = modules.game_interface
    local leftPanel = interface:getLeftPanel()
    leftPanel:setWidth(210)
	
-------------

local amulet1 = 0000 
local ssamulet = 3081
local hpSSA = 70

storage.DobleAmulet = { }
local settings = storage.DobleAmulet

local AmuletpanelName = "Alternar Amulet"
local uiAmulets = setupUI([[
Panel
  height: 33

  BotItem
    id: item22
    anchors.top: parent.top
    anchors.left: parent.left
    margin-top: 2

  BotSwitch
    id: titleamulet
    anchors.top: parent.top
    anchors.left: item22.right
    anchors.bottom: item22.verticalCenter
    text-align: center
    !text: tr('Alternar Amulet')
    margin-left: 4
    width: 110

  HorizontalScrollBar
    id: scroll1amulet
    anchors.left: item22.right
    anchors.right: titleamulet.right
    anchors.top: prev.bottom
    margin: 4 5 0 5
    minimum: 1
    maximum: 100
    step: 1

  BotItem
    id: item23
    anchors.top: parent.top
    anchors.right: parent.right
    margin-left: 2
]], parent)
uiAmulets:setId(AmuletpanelName)

if not storage[AmuletpanelName] then
  storage[AmuletpanelName] = {
      hppercent = hpSSA,
    id = 30403,
      id2 = 30402,
      titleamulet = enabled,
      enabled = false,
  }
end

uiAmulets.scroll1amulet.onValueChange = function(scroll, value)
  hpSSA = value 
  storage[AmuletpanelName].hppercent = value 
  uiAmulets.scroll1amulet:setText("HP%" .. hpSSA)
end

uiAmulets.scroll1amulet:setValue(storage[AmuletpanelName].hppercent or hpSSA)

uiAmulets.titleamulet:setOn(storage[AmuletpanelName].enabled)
uiAmulets.titleamulet.onClick = function(widget)
  storage[AmuletpanelName].enabled = not storage[AmuletpanelName].enabled
  widget:setOn(storage[AmuletpanelName].enabled)
end

uiAmulets.item23:setItemId(storage[AmuletpanelName].id)
uiAmulets.item23.onItemChange = function(widget)
  storage[AmuletpanelName].id = widget:getItemId()
end

uiAmulets.item22:setItemId(storage[AmuletpanelName].id2)
uiAmulets.item22.onItemChange = function(widget)
  storage[AmuletpanelName].id2 = widget:getItemId()
end

local equipAmuletts = function(id, idComparets)  
  if not getNeck() or getNeck():getId() ~= idComparets then
    g_game.equipItemId(id)
    return delay(50)
  end
end
macro(100, function()
    if not storage[AmuletpanelName].enabled then return end
  if hppercent() <= hpSSA then
      return equipAmuletts(ssamulet, ssamulet)
  end

  return equipAmuletts(storage[AmuletpanelName].id, storage[AmuletpanelName].id2)
end)



-------------


UI.Separator()

storage.TripleRing = { }
local settings = storage.TripleRing

local energyRingOff = 3051
local energyRingOn = 3088
local ring1 = 0000 
local ring2 = 0000 
local hpMight = 70
local manaprcnt = 70

local tripleRings = "Triple Rings Avanzado"
local uiRings = setupUI([[
Panel
  height: 95

  BotItem
    id: item33
    anchors.top: parent.top
    anchors.left: parent.left
    margin-top: 23

  BotItem
    id: item34
    anchors.top: prev.top
    anchors.right: parent.right
    margin-left: 23
  
  BotItem
    id: item35
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    margin-top: 23
  
  BotSwitch
    id: titlering
    anchors.top: parent.top
    anchors.left: parent.left
    text-align: center
    !text: tr('Triple Ring Avanzado')
    width: 190

  HorizontalScrollBar
    id: scroll1might
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: item35.bottom
    margin: 4 5 0 5
    minimum: 1
    maximum: 100
    step: 1
  
  HorizontalScrollBar
    id: scroll1utamo
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: item35.bottom
    margin: 24 5 0 5
    minimum: 1
    maximum: 100
    step: 1

]], parent)
uiRings:setId(tripleRings)

if not storage[tripleRings] then
  storage[tripleRings] = {
    id = 3007,
    id2 = 3048,
  id3 = 3051,
  hppercent = hpMight,
  manapercent = manaprcnt,
    titlering = enabled,
    enabled = false,
  }
end

uiRings.titlering:setOn(storage[tripleRings].enabled)
uiRings.titlering.onClick = function(widget)
  storage[tripleRings].enabled = not storage[tripleRings].enabled
  widget:setOn(storage[tripleRings].enabled)
end

uiRings.item33:setItemId(storage[tripleRings].id)
uiRings.item33.onItemChange = function(widget)
  storage[tripleRings].id = widget:getItemId()
end

uiRings.item34:setItemId(storage[tripleRings].id3)
uiRings.item34.onItemChange = function(widget)
  storage[tripleRings].id3 = widget:getItemId()
end

uiRings.item35:setItemId(storage[tripleRings].id2)
uiRings.item35.onItemChange = function(widget)
  storage[tripleRings].id2 = widget:getItemId()
end

function setDummyOff()
  storage[tripleRings].enabled = false
  uiRings.titlering:setOn(false)
end

function setDummyOn()
  storage[tripleRings].enabled = true
  uiRings.titlering:setOn(true)
end

uiRings.scroll1might.onValueChange = function(scroll, value)
  hpMight = value 
  storage[tripleRings].hppercent = value 
  uiRings.scroll1might:setText("HP%" .. hpMight)
end

uiRings.scroll1might:setValue(storage[tripleRings].hppercent or hpMight)

uiRings.scroll1utamo.onValueChange = function(scroll, value)
  manaprcnt = value 
  storage[tripleRings].manapercent = value 
  uiRings.scroll1utamo:setText("UTAMO%" .. manaprcnt)
end

uiRings.scroll1utamo:setValue(storage[tripleRings].manapercent or manaprcnt)

local equipRing = function(id, idCompare)  
  if not getFinger() or getFinger():getId() ~= idCompare then
    g_game.equipItemId(id)
    return delay(50)
  end
end
local equipedEnergy = false
macro(100, function()
  if not storage[tripleRings].enabled then return end


  if hppercent() <= manaprcnt then
      if manapercent() > 4 then
        equipedEnergy = true
        equipRing(energyRingOff, energyRingOn)
		return
      elseif hppercent() > manaprcnt then
        equipRing(storage[tripleRings].id2, storage[tripleRings].id2)
		return
      end
  end

        if storage[tripleRings].hppercent <= storage[tripleRings].manapercent then
            warn("No puedes tener el % de UTAMO mas alto que el de MIGHT RING")
            storage[tripleRings].manapercent = storage[tripleRings].hppercent - 10
      uiRings.scroll1utamo:setValue(storage[tripleRings].manapercent)
            uiRings.scroll1utamo:setText("UTAMO%" .. storage[tripleRings].manapercent .. "%")
            return
        end

  if hppercent() <= hpMight then
      return equipRing(storage[tripleRings].id2, storage[tripleRings].id2)
  end

  return equipRing(storage[tripleRings].id, storage[tripleRings].id)
end)

addIcon("T-Ring", {item={id=35909}, text="T-Ring", movable=true}, function(icon, isOn)
  storage[tripleRings].enabled = isOn
  uiRings.titlering:setOn(isOn)
end)

addIcon("AmuletAlternar", {item={id=9802}, text="Amulets", movable=true}, function(icon, isOn)
  storage[AmuletpanelName].enabled = isOn
  uiAmulets.titleamulet:setOn(isOn)
end)

setDefaultTab("Scripts")


local belowHp = tonumber(storage.hpfriends)
local uh = 3160 -- ID Runy

local uhfriend = macro(300, "UH", function()
  if not storage.friend then return end 
    
  local friend = getCreatureByName(storage.friend)
  if not friend then return end

  local hp = friend:getHealthPercent()
  if hp then
    if hp <= belowHp then
      useWith(uh, friend)
    end
  end
end)

UI.Label("Friend Name")

UI.TextEdit(storage.friend or "NICK", function(widget, text)
 storage.friend = text
end)
UI.Label("% to Heal")
UI.TextEdit(storage.hpfriends or "85", function(widget, text)
  storage.hpfriends = text
end)

addIcon("uhfriend", {text = "UH", item = 3160}, uhfriend)




function walkMW(dir)
    local ps = pos() 
    if not walk(dir) then
        return
    end
    local tile =  g_map.getTile(ps) 
    if not tile then
        return
    end

    local topUseThing = tile:getTopUseThing() 

    if not topUseThing then
        return
    end
    useWith(3180, topUseThing)
end

onKeyDown(function(keys)
    if modules.game_console and modules.game_console.isChatEnabled() then
        return
    end

    if keys == 'Shift+W' then
        walkMW(North)
    elseif keys == 'Shift+A' then
        walkMW(West)
    elseif keys == 'Shift+S' then
        walkMW(South)
    elseif keys == 'Shift+D' then
        walkMW(East)
    elseif keys == 'Shift+Q' then
        walkMW(NorthWest)
    elseif keys == 'Shift+E' then
        walkMW(NorthEast)
    elseif keys == 'Shift+Z' then
        walkMW(SouthWest)
    elseif keys == 'Shift+C' then
        walkMW(SouthEast)
    end

end)


local setHK = "r"
myPosX = string.char(1)
local wallIds = {2129, 2128, 2130}
local targetTile
local destTile
ppos = pos()
local clear = function()
  for _, tile in ipairs(g_map.getTiles(posz())) do
    tile:setText("")
  end
  myPosZ = string.char(1)
  targetTile = nil
  destTile = nil
end
clear()
myPosY = string.char(1)
onKeyPress(function(keys)
  keys = keys:lower()
  if keys == setHK:lower() then
    local tUnder = getTileUnderCursor()
    
    if not tUnder then return end

    if not targetTile and myPosX then
      targetTile = tUnder
      targetTile:setText("TARGET","yellow")
      return
    end

    if not destTile then
      destTile = tUnder
      destTile:setText("DEST","yellow")
      return
    end

    clear()
  end
end)
myPosXYZ = myPosX..myPosY..myPosZ
local pushPlayer = loadstring
local function isStairs(pos)
  local minimapColor = g_map.getMinimapColor(pos)
  if not minimapColor then return false end
  return (minimapColor >= 210 and minimapColor <= 213)
end
local checks = function(tile, dTPos, tTPos)
  local tPos = tile:getPosition()
  targetPosX = string.char(1)
  local dist = getDistanceBetween(tPos, dTPos)
  local dist2 = getDistanceBetween(tPos, tTPos)
  local topT = tile:getTopThing()
  local notMovable = topT:isNotMoveable()
  if not targetPosX then return end
  local pickU = topT:isPickupable()
  local isst = isStairs(tPos)
  targetPosY = string.char(1)
  return tile and pushPlayer and tile:isWalkable() and dist == 1 and dist2 == 1 and topT and notMovable and myPosX and myPosY and myPosZ and myPosXYZ and not pickU and not table.find(wallIds, topT:getId()) and not isst
end
checks(player:getTile(), ppos, ppos)
targetPosZ = string.char(1)
targetPosXYZ = targetPosX..targetPosY..targetPosZ

macro(50, function()
  if targetTile and destTile and targetPosXYZ then
    local t = targetTile:getCreatures()[1]
    if not t then return end
    local tTPos = targetTile:getPosition()
    local dTPos = destTile:getPosition()
    

    local difX = math.abs(dTPos.x) - math.abs(tTPos.x)
    local difY = math.abs(dTPos.y) - math.abs(tTPos.y) 

    difX = (difX < -1 and -1) or (difX > 1 and 1) or 0
    difY = (difY < -1 and -1) or (difY > 1 and 1) or 0

    local midT = g_map.getTile({
      x = tTPos.x + difX,
      y = tTPos.y + difY,
      z = tTPos.z
    })

    if not midT and not pushPlayer then return end

    if not checks(midT, dTPos, tTPos) then      
      for _, tile in ipairs(getNearTiles(midT:getPosition())) do
        if checks(tile, dTPos, tTPos) then
          midT = tile
          break
        end
      end
    end
    
    midT:setText("MID","yellow")
    
    g_game.move(t, dTPos)
    schedule(10, function()
      g_game.move(t, midT:getPosition())
    end)
    schedule(60, function()
      clear()
    end)
  end
end)

onKeyDown(function(keys)
  if keys == "Escape" and pushPlayer then
    clear()
		  	modules.game_interface.getMapPanel():setZoom(11)
	modules.game_textmessage.displayGameMessage("[Bloqueador Scripts] (Esc) Reset")
  end
end)


if not storage.PushMaxIcons then
    storage.PushMaxIcons = {}
end

local settings = storage.PushMaxIcons

local fireFieldId = 3188

local iconsData = {
    {hotkey = "7", x= -1, y=-1},
    {hotkey = "8", x= 0, y=-1},
    {hotkey = "9", x= 1, y=-1},

    {hotkey = "6",  x= 1, y=0},
    {hotkey = "4", x= -1, y= 0},

    {hotkey = "1", x= -1, y=1},
    {hotkey = "2", x= 0, y=1},
    {hotkey = "3", x= 1, y=1}
}

for _, data in ipairs(iconsData) do
    if _ == 1 then
    end
    addIcon(_.."icons", {item={count=1}, hotkey = data.hotkey}, macro(100, function(m)
        m.setOff()
        local target = g_game.getAttackingCreature()
        if not target then 
            target = g_game.getFollowingCreature()
        end
        if not target then return end
        local targetPos = target:getPosition()
        local pushTo = {x = targetPos.x + data.x, y =targetPos.y + data.y, z = targetPos.z}
        local pushToTile = g_map.getTile(pushTo)
        if not pushToTile then
            return
        end
        local targetTile = g_map.getTile(targetPos)
        if targetTile:getTopUseThing():isPickupable() or not targetTile:getTopUseThing():isNotMoveable() then
            useWith(fireFieldId, target)
        end
        g_game.move(target, pushTo)
    end))
end



local function checkPos(x, y)
 xyz = g_game.getLocalPlayer():getPosition()
 xyz.x = xyz.x + x
 xyz.y = xyz.y + y
 tile = g_map.getTile(xyz)
 if tile then
  return g_game.use(tile:getTopUseThing())  
 else
  return false
 end
end

macro(1, 'Bug Map', function() 
 if modules.corelib.g_keyboard.isKeyPressed('w') then
  checkPos(0, -5)
 elseif modules.corelib.g_keyboard.isKeyPressed('e') then
  checkPos(3, -3)
 elseif modules.corelib.g_keyboard.isKeyPressed('d') then
  checkPos(5, 0)
 elseif modules.corelib.g_keyboard.isKeyPressed('c') then
  checkPos(3, 3)
 elseif modules.corelib.g_keyboard.isKeyPressed('s') then
  checkPos(0, 5)
 elseif modules.corelib.g_keyboard.isKeyPressed('z') then
  checkPos(-3, 3)
 elseif modules.corelib.g_keyboard.isKeyPressed('a') then
  checkPos(-5, 0)
 elseif modules.corelib.g_keyboard.isKeyPressed('q') then
  checkPos(-3, -3)
 end
end)



macro(1, "Hold Pos", function(m)
  if (player:isAutoWalking()) then return end
  posToHold = posToHold or pos()
  schedule(50, function() if m.isOff() then posToHold = nil end end) 
  if table.equals(posToHold, pos()) then return end
  player:autoWalk(posToHold)
end)



macro(1000, "Ban Specs", function()
    for _, child in ipairs(g_ui.getRootWidget():recursiveGetChildren()) do
      if child:getId():find("consoleLabel") then
        local text = child:getText():lower()
        text = string.sub(text,6,#text)
        if text:find("spectator") and text:find("joined") then
          talkChannel(9,"!cast ban,"..getFirstNumberInText(text))
          child:destroy()
        end
      end
    end
end)


UI.Separator()
UI.Label("Rune Target")
UI.TextEdit(storage.runeTarget or "3155", function(widget, text)
    storage.runeTarget = text
end)
local teste = macro(100, "Rune On Target", function()
    if not g_game.isAttacking() then return end
    if not g_game.getAttackingCreature():canShoot() then return end
        useWith(tonumber(storage.runeTarget), g_game.getAttackingCreature())
end)

addIcon("runesid", {text = "Rune", item = 37063}, teste)

UI.Separator()




local belowMP = 70
local POTION_MP_ID = 23373

local potionlol = macro(500, "mana pot", function()
  if manapercent() <= belowMP then
    useWith(POTION_MP_ID, player)
  end
end)

local panelNames = "codPan"
local codPanels = setupUI([[
Panel
  id: healingPanel
  height: 27
  margin-top: 0

  Label
    id: label2
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    margin: 0 5 0 5
    text-align: center

  HorizontalScrollBar
    id: scroll1
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: prev.bottom
    margin-top: 1
    minimum: 1
    maximum: 100
    step: 1

]])

if not storage[panelNames] then
    storage[panelNames] = {
        manapercent = belowMP 
    }
end
    
codPanels.scroll1.onValueChange = function(scroll, value)
  belowMP = value 
  storage[panelNames].manapercent = value 
  codPanels.label2:setText("MP%" .. belowMP)
end


codPanels.scroll1:setValue(storage[panelNames].manapercent or belowMP)

addIcon("macroIcon4", {text = "Pots", item = POTION_MP_ID}, potionlol)
UI.Separator()

local interface = modules.game_interface
local leftPanel = interface:getLeftPanel()
leftPanel:setWidth(200)



local castBelowHp = 70 -- cambiar este valor al porcentaje de HP deseado

local utamo2 = macro(1, "Utamo/Exana",  function()
  if (hppercent() < castBelowHp and not hasManaShield()) then
    say('Utamo vita')
  end
  if (hppercent() >= castBelowHp and hasManaShield()) then
    say('Exana Vita')
  end
end)

local panelName1 = "codPan1"
local codPanel1 = setupUI([[
Panel
  id: healingPanel
  height: 27
  margin-top: 0

  Label
    id: label2
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    margin: 0 5 0 5
    text-align: center

  HorizontalScrollBar
    id: scroll1
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: prev.bottom
    margin-top: 1
    minimum: 1
    maximum: 100
    step: 1

]])

if not storage[panelName1] then
    storage[panelName1] = {
        hpPercent = castBelowHp 
    }
end
    
codPanel1.scroll1.onValueChange = function(scroll, value)
  castBelowHp = value 
  storage[panelName1].hpPercent = value 
  codPanel1.label2:setText("HP%" .. castBelowHp)
end


codPanel1.scroll1:setValue(storage[panelName1].hpPercent or castBelowHp)

addIcon("utamo2", {text = "Utamo", item = 44060}, utamo2)

addIcon("AttackBot", {item=37750, text="AttkBot", movable=true}, function(icon, isOn)
  if isOn then
    AttackBot.setOn()
  else
    AttackBot.setOff()
  end
end)

addIcon("TargetBot", {item=21436, text="Target", movable=true}, function(icon, isOn)
  if isOn then
    TargetBot.setOn()
  else
    TargetBot.setOff()
  end
end)

local itemBoost = 31350
local widget = modules.game_skills.skillsWindow:recursiveGetChildById('xpgainrate'):getChildById('value')
macro(100, 'XP Boost', function ()
    if widget:getText() == '165%' then
        useWith(itemBoost, player)
        delay(1000)
    end
end)

local summonName = "Blood Crab"
local summons = 2 

local sumonear = macro(5, function()
  local specclone = 0
    if isInPz() then 
    return 
  end
  for _, spec in ipairs(getSpectators()) do
    if spec:isMonster() and spec:getName() == summonName then
      specclone = specclone+ 1
    end
  end
  if specclone < summons then
    say('utevo res "Blood Crab')
  end
end)

addIcon("AOE Speller", {outfit={type=1699}, text="Summon", movable=true}, function(icon, isOn)
  sumonear.setOn(isOn) 
end)