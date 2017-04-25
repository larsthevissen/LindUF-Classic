-- LindUF.HealthBar = function(self, p)
function LindUF:HealthBar(p)
  if not p then return end
  if p.HealthBar then return end

  local f = CreateFrame("Frame", "lind."..p.unit..".HealthBar", p)

  f:SetBackdrop( {
      bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
      edgeFile = "Interface\\AddOns\\LindUF\\LindBorder.tga",
      tile = false, tileSize = 0, edgeSize = 8,
      insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
  f:SetBackdropColor(.2, .2, .2, .4);
  f:SetBackdropBorderColor(1, 1, 1, .8)

  f.unit = p.unit

  f:SetWidth(p:GetWidth())
  f:SetHeight(p:GetHeight())
  f:SetAllPoints(p)
  f:SetFrameStrata("BACKGROUND")
  f:SetFrameLevel(0)

  f.Absorb = CreateFrame("StatusBar", "lind."..p.unit..".Absorb", f)
  f.Absorb:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.Absorb:SetStatusBarColor(.7, 0, .7, .5)
  f.Absorb:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Absorb:SetWidth(f:GetWidth()-4)
  f.Absorb:SetHeight(f:GetHeight()-4)
  f.Absorb:SetMinMaxValues(0, 1)
  f.Absorb:SetValue(0)
  f.Absorb:SetFrameStrata("BACKGROUND")
  f.Absorb:SetFrameLevel(2)

  f.Predict = CreateFrame("StatusBar", "lind."..p.unit..".Predict", f)
  f.Predict:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.Predict:SetStatusBarColor(0, 1, 0, .5)
  f.Predict:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Predict:SetWidth(f:GetWidth()-4)
  f.Predict:SetHeight(f:GetHeight()-4)
  f.Predict:SetMinMaxValues(0, 1)
  f.Predict:SetValue(0)
  f.Predict:SetFrameStrata("BACKGROUND")
  f.Predict:SetFrameLevel(1)

  f.Health = CreateFrame("StatusBar", "lind."..p.unit..".Health", f)
  f.Health:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.Health:SetStatusBarColor(.8, .8, .8, 1)
  f.Health:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Health:SetWidth(f:GetWidth()-4)
  f.Health:SetHeight(f:GetHeight()-4)
  f.Health:SetReverseFill(true)
  f.Health:SetFrameStrata("BACKGROUND")
  f.Health:SetFrameLevel(1)

  f.health = -1
  f.predict = -1
  f.absorb = -1
  f.update = 0

  f:SetScript("OnUpdate", function(self, elapsed)

      self.update = self.update + elapsed
      if self.update < 0.1 then return else self.update = 0 end

      local health = UnitHealth(self.unit)
      local healthMax = UnitHealthMax(self.unit)
      local predict = UnitGetIncomingHeals(self.unit)
      local absorb = UnitGetTotalAbsorbs(self.unit)

--      local r, g, b = LindUF.ClassColor(f.unit)
--      self.Health:SetStatusBarColor(r, g, b, 1)

      if self.health ~= health then
        local health = UnitHealth(self.unit)
        local healthMax = UnitHealthMax(self.unit)
        self.Health:SetMinMaxValues(0, healthMax)
        self.Health:SetValue(healthMax-health)
      end

      if predict ~= self.predict or (predict and self.health ~= health) then
        self.Predict:ClearAllPoints()
        self.Predict:SetPoint("LEFT", self.Health, "LEFT", self.Health:GetWidth()/healthMax*health, 0)
        self.Predict:SetMinMaxValues(0, healthMax)
        self.Predict:SetValue(predict or 0)
        self.predict = predict
      end

      if absorb ~= self.absorb then
        self.Absorb:SetMinMaxValues(0, healthMax)
        self.Absorb:SetValue(absorb)
        self.absorb = absorb
      end

      self.health = health
    end)

  p.HealthBar = f
end
