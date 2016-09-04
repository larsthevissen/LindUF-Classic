PlayerFrame:SetScript("OnEvent", nil);
PlayerFrame:Hide();
TargetFrame:SetScript("OnEvent", nil);
TargetFrame:Hide();

local font = "Fonts\\ARIALN.TTF"

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
      local name = UnitName(self.parent.unit)
      if name and name ~= self.parent.Name:GetText() then
        if(strlen(name) < 10) then
          self.parent.Name:SetText(name)
        else
          local string = ""
          for x in string.gmatch(name, "[^%s]+") do
            string = string..strsub(x, 1, 3)..". "
          end
          self.parent.Name:SetText(string)
        end
      end
      local health = UnitHealth(self.parent.unit)
      local healthMax = UnitHealthMax(self.parent.unit)
      local percent = 100 * health / healthMax
      self:SetMinMaxValues(0, healthMax)
      self:SetValue(healthMax - health)
    end)
  return f
end

local One = function(aUnit)
  f = Zero(aUnit)
  f:SetWidth(150)
  f.LifeBar:SetWidth(150)

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
  f.PowerBar:SetWidth(150)
  f.PowerBar:SetPoint("TOP", 0, -30)

  f.PowerBar:SetScript("OnUpdate", function(self, ...)
      local r, g, b = LindUF.PowerColor(self.parent.unit)
      self:SetStatusBarColor(r, g, b, 1)
      local power = UnitPower(self.parent.unit)
      local powerMax = UnitPowerMax(self.parent.unit)
      local percent = 100 * power / powerMax
      self.parent.relPower = math.floor(percent)
      self.parent.power = power
      self:SetMinMaxValues(0, powerMax)
      self:SetValue(power)
    end)

  return f;
end

local Two = function(aUnit)
  f = One(aUnit)
  f:SetWidth(300)
  f.LifeBar:SetWidth(300)
  f.PowerBar:SetWidth(300)
  f.textPower = f.PowerBar:CreateFontString(nil, "OVERLAY")
  f.textPower:SetFont(font, 12, "OUTLINE")
  f.textPower:SetTextColor(1, 1, 1)
  f.textPower:SetPoint("Left", f.PowerBar, "RIGHT", 2, 0)

  f:SetScript("OnUpdate", function(self, ...)
    self.textPower:SetText(self.power)
  end)
  return f;
end

local target = Two("target")
target.LifeBar:SetReverseFill(true)
target:ClearAllPoints()
target:SetPoint("LEFT", UIParent, "CENTER", 100, -100)
target.textPower:ClearAllPoints()
target.textPower:SetPoint("RIGHT", target.PowerBar, "LEFT", -2, 0)

local player = Two("player")
player.PowerBar:SetReverseFill(true)
player:ClearAllPoints()
player:SetPoint("RIGHT", UIParent, "CENTER", -100, -100)

local EventHandler = CreateFrame ("Frame", "EventHandler")
EventHandler:RegisterEvent("UNIT_HEALTH_FREQUENT")
EventHandler:SetScript("OnEvent", function(self, event, unit, ...)
    if LindUF[unit] then
      LindUF[unit].LB:Update()
    end
  end)

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
