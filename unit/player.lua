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
