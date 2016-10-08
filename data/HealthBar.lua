LindUF.HealthBar = function(self, p)

  if not p then return end
  if p.HealthBar then return end

  local f = CreateFrame("Frame", "lind."..p.unit..".HealthBar", p)

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

  f.Absorb = CreateFrame("StatusBar", "lind."..p.unit..".Absorb", f)
  f.Absorb:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.Absorb:SetStatusBarColor(.7, 0, .7, .5)
  f.Absorb:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Absorb:SetWidth(f:GetWidth()-4)
  f.Absorb:SetHeight(f:GetHeight()-4)

  f.Predict = CreateFrame("StatusBar", "lind."..p.unit..".Predict", f)
  f.Predict:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.Predict:SetStatusBarColor(0, 1, 0, .5)
  f.Predict:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Predict:SetWidth(f:GetWidth()-4)
  f.Predict:SetHeight(f:GetHeight()-4)

  f.Health = CreateFrame("StatusBar", "lind."..p.unit..".Health", f)
  f.Health:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  local r, g, b = LindUF.ClassColor(f.unit)
  f.Health:SetStatusBarColor(r, g, b, 1)
  f.Health:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Health:SetWidth(f:GetWidth()-4)
  f.Health:SetHeight(f:GetHeight()-4)
  f.Health:SetReverseFill(true)

SetMapToCurrentZone()
  f:SetScript("OnUpdate", function(self, ...)

    local health = UnitHealth(self.unit)
    local healthMax = UnitHealthMax(self.unit)
    local predict = UnitGetIncomingHeals(self.unit)
    local absorb = UnitGetTotalAbsorbs(self.unit)

    local r, g, b = LindUF.ClassColor(f.unit)
    self.Health:SetStatusBarColor(r, g, b, 1)

    self.Predict:ClearAllPoints()
    self.Predict:SetPoint("LEFT", self.Health, "LEFT", self.Health:GetWidth()/healthMax*health, 0)
    self.Predict:SetMinMaxValues(0, healthMax)
    self.Predict:SetValue(predict or 0)

    self.Absorb:SetMinMaxValues(0, healthMax)
    self.Absorb:SetValue(absorb)

    self.Health:SetMinMaxValues(0, healthMax)
    self.Health:SetValue(healthMax-health)
  end)

  p.HealthBar = f
end
