

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
    if powerMax > 0 then
      self:SetAlpha(.8)
      self.Background:SetAlpha(.8)
      self:SetMinMaxValues(0, powerMax)
      self:SetValue(power)
    else
      self:SetAlpha(0)
      self.Background:SetAlpha(0)
    end
  end)
  p.PowerBar = f
end




