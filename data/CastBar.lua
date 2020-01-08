-- CastBar.lua START --

-- CastingBarFrame:UnregisterAllEvents()

-- LindUF.CastBar = function(self, p)
function LindUF:CastBar(p)
  if not p then return end
  if p.CastBar then return end
  local f = CreateFrame("StatusBar", "lind."..p.unit..".CastBar", p)

  f.unit = p.unit

  f:SetWidth(p:GetWidth())
  f:SetHeight(p:GetHeight())
  f:SetAllPoints(p)
  f:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f:SetStatusBarColor(1, .7, .3, 1)

  f.text = f:CreateFontString(nil, "OVERLAY")
  f.text:SetPoint("RIGHT", 0, 0)
  f.text:SetFont(LindUF.font, 12, "OUTLINE")
  f.text:SetTextColor(1, 1, 1)

  f:SetScript("OnUpdate", function(self, ...)
    local name, _, _, startTime, endTime, _, _, interrupt = UnitCastingInfo(self.unit)
    if(name) then
      local start = 0
      local finish = endTime - startTime
      self:SetMinMaxValues(start, finish)
      self:SetValue(endTime-GetTime()*1000)
      self.text:SetText(name)
      return
    end

    name, _, _, startTime, endTime, _, interrupt = UnitChannelInfo(self.unit)
    if(name) then
      local start = 0
      local finish = endTime - startTime
      self:SetMinMaxValues(start, finish)
      self:SetValue(endTime-GetTime()*1000)
      self.text:SetText(name)
      return
    end

    self:SetMinMaxValues(0, 1)
    self:SetValue(0)
    self.text:SetText("")

  end)
  p.CastBar = f
end
-- CastBar.lua END --
