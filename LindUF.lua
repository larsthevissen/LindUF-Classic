LindUF = {}
LindUF.font = "Fonts\\2002.TTF"
LindUF.border = "Interface\\Addons\\LindUF\\LindBorder.tga"
LindUF.bg = "Interface\\Addons\\LindUF\\LindBar.tga"

LindUF.PowerColor = function(unit)
  local powerType, powerToken, altR, altG, altB = UnitPowerType(unit)
  local info = PowerBarColor[powerToken]
  if ( info ) then
    r, g, b = info.r, info.g, info.b
  elseif ( not altR) then
    info = PowerBarColor[powerType] or PowerBarColor["MANA"]
    r, g, b = info.r, info.g, info.b
  else
    r, g, b = altR, altG, altB
  end
  return r, g, b
end

LindUF.ClassColor = function(unit)
  local class, classFileName = UnitClass(unit)
  local color = RAID_CLASS_COLORS[classFileName] or {r=0, g=1, b=0}
  return color.r, color.g ,color.b
end

-- reposition the alternative Power Bar
PlayerPowerBarAlt:ClearAllPoints()
PlayerPowerBarAlt:SetParent("UIParent")
PlayerPowerBarAlt:SetPoint("TOP", UIParent, "TOP", 0, -30)
PlayerPowerBarAlt:SetScale(0.75)
PlayerPowerBarAlt:SetMovable(true)
PlayerPowerBarAlt:SetUserPlaced(true)
