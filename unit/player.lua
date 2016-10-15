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


-- targettarget.lua START --
local targettarget = LindUF:UnitFrame("targettarget")
targettarget:SetWidth(150)
targettarget:SetHeight(20)
targettarget:ClearAllPoints()
targettarget:SetPoint("BOTTOMLEFT", target, "TOPLEFT", 0, 10)

LindUF:HealthBar(targettarget)
-- targettarget.lua END --
