-- PlayerFrame:SetScript("OnEvent", nil);
-- PlayerFrame:Hide();
-- TargetFrame:SetScript("OnEvent", nil);
-- TargetFrame:Hide();

local font = "Fonts\\2002.TTF"

LindUF = {}

local Zero = function(aUnit)

  f = CreateFrame("Button", "lind_"..aUnit, UIParent, "SecureUnitButtonTemplate")
  f:SetWidth(100)
  f:SetHeight(25)
  f:SetPoint("CENTER", 0, 0)
  f:RegisterForClicks("LeftButtonUp", "RightButtonUp");
  f:SetAttribute('type1', 'target');
  f:SetAttribute('type2', 'menu');
  f:SetAttribute('unit', aUnit);
  f.nameLength = 6
  f.power = 0
  f.relPower = 0

  f.menu = function(self, unit, button, actionType)
    ToggleDropDownMenu(1, nil, TargetFrameDropDown, self, 0, 0);
  end
  RegisterUnitWatch(f)
  f.unit = aUnit
  f.LifeBar = CreateFrame("StatusBar", "lind_"..aUnit.."_life", f)
  f.LifeBar:SetPoint("Top", f, 0, 0)

  f.LifeBar:SetBackdrop( {
      bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
      edgeFile = "Interface\\AddOns\\LindUF\\LindBorder.tga",
      tile = false, tileSize = 0, edgeSize = 8,
      insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
  f.LifeBar:SetBackdropColor(0, 1, 0, 0);
  f.LifeBar:SetBackdropBorderColor(1, 1, 1, 0.8)
  f.LifeBar.parent = f
  f.LifeBar:SetMinMaxValues(0, 100)
  f.LifeBar:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.LifeBar:SetStatusBarColor(1, 0, 0, 0.7)
  f.LifeBar:SetHeight(20)
  f.LifeBar:SetWidth(100)

  f.Name = f.LifeBar:CreateFontString(nil, "OVERLAY")
  f.Name:SetFont(font, 14, "OUTLINE")
  f.Name:SetTextColor(1, 1, 1)
  f.Name:SetPoint("LEFT", f.LifeBar, 2, 0)

  f:SetScript("OnEnter", function(self, event, ...)
      GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
      GameTooltip:SetUnit(self.unit)
      GameTooltip:Show()
    end)
  f:SetScript("OnLeave", function(self, event, ...)
      GameTooltip:Hide()
    end)

  f.LifeBar:SetScript("OnUpdate", function(self, ...)
    local IconIndex = GetRaidTargetIndex(self.parent.unit)
    if IconIndex then
      if not self.raidIcon then
        self.raidIcon = CreateFrame("Frame", self.parent.unit.."Icon", self)
        self.raidIcon:SetWidth(32)
        self.raidIcon:SetHeight(32)
        self.raidIcon:SetPoint("CENTER", self, "CENTER", 0, 10)
        self.raidIcon.texture = self.raidIcon:CreateTexture(nil, "BACKGROUND")
        self.raidIcon.texture:SetAllPoints(self.raidIcon)
      end
      self.raidIcon.texture:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..IconIndex..".PNG")
    else
      if self.raidIcon then
        self.raidIcon.texture:SetTexture(nil)
      end
    end
      local name = UnitName(self.parent.unit)
      if name and name ~= self.parent.Name:GetText() then
        if(strlen(name) <= self.parent.nameLength) then
          self.parent.Name:SetText(name)
        else
          self.parent.Name:SetText(strsub(name, 1, self.parent.nameLength))
        end
      end
      local health = UnitHealth(self.parent.unit)
      local healthMax = UnitHealthMax(self.parent.unit)
      local percent = 100 * health / healthMax
      self.parent.health = health
      self.parent.relHealth = math.floor(percent)
      self:SetMinMaxValues(0, healthMax)
      self:SetValue(healthMax - health)
    end)
  return f
end

local One = function(aUnit)
  f = Zero(aUnit)
  f:SetWidth(145)
  f.LifeBar:SetWidth(145)
  f.nameLength = 10

  f.PowerBar = CreateFrame("StatusBar", "lind_"..aUnit.."_life", f)
  f.PowerBar:SetPoint("Top", f, 0, 0)

  f.PowerBar:SetBackdrop( {
      bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
      edgeFile = "Interface\\AddOns\\LindUF\\LindBorder.tga",
      tile = false, tileSize = 0, edgeSize = 8,
      insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
  f.PowerBar:SetBackdropColor(0, 1, 0, 0);
  f.PowerBar:SetBackdropBorderColor(1, 1, 1, 0.8)
  f.PowerBar.parent = f
  f.PowerBar:SetMinMaxValues(0, 100)
  f.PowerBar:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.PowerBar:SetStatusBarColor(1, 1, 1, 0.5)
  f.PowerBar:SetHeight(10)
  f.PowerBar:SetWidth(145)
  f.PowerBar:SetPoint("TOP", 0, -22)

  f.PowerBar:SetScript("OnUpdate", function(self, ...)
      local r, g, b = LindUF.PowerColor(self.parent.unit)
      self:SetStatusBarColor(r, g, b, 1)
      local power = UnitPower(self.parent.unit)
      local powerMax = UnitPowerMax(self.parent.unit)
      if powerMax > 0 then
        self:SetAlpha(1)
        local percent = 100 * power / powerMax
        self.parent.relPower = math.floor(percent)
        self.parent.power = power
        self:SetMinMaxValues(0, powerMax)
        self:SetValue(power)
      else
        self:SetAlpha(0)
      end
    end)

  return f;
end

local Two = function(aUnit)
  f = One(aUnit)
  f.nameLength = 20
  f:SetWidth(300)
  f.LifeBar:SetWidth(300)
  f.PowerBar:SetWidth(300)
  f.textPower = f.PowerBar:CreateFontString(nil, "OVERLAY")
  f.textPower:SetFont(font, 12, "OUTLINE")
  f.textPower:SetTextColor(1, 1, 1)
  f.textPower:SetPoint("RIGHT", f.PowerBar, "LEFT", -2, 0)

  f.textRelPower = f.PowerBar:CreateFontString(nil, "OVERLAY")
  f.textRelPower:SetFont(font, 12, "OUTLINE")
  f.textRelPower:SetTextColor(1, 1, 1)
  f.textRelPower:SetPoint("RIGHT", f.PowerBar, "RIGHT", 45, 0)

  f.textHealth = f.LifeBar:CreateFontString(nil, "OVERLAY")
  f.textHealth:SetFont(font, 12, "OUTLINE")
  f.textHealth:SetTextColor(1, 1, 1)
  f.textHealth:SetPoint("RIGHT", f.LifeBar, "LEFT", -2, 0)

  f.textRelHealth = f.LifeBar:CreateFontString(nil, "OVERLAY")
  f.textRelHealth:SetFont(font, 12, "OUTLINE")
  f.textRelHealth:SetTextColor(1, 1, 1)
  f.textRelHealth:SetPoint("RIGHT", f.LifeBar, "RIGHT", 45, 0)

  f:SetScript("OnUpdate", function(self, ...)
      self.textPower:SetText(self.power)
      self.textRelPower:SetText(self.relPower.."%")
      if self.health < 9999 then
        self.textHealth:SetText(self.health)
      elseif self.health < 9999999 then
        self.textHealth:SetText(math.floor(self.health / 1000).."K")
      else
        self.textHealth:SetText(math.floor(self.health / 1000000).."M")
      end
      self.textRelHealth:SetText(self.relHealth.."%")
    end)

  return f;
end

-- local target = Two("target")
-- target.LifeBar:SetReverseFill(true)
-- target:ClearAllPoints()
-- target:SetPoint("LEFT", UIParent, "CENTER", 150, -150)
-- target.textPower:ClearAllPoints()
-- target.textPower:SetPoint("LEFT", target.PowerBar, "RIGHT", 2, 0)
-- target.textHealth:ClearAllPoints()
-- target.textHealth:SetPoint("LEFT", target.LifeBar, "RIGHT", 2, 0)
-- target.textRelPower:ClearAllPoints()
-- target.textRelPower:SetPoint("RIGHT", target.PowerBar, "LEFT", -2, 0)
-- target.textRelHealth:ClearAllPoints()
-- target.textRelHealth:SetPoint("RIGHT", target.LifeBar, "LEFT", -2, 0)
--
-- local targettarget = One("targettarget")
-- targettarget:ClearAllPoints()
-- targettarget:SetPoint("TOPLEFT", target, "BOTTOMLEFT", 0, -40)
--
-- local targettargettarget = One("targettargettarget")
-- targettargettarget:ClearAllPoints()
-- targettargettarget:SetPoint("TOPRIGHT", target, "BOTTOMRIGHT", 0, -40)
--
-- local player = Two("player")
-- player.menu = function(self, unit, button, actionType)
--   ToggleDropDownMenu(1, nil, PlayerFrameDropDown, self, 0, 0);
-- end
-- player.PowerBar:SetReverseFill(true)
-- player:ClearAllPoints()
-- player:SetPoint("RIGHT", UIParent, "CENTER", -150, -150)
--
-- local pet = One("pet")
-- pet.menu = function(self, unit, button, actionType)
--   ToggleDropDownMenu(1, nil, PetFrameDropDown, self, 0, 0);
-- end
-- pet:ClearAllPoints()
-- pet:SetPoint("TOPLEFT", player, "BOTTOMLEFT", 0, -40)
--
-- local pettarget = One("pettarget")
-- pettarget:ClearAllPoints()
-- pettarget:SetPoint("TOPRIGHT", player, "BOTTOMRIGHT", 0, -40)

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
PlayerPowerBarAlt:ClearAllPoints()
PlayerPowerBarAlt:SetParent("UIParent")
PlayerPowerBarAlt:SetPoint("TOP", UIParent, "TOP", 0, -30)
PlayerPowerBarAlt:SetScale(0.75)

PlayerPowerBarAlt:SetMovable(true)
-- PlayerPowerBarAlt:EnableMouse(true)
PlayerPowerBarAlt:SetUserPlaced(true)
-- PlayerPowerBarAlt:SetClampedToScreen(true)
-- PlayerPowerBarAlt:RegisterForDrag("LeftButton")
--
-- PlayerPowerBarAlt:SetScript("OnDragStart", function(self)
-- self:StartMoving()
-- end)
--
-- PlayerPowerBarAlt:SetScript("OnDragStop", function(self)
-- self:StopMovingOrSizing()
-- end)
--
-- TargetFramePowerBarAlt:ClearAllPoints()
-- TargetFramePowerBarAlt:SetParent("UIParent")
-- TargetFramePowerBarAlt:SetPoint("TOP", UIParent, "TOP", 0, -60)
-- TargetFramePowerBarAlt:SetScale(0.75)
