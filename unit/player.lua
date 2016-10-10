local player = LindUF:UnitFrame("player")
player:SetWidth(300)
player:SetHeight(20)
player:ClearAllPoints()
player:SetPoint("RIGHT", UIParent, "CENTER", -200, -200)

LindUF:HealthBar(player)
LindUF:PowerBar(player)

player.PowerBar:SetHeight(10)
player.PowerBar:ClearAllPoints()
player.PowerBar:SetPoint("TOP", player.HealthBar, "BOTTOM", 0, -3)
player.PowerBar.Power:SetHeight(6)

LindUF:CastBar(player)
player.CastBar:ClearAllPoints()
player.CastBar:SetHeight(8)
player.CastBar:SetPoint("TOP", player.PowerBar, "BOTTOM", 0, -3)

-- target.lua START --
local target = LindUF:UnitFrame("target")
target:SetWidth(300)
target:SetHeight(20)
target:ClearAllPoints()
target:SetPoint("LEFT", UIParent, "CENTER", 200, -200)

LindUF:HealthBar(target)
LindUF:PowerBar(target)

target.PowerBar:ClearAllPoints()
target.PowerBar:SetPoint("TOP", target.HealthBar, "BOTTOM", 0, -3)
target.PowerBar.Power:SetHeight(6)
target.PowerBar:SetHeight(10)

LindUF:CastBar(target)
target.CastBar:ClearAllPoints()
target.CastBar:SetHeight(8)
target.CastBar:SetPoint("TOP", target.PowerBar, "BOTTOM", 0, -3)
-- target.lua END --

-- targettarget.lua START --
local targettarget = LindUF:UnitFrame("targettarget")
targettarget:SetWidth(150)
targettarget:SetHeight(20)
targettarget:ClearAllPoints()
targettarget:SetPoint("BOTTOMLEFT", target, "TOPLEFT", 0, 10)

LindUF:HealthBar(targettarget)
-- targettarget.lua END --

-- raid.lua START --
local raid = {}
for i = 1, 40 do
  raid[i] = LindUF:UnitFrame("raid"..i)
  raid[i]:SetWidth(100)
  raid[i]:SetHeight(20)
  raid[i]:ClearAllPoints()
  if (i < 21) then
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 10, 200-i*23)
  else
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 120, 200-(i-20)*23)
  end

  LindUF:HealthBar(raid[i])
end

-- raid.lua END --
