LindUF.PowerBar = function(self, p)
  if not p then return end
  if p.PowerBar then return end

  local f = CreateFrame("Frame", "lind."..p.unit..".PowerBar", p)

  f:SetBackdrop( {
      bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
      edgeFile = "Interface\\AddOns\\LindUF\\LindBorder.tga",
      tile = false, tileSize = 0, edgeSize = 8,
      insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
  f:SetBackdropColor(.2, .2, .2, .8);
  f:SetBackdropBorderColor(1, 1, 1, .8)

  f.unit = p.unit

  f:SetWidth(p:GetWidth())
  f:SetHeight(p:GetHeight())
  f:SetAllPoints(p)

  f.Power = CreateFrame("StatusBar", "lind."..p.unit..".Power", f)
  f.Power:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.Power:SetStatusBarColor(1, 1, 0, 1)
  f.Power:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Power:SetWidth(f:GetWidth()-4)
  f.Power:SetHeight(f:GetHeight()-4)

  f:SetScript("OnUpdate", function(self, ...)
    local power = UnitPower(self.unit)
    local powerMax = UnitPowerMax(self.unit)
    local r, g, b = LindUF.PowerColor(self.unit)
    if powerMax > 0 then
      self.Power:SetAlpha(1)
      self:SetAlpha(1)
      self.Power:SetStatusBarColor(r, g, b, 1)
      self.Power:SetMinMaxValues(0, powerMax)
      self.Power:SetValue(power)
    else
      self.Power:SetAlpha(0)
      self:SetAlpha(0)
    end
  end)

  p.PowerBar = f
end

-- CastBar.lua START --
LindUF.CastBar = function(self, p)
  if not p then return end
  if p.CastBar then return end
  local f = CreateFrame("StatusBar", "lind."..p.unit..".CastBar", p)

  f.unit = p.unit

  f:SetWidth(p:GetWidth())
  f:SetHeight(p:GetHeight())
  f:SetAllPoints(p)
  f:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f:SetStatusBarColor(1, .7, .3, 1)

  f:SetScript("OnUpdate", function(self, ...)
    local name, _, _, _, startTime, endTime, _, _, interupt = UnitCastingInfo(self.unit)
    if(name) then
      if(interupt) then self:SetStatusBarColor(1, 0, 0, 1)
      else self:SetStatusBarColor(1, .7, .3, 1) end
      local start = startTime/1000
      local finish = endTime/1000
      self:SetMinMaxValues(start, finish)
      self:SetValue(GetTime())
    else
      self:SetMinMaxValues(0, 1)
      self:SetValue(0)
    end
  end)
  p.CastBar = f
end
-- CastBar.lua END --
