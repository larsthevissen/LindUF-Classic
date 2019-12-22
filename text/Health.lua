function LindUF:HealthText(p)
  if not p then return end
  if p.HealthText then return end

  local f = CreateFrame("Frame", "lind."..p.unit..".HealthText", p)
  f:SetWidth(1)
  f:SetHeight(1)

  f.Text = f:CreateFontString(nil, "OVERLAY")
  f.Text:SetPoint("RIGHT", 0, 0)
  f.Text:SetFont(LindUF.font, 14, "OUTLINE")
  f.Text:SetTextColor(1, 1, 1)
  f:SetFrameStrata("BACKGROUND")
  f:SetFrameLevel(3)
  f.unit = p.unit
  f.update = 0
  f:SetScript("OnUpdate", function(self, elapsed)
    local health = UnitHealth(self.unit)
    local healthMax = UnitHealthMax(self.unit)
    local percent = 100*health/healthMax
    local output = string.format("%.0f", percent)

    self.Text:SetText(output)
  end)
  p.HealthText = f
end

function LindUF:PowerText(p)
  if not p then return end
  if p.PowerText then return end

  local f = CreateFrame("Frame", "lind."..p.unit..".PowerText", p)
  f:SetWidth(1)
  f:SetHeight(1)

  f.Text = f:CreateFontString(nil, "OVERLAY")
  f.Text:SetPoint("RIGHT", 0, 0)
  f.Text:SetFont(LindUF.font, 10, "OUTLINE")
  f.Text:SetTextColor(1, 1, 1)
  f:SetFrameStrata("BACKGROUND")
  f:SetFrameLevel(3)
  f.unit = p.unit
  f.update = 0
  f:SetScript("OnUpdate", function(self, elapsed)
    local power = UnitPower(p.unit)
    local powerMax = UnitPowerMax(p.unit)
    local output = ""
    if powerMax > 0 then 
      local percent = 100*power/powerMax
      output = string.format("%.0f", percent)
    end
    self.Text:SetText(output)
  end)
  p.PowerText = f
end
