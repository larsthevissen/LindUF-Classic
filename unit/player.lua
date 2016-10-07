local player = LindUF:UnitFrame("player")
player:SetWidth(300)
player:SetHeight(20)
player:ClearAllPoints()
player:SetPoint("RIGHT", UIParent, "CENTER", -100, 0)

LindUF:HealthBar(player)
LindUF:PowerBar(player)

player.PowerBar:SetHeight(10)
player.PowerBar:ClearAllPoints()
player.PowerBar:SetPoint("TOP", player.HealthBar, "BOTTOM", 0, -3)
player.PowerBar.Power:SetHeight(6)



-- target.lua START --
local target = LindUF:UnitFrame("target")
target:SetWidth(300)
target:SetHeight(20)
target:ClearAllPoints()
target:SetPoint("LEFT", UIParent, "CENTER", 100, 0)

LindUF:HealthBar(target)
LindUF:PowerBar(target)

target.PowerBar:ClearAllPoints()
target.PowerBar:SetPoint("TOP", target.HealthBar, "BOTTOM", 0, -3)
target.PowerBar.Power:SetHeight(6)
target.PowerBar:SetHeight(10)
-- target.lua END --

-- raid.lua START --


-- raid.lua END --
