PlayerFrame:SetScript("OnEvent", nil);
PlayerFrame:Hide();
TargetFrame:SetScript("OnEvent", nil);
TargetFrame:Hide();

LindUF = {}

local EventHandler = CreateFrame ("Frame", "EventHandler")
EventHandler:RegisterEvent("UNIT_HEALTH_FREQUENT")
EventHandler:SetScript("OnEvent", function(self, event, unit, ...)
    if LindUF[unit] then
      LindUF[unit].LB:Update()
    end
  end)

local font = "Fonts\\ARIALN.TTF"

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
--------------------------------------------------------------------------------

local function MakeLind(aUnit)
  thisLind = CreateFrame("Button", "lind"..aUnit, UIParent, "SecureUnitButtonTemplate")
  thisLind:SetWidth(200)
  thisLind:SetHeight(40)
  thisLind:SetAlpha(1.0)
  thisLind:SetPoint("CENTER", 0, 0)
  thisLind:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  thisLind:SetAttribute('type1', 'target')
  thisLind:SetAttribute('type2', 'menu')
  thisLind:SetAttribute('unit', aUnit)

  thisLind.menu = function(self, unit, button, actionType)
    ToggleDropDownMenu(1, nil, PlayerFrameDropDown, self, 0, 0)
  end
  RegisterUnitWatch(thisLind)
  thisLind.unit = aUnit

  thisLind.name = ""
  thisLind.noEventUpdate = false

  thisLind.Absorb = CreateFrame("StatusBar", "lind"..aUnit.."absorb", thisLind)
  thisLind.Predict = CreateFrame("StatusBar", "lind"..aUnit.."predict", thisLind)
  thisLind.LB = CreateFrame("StatusBar", "lind"..aUnit.."health", thisLind)
  thisLind.EB = CreateFrame("StatusBar", "lind"..aUnit.."power", thisLind)

  thisLind.LB:SetBackdrop( {
      bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
      edgeFile = nil,
      tile = false, tileSize = 0, edgeSize = 0,
      insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
  thisLind.LB:SetBackdropColor(0,0,0,0.4);
  thisLind.LB:SetReverseFill(true)

  thisLind.EB:SetBackdrop( {
      bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
      edgeFile = nil,
      tile = false, tileSize = 0, edgeSize = 0,
      insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
  thisLind.EB:SetBackdropColor(1,1,1,0.4);
  thisLind.LB.Leben = thisLind.LB:CreateFontString(nil, "OVERLAY")
  thisLind.LB.Leben:SetFont(font, 14, "OUTLINE")
  thisLind.LB.Leben:SetTextColor(1, 1, 1)
  thisLind.LB.Leben:SetPoint("RIGHT")
  thisLind.LB.Name = thisLind.LB:CreateFontString(nil, "OVERLAY")
  thisLind.LB.Name:SetFont(font, 14, "OUTLINE")
  thisLind.LB.Name:SetText(UnitName(aUnit))
  thisLind.LB.Name:SetTextColor(1, 1, 1)
  thisLind.LB.Name:SetPoint("LEFT")
  thisLind.Update = function(self)
    self.LB:Update()
    if self.EB then self.EB:Update() end
    self.Absorb:Update()
    self.LB.Name:SetText(UnitName(self.unit))
    local class, classFileName = UnitClass(self.unit)
    local color = {}
    if classFileName then
      color = RAID_CLASS_COLORS[classFileName]
    else
      color = {r = 1, g = 1, b = 1}
    end
    self.LB.Name:SetTextColor(color.r, color.g, color.b)
  end

  thisLind:SetScript("OnEnter", function(self, event, ...)
      GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
      GameTooltip:SetUnit(self.unit)
      GameTooltip:Show()
    end)
  thisLind:SetScript("OnLeave", function(self, event, ...)
      GameTooltip:Hide()
    end)

  thisLind.PvpTimer = thisLind.LB:CreateFontString(nil, "OVERLAY")
  thisLind.PvpTimer:SetFont(font, 14, "OUTLINE")
  thisLind.PvpTimer:SetText(UnitName(aUnit))
  thisLind.PvpTimer:SetTextColor(1, 1, 1)
  thisLind.PvpTimer:SetPoint("LEFT", 0, 30)

  thisLind:SetScript("OnUpdate", function(self, event, ...)
      if self.unit == "player" then

        if UnitIsPVP("player") then
          local sec = math.floor(GetPVPTimer()/1000)
          if sec == 301 then
            self.PvpTimer:SetText("pvp")
          else
            self.PvpTimer:SetText(math.floor(sec/60)..":"..math.floor(sec%60))
          end
        else
          self.PvpTimer:SetText(nil)
        end
      end
      if self.noEventUpdate then
        self.LB:Update()
      end
      local name = select(1,UnitName(self.unit))

      if name ~= self.name then
        if name then self:Update() end
        self.name = name
      end
    end)
  thisLind.init = function(self)
    self.LB:SetWidth(self:GetWidth())
    self.LB:SetHeight(self:GetHeight()/4*3)
    self.LB:SetMinMaxValues(0, 100)
    self.LB:SetValue(100)

    self.LB:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
    self.LB:SetStatusBarColor(1.0, 0.2, 0.2, 0.8)
    self.LB:SetPoint("TOP", self, 0, 0)

    self.Absorb:SetWidth(self:GetWidth())
    self.Absorb:SetHeight(self:GetHeight()/4*3)
    self.Absorb:SetMinMaxValues(0, 100)
    self.Absorb:SetValue(0)

    self.Absorb:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
    self.Absorb:SetStatusBarColor(0.7, 0.2, 1, 1)
    self.Absorb:SetPoint("TOP", self, 0, 0)
    self.Absorb.Update = function(self)
      local totalAbsorbs = UnitGetTotalAbsorbs(self.unit)
      local maxHealth = UnitHealthMax(self.unit)
      local percent = 100*totalAbsorbs/maxHealth
      if percent > 100 then
        percent = 100
      end
      self:SetValue(percent)
    end

    self.Absorb:RegisterEvent("UNIT_ABSORB_AMOUNT_CHANGED")
    self.Absorb.unit = self.unit
    self.Absorb:SetScript("OnEvent", function(self, event, ...)
        self:Update()
      end)

    self.Predict:SetWidth(self:GetWidth())
    self.Predict:SetHeight(self:GetHeight()/4*3)
    self.Predict:SetMinMaxValues(0, 100)
    self.Predict:SetValue(0)

    self.Predict:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
    self.Predict:SetStatusBarColor(0.1, 1.0, 0.1, 1.0)
    self.Predict:SetPoint("TOP", self, 0, 0)

    self.Predict.unit = self.unit
    self.Predict.parent = self
    self.Predict:SetScript("OnUpdate", function(self, event, ...)
        local heal = UnitGetIncomingHeals(self.unit);
        local health = UnitHealth(self.unit)
        local maxHealth = UnitHealthMax(self.unit)
        local percent = 0
        if(heal) then
          percent = 100*health/maxHealth
          self:SetPoint("TOP",self.parent, percent*self:GetWidth()/100, 0)
          percent = 100*heal/maxHealth
          if percent > 100 then
            percent = 100
          end
        end
        self:SetValue(percent)
      end)

    self.LB.unit = self.unit
    self.LB.Update = function(self)
      local totalAbsorbs = UnitGetTotalAbsorbs("unit")
      local health = UnitHealth(self.unit)
      local maxHealth = UnitHealthMax(self.unit)
      local percent = 100*health/maxHealth
      if self.Leben then
        if health > 9999999 then
          self.Leben:SetText(string.format("%.0f M", (health / 1000000)))
        elseif health > 9999 then
          self.Leben:SetText(string.format("%.0f K", (health / 1000)))
        else
          self.Leben:SetText(health)
        end
      end
      self:SetValue(100-percent)
    end
    self.LB:SetScript("OnEvent", function(self, event, ...)
        self:Update()
      end)

    if self.EB then
      self.EB:SetWidth(self:GetWidth())
      self.EB:SetHeight(self:GetHeight()/4)
      self.EB:SetMinMaxValues(0, 100)
      self.EB:SetValue(100)
      self.EB:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
      self.EB:SetPoint("BOTTOM", self, 0, 0)
      self.EB:RegisterEvent("UNIT_POWER_FREQUENT")
      self.EB.unit = self.unit
      self.EB.Update = function(self)
        local r, g, b = LindUF.PowerColor(self.unit)
        self:SetStatusBarColor(r, g, b, 0.8)
        self:SetBackdropColor(r, g, b, 0.2)
        local health = UnitPower(self.unit)
        local maxHealth = UnitPowerMax(self.unit)
        local percent = 100*health/maxHealth
        self:SetValue(percent)

      end
      self.EB:SetScript("OnEvent", function(self, event, ...)
          self:Update()
        end)
    end
  end
  return thisLind
end

LindUF.player = MakeLind("player")
LindUF.player:SetPoint("CENTER", -350, -200)
LindUF.player:SetWidth(300)
LindUF.player:init()

LindUF.target = MakeLind("target")
LindUF.target:SetPoint("CENTER", 350, -200)
LindUF.target:SetWidth(300)

LindUF.target.menu = function(self, unit, button, actionType)
  ToggleDropDownMenu(1, nil, TargetFrameDropDown, LindUF.target, 0, 0)
end
LindUF.target:init()

LindUF.targettarget = MakeLind("targettarget")
LindUF.targettarget:SetPoint("CENTER", 270, -120)
LindUF.targettarget:SetWidth(140)
LindUF.targettarget.noEventUpdate = true
LindUF.targettarget:init()

LindUF.pet = MakeLind("pet")
LindUF.pet:SetPoint("CENTER", -430, -120)
LindUF.pet:SetWidth(140)
LindUF.pet:init()

LindUF.pettarget = MakeLind("pettarget")
LindUF.pettarget:SetPoint("CENTER", -270, -120)
LindUF.pettarget:SetWidth(140)
LindUF.pettarget.noEventUpdate = true
LindUF.pettarget:init()

LindUF.targettargettarget = MakeLind("targettargettarget")
LindUF.targettargettarget:SetPoint("CENTER", 430, -120)
LindUF.targettargettarget:SetWidth(140)
LindUF.targettargettarget.noEventUpdate = true
LindUF.targettargettarget:init()

-- local y = -300
-- local x = -450
-- for i = 1, 40, 1 do
-- LindUF["raid"..i] = MakeLind("raid"..i)
-- LindUF["raid"..i]:SetWidth(50)
-- LindUF["raid"..i]:SetHeight(20)
-- LindUF["raid"..i].LB.Name:SetFont(font, 8, "OUTLINE")
-- LindUF["raid"..i].LB.Leben = nil
-- LindUF["raid"..i].EB = nil
--
-- if i % 5 == 0 then
-- y = y - 20
-- x = x - 250
-- end
-- LindUF["raid"..i]:SetPoint("Center", x + i * 50, y)
--
-- LindUF["raid"..i]:init()
-- end

local y = -300
local x = -464
for i = 1, 4, 1 do
  LindUF["party"..i] = MakeLind("party"..i)
  LindUF["party"..i]:SetWidth(72)
  LindUF["party"..i]:SetHeight(40)
  LindUF["party"..i].LB.Leben = nil
  LindUF["party"..i].EB = nil

  LindUF["party"..i]:SetPoint("Center", x, y)
  x = x + 76
  LindUF["party"..i].LB:SetHeight(LindUF["party"..i]:GetHeight())

  LindUF["party"..i]:init()
end

local y = 100
local x = -100
for i = 1, 5, 1 do
  LindUF["boss"..i] = MakeLind("boss"..i)
  LindUF["boss"..i]:SetWidth(70)
  LindUF["boss"..i]:SetHeight(40)

  LindUF["boss"..i].LB.Name:SetFont(font, 8, "OUTLINE")

  if i % 5 == 0 then
    y = y - 20
  end
  LindUF["boss"..i]:SetPoint("RIGHT", x, y - i * 25)
  LindUF["boss"..i].LB.Leben = nil
  LindUF["boss"..i]:init()

end
