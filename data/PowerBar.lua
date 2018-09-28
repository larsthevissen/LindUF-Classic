

function LindUF:power(p)
  local f = LindUF:LindBar(p, "power")
  f.Texture:SetColorTexture(1, 0, 0, 1)
  f:RegisterEvent("UNIT_POWER_FREQUENT")
  f:RegisterEvent("UNIT_DISPLAYPOWER")
  f:RegisterEvent("VARIABLES_LOADED")
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  -- f.bar:RegisterEvent("UNIT_TARGET")
  f:SetScript("OnEvent", function(self, event)
    local r, g, b = LindUF.PowerColor(p.unit)
    self.Texture:SetColorTexture(r, g, b, .8)
    local power = UnitPower(p.unit)
    local powerMax = UnitPowerMax(p.unit) 
    self:SetMinMaxValues(0, powerMax)
    self:SetValue(power)
  end)
  p.PowerBar = f
end

function LindUF:health(p)
  local f = LindUF:LindBar(p, "health")
  f.Texture:SetColorTexture(1, 0, 0, 1)
  f:RegisterEvent("UNIT_HEALTH_FREQUENT")
  f:RegisterEvent("VARIABLES_LOADED")
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  -- f.bar:RegisterEvent("UNIT_TARGET")
  f:SetScript("OnEvent", function(self, event)
    local health = UnitHealth(p.unit)
    local healthMax = UnitHealthMax(p.unit)
    self:SetMinMaxValues(0, healthMax)
    self:SetValue(healthMax-health)
  end)
  p.HealthBar = f
end

-- LindUF.elfi = LindUF:UnitFrame("player")
-- LindUF.elfi:ClearAllPoints()
-- LindUF.elfi:SetWidth(100)
-- LindUF.elfi:SetHeight(10)
-- LindUF.elfi:SetPoint("RIGHT", UIParent, "CENTER", -100, -150)
-- LindUF:power(LindUF.elfi)
-- local f = LindUF.elfi.PowerBar
-- f.bar.tx:SetColorTexture(1,0,0,.5)
-- f.bg:ClearAllPoints()
-- f.bg:SetWidth(100)
-- f.bg:SetHeight(10)
-- f.bg:SetPoint("RIGHT", UIParent, "CENTER", -100, -150)
-- f.bar.tx:SetVertexOffset(3, -5, 0)
-- f.bgtx:SetVertexOffset(3, -5, 0)
-- f = nil
-- LindUF:health(LindUF.elfi)
-- local shi = LindUF.elfi.HealthBar
-- shi.bar.tx:SetColorTexture(1,0,0,.5)
-- shi.bar:SetReverseFill(true)
-- shi.bg:ClearAllPoints()
-- shi.bg:SetWidth(150)
-- shi.bg:SetHeight(20)
-- shi.bg:SetPoint("RIGHT", UIParent, "CENTER", -100, -120)

-- LindUF.PowerBar = function(self, p)
function LindUF:PowerBar(p)
  if not p then return end
  if p.PowerBar then return end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
 

  -- function LindBar:SetHeight()
  -- end

  local f = CreateFrame("Frame", "lind."..p.unit..".PowerBar", p)

  -- f:SetBackdrop( {
  --     bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
  --     edgeFile = "Interface\\AddOns\\LindUF\\LindBorder.tga",
  --     tile = false, tileSize = 0, edgeSize = 8,
  --     insets = { left = 0, right = 0, top = 0, bottom = 0 }
  --   })
  -- f:SetBackdropColor(.2, .2, .2, .4);
  -- f:SetBackdropBorderColor(1, 1, 1, .8)
  local tx = f:CreateTexture()
  tx:SetAllPoints(f)
  -- tx:SetTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  tx:SetVertexOffset(1,5,0) 
  tx:SetVertexOffset(3,5,0)
  tx:SetColorTexture(.2,.2,.2,.8)
  f.texture = tx
  
  f.unit = p.unit
  f:SetFrameStrata("BACKGROUND")
  f:SetFrameLevel(0)

  f:SetWidth(p:GetWidth())
  f:SetHeight(p:GetHeight())
  f:SetAllPoints(p)

  f.Power = CreateFrame("StatusBar", "lind."..p.unit..".Power", f)
  -- f.Power:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")

  f.txPower = f.Power:CreateTexture()
  f.txPower:SetAllPoints(f.Power)
  -- f.txPower:SetTexture(1, 1, 0, 1)
  f.txPower:SetVertexOffset(1,5,0) 
  f.txPower:SetVertexOffset(3,5,0) 
  f.txPower:SetColorTexture(0,0,1,1)
  f.Power:SetStatusBarTexture(f.txPower)

  f.Power:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Power:SetWidth(f:GetWidth())
  f.Power:SetHeight(f:GetHeight())
  f.Power:SetFrameStrata("BACKGROUND")
  f.Power:SetFrameLevel(1)

  f.power = -1
  f.update = 0

  f:SetScript("OnUpdate", function(self, elapsed)
    self.update = self.update + elapsed
    if self.update < 0.1 then return else self.update = 0 end
    local power = UnitPower(self.unit)
    local powerMax = UnitPowerMax(self.unit)
    local r, g, b = LindUF.PowerColor(self.unit)
    if power ~= self.power then
      if powerMax > 0 then
        self.Power:SetAlpha(1)
        self:SetAlpha(1)
        self.txPower:SetColorTexture(r, g, b, 1)
        self.Power:SetMinMaxValues(0, powerMax)
        self.Power:SetValue(power)
      else
        self.Power:SetAlpha(0)
        self:SetAlpha(0)
      end
    end
  end)


  p.PowerBar = f
end
