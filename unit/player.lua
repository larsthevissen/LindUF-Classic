PlayerFrame:SetScript("OnEvent", nil);
PlayerFrame:Hide();


LindUF.Player = LindUF:UnitFrame("player")
LindUF.Player:SetWidth(300)
LindUF.Player:SetHeight(20)
LindUF.Player:ClearAllPoints()
LindUF.Player:SetPoint("RIGHT", UIParent, "CENTER", -200, -100)

LindUF:HealthBar(LindUF.Player)
LindUF:PowerBar(LindUF.Player)

LindUF.Player.PowerBar:SetHeight(10)
LindUF.Player.PowerBar:ClearAllPoints()
LindUF.Player.PowerBar:SetPoint("TOP", LindUF.Player.HealthBar, "BOTTOM", 0, -3)
LindUF.Player.PowerBar.Power:SetHeight(6)

LindUF:CastBar(LindUF.Player)
LindUF.Player.CastBar:ClearAllPoints()
LindUF.Player.CastBar:SetHeight(8)
LindUF.Player.CastBar:SetPoint("TOP", LindUF.Player.PowerBar, "BOTTOM", 0, -3)


-- pet.lua START --
LindUF.Pet = LindUF:UnitFrame("pet")
LindUF.Pet:SetWidth(150)
LindUF.Pet:SetHeight(20)
LindUF.Pet:ClearAllPoints()
LindUF.Pet:SetPoint("BOTTOMLEFT", LindUF.Player, "TOPLEFT", 0, 10)

LindUF:HealthBar(LindUF.Pet)

LindUF:Name(LindUF.Pet)
LindUF.Pet.Name:ClearAllPoints()
LindUF.Pet.Name:SetPoint("LEFT", LindUF.Pet.HealthBar, "LEFT", 2, 0)


-- pet.lua END --
