

LindUF.Player = LindUF:UnitFrame("player")
LindUF.Player:ClearAllPoints()
LindUF.Player:SetWidth(150)
LindUF.Player:SetHeight(30)
LindUF.Player:SetPoint("RIGHT", UIParent, "CENTER", -100, -120)
LindUF:power(LindUF.Player)
local f = LindUF.Player.PowerBar
f.bar.tx:SetColorTexture(1,0,0,.5)
f.bg:ClearAllPoints()
f.bg:SetWidth(150)
f.bg:SetHeight(10)
f.bg:SetPoint("RIGHT", UIParent, "CENTER", -94, -136)
f.bar.tx:SetVertexOffset(3, -5, 0)
f.bgtx:SetVertexOffset(3, -5, 0)
f.bar.tx:SetVertexOffset(1, -5, 0)
f.bgtx:SetVertexOffset(1, -5, 0)
f = nil
LindUF:health(LindUF.Player)
local shi = LindUF.Player.HealthBar
shi.bar.tx:SetColorTexture(1,0,0,.7)
shi.bar:SetReverseFill(true)
shi.bg:ClearAllPoints()
shi.bg:SetWidth(150)
shi.bg:SetHeight(20)
shi.bg:SetPoint("RIGHT", UIParent, "CENTER", -100, -120)
shi.bar.tx:SetVertexOffset(3, -10, 0)
shi.bgtx:SetVertexOffset(3, -10, 0)
shi.bar.tx:SetVertexOffset(1, -10, 0)
shi.bgtx:SetVertexOffset(1, -10, 0)


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