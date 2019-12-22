
  function LindUF:health(p)
    local f = LindUF:LindBar(p, "health")
    
    f.Texture:SetColorTexture(1, 0, 0, 1)
    f:RegisterEvent("UNIT_HEALTH_FREQUENT")
    f:RegisterEvent("VARIABLES_LOADED")
    f:RegisterEvent("PLAYER_ENTERING_WORLD")



    f:SetScript("OnEvent", function(self, event)
      local health = UnitHealth(p.unit)
      local healthMax = UnitHealthMax(p.unit)
      local r, g, b= LindUF.ClassColor(p.unit)
      self.Texture:SetColorTexture(r, g, b, 1)
      self:SetMinMaxValues(0, healthMax)
      self:SetValue(healthMax-health)
    end)
    p.HealthBar = f
  end
