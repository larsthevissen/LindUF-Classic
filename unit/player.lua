

local f = LindUF:UnitFrame("player")
f:ClearAllPoints()
f:SetWidth(150)
f:SetHeight(30)
f:SetPoint("RIGHT", UIParent, "CENTER", -100, -120)

LindUF:power(f)
f.PowerBar.Texture:SetColorTexture(1,0,0,.5)
f.PowerBar:ClearAllPoints()
f.PowerBar:SetWidth(150)
f.PowerBar:SetHeight(10)
f.PowerBar:SetPoint("RIGHT", UIParent, "CENTER", -94, -136)
f.PowerBar.Texture:SetVertexOffset(3, -5, 0)
f.PowerBar.BackgroundTexture:SetVertexOffset(3, -5, 0)
f.PowerBar.Texture:SetVertexOffset(1, -5, 0)
f.PowerBar.BackgroundTexture:SetVertexOffset(1, -5, 0)

LindUF:health(f)
f.HealthBar.Texture:SetColorTexture(1,0,0,.7)
f.HealthBar:SetReverseFill(true)
f.HealthBar:ClearAllPoints()
f.HealthBar:SetWidth(150)
f.HealthBar:SetHeight(20)
f.HealthBar:SetPoint("RIGHT", UIParent, "CENTER", -100, -120)
f.HealthBar.Texture:SetVertexOffset(3, -10, 0)
f.HealthBar.BackgroundTexture:SetVertexOffset(3, -10, 0)
f.HealthBar.Texture:SetVertexOffset(1, -10, 0)
f.HealthBar.BackgroundTexture:SetVertexOffset(1, -10, 0)

LindUF.Player = f


-- LindUF.Player = LindUF:UnitFrame("player")
-- LindUF.Player:SetWidth(300)
-- LindUF.Player:SetHeight(20)
-- LindUF.Player:ClearAllPoints()
-- LindUF.Player:SetPoint("RIGHT", UIParent, "CENTER", -150, -50)

-- LindUF:HealthBar(LindUF.Player)
-- LindUF:PowerBar(LindUF.Player)

-- --LindUF.Player.HealthBar:SetVertexOffset(2,0,3)

-- LindUF.Player.PowerBar:SetHeight(10)
-- LindUF.Player.PowerBar:ClearAllPoints()
-- LindUF.Player.PowerBar:SetPoint("TOP", LindUF.Player.HealthBar, "BOTTOM", 0, -3)
-- LindUF.Player.PowerBar.Power:SetHeight(6)

LindUF:CastBar(LindUF.Player)
LindUF.Player.CastBar:ClearAllPoints()
LindUF.Player.CastBar:SetHeight(8)
LindUF.Player.CastBar:SetPoint("TOP", LindUF.Player, "BOTTOM", 0, -20)

-- LindUF:HealthText(LindUF.Player)
-- LindUF.Player.HealthText:ClearAllPoints()
-- LindUF.Player.HealthText:SetPoint("RIGHT", LindUF.Player.HealthBar, "RIGHT", 2, 0)




PlayerFrame:SetScript("OnEvent", nil);
PlayerFrame:Hide();