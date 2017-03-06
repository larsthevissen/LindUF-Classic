-- CastBar.lua START --

CastingBarFrame:UnregisterAllEvents()

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

  f:SetScript("OnUpdate", function(self, ...)
    local name, _, _, _, startTime, endTime, _, _, interrupt = UnitCastingInfo(self.unit)
    if(name) then
      local start = 0
      local finish = endTime - startTime
      self:SetMinMaxValues(start, finish)
      self:SetValue(endTime-GetTime()*1000)
      return
    end

    name, _, _, _, startTime, endTime, _, interrupt = UnitChannelInfo(self.unit)
    if(name) then    
      local start = 0
      local finish = endTime - startTime
      self:SetMinMaxValues(start, finish)
      self:SetValue(endTime-GetTime()*1000)     
      return
    end

    self:SetMinMaxValues(0, 1)
    self:SetValue(0)

  end)
  p.CastBar = f
end
-- CastBar.lua END --
