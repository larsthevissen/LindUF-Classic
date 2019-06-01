-- target.lua START --

LindUF.Target = LindUF:UnitFrame("target")
LindUF.Target:ClearAllPoints()
LindUF.Target:SetWidth(300)
LindUF.Target:SetHeight(15)
LindUF.Target:SetPoint("LEFT", UIParent, "CENTER", 100, -100)

LindUF:health(LindUF.Target)
local shi = LindUF.Target.HealthBar
shi.Texture:SetColorTexture(1,0,0,.7)
shi:SetReverseFill(true)
shi:RegisterEvent("UNIT_TARGET")
shi:ClearAllPoints()
shi:SetWidth(300)
shi:SetHeight(15)
shi:SetPoint("LEFT", UIParent, "CENTER", 100, -100)
-- shi.Texture:SetVertexOffset(3, 10, 0)
-- shi.BackgroundTexture:SetVertexOffset(3, 10, 0)
-- shi.Texture:SetVertexOffset(1, 10, 0)
-- shi.BackgroundTexture:SetVertexOffset(1, 10, 0)

LindUF:power(LindUF.Target)
local f = LindUF.Target.PowerBar
f.Texture:SetColorTexture(1,0,0,.5)
f:RegisterEvent("UNIT_TARGET")
f:ClearAllPoints()
f:SetWidth(300)
f:SetHeight(5)
f:SetPoint("TOP", shi, "BOTTOM", 0, -1)
-- f.Texture:SetVertexOffset(3, 5, 0)
-- f.BackgroundTexture:SetVertexOffset(3, 5, 0)
-- f.Texture:SetVertexOffset(1, 5, 0)
-- f.BackgroundTexture:SetVertexOffset(1, 5, 0)



-- local target = LindUF:UnitFrame("target")
-- target:SetWidth(300)
-- target:SetHeight(20)
-- target:ClearAllPoints()
-- target:SetPoint("LEFT", UIParent, "CENTER", 150, -50)

-- LindUF:HealthBar(target)
-- LindUF:PowerBar(target)

-- target.PowerBar:ClearAllPoints()
-- target.PowerBar:SetPoint("TOP", target.HealthBar, "BOTTOM", 0, -3)
-- target.PowerBar.Power:SetHeight(6)
-- target.PowerBar:SetHeight(10)

LindUF:CastBar(LindUF.Target)
LindUF.Target.CastBar:ClearAllPoints()
LindUF.Target.CastBar:SetHeight(8)
LindUF.Target.CastBar:SetWidth(200)
LindUF.Target.CastBar:SetPoint("LEFT", UIParent, "BOTTOM", 100, 250)

LindUF:Name(LindUF.Target)
LindUF.Target.Name:ClearAllPoints()
LindUF.Target.Name:SetPoint("BOTTOMLEFT", LindUF.Target, "TOPLEFT", 0, 2)
LindUF.Target.Name.Text:ClearAllPoints()
LindUF.Target.Name.Text:SetPoint("LEFT", 0, 0)

LindUF:HealthText(LindUF.Target)
LindUF.Target.HealthText:ClearAllPoints()
LindUF.Target.HealthText:SetPoint("LEFT", LindUF.Target.HealthBar, "RIGHT", 2, 0)

-- local lol = CreateFrame("Frame", "target30", shi)
-- lol:SetWidth(1)
-- lol:SetHeight(32)
-- lol:SetPoint("BOTTOM", shi, "BOTTOMLEFT", shi:GetWidth()/3, 0)
-- lol:SetFrameStrata("BACKGROUND")
-- lol:SetFrameLevel(5)
-- lol.tx = LindUF:Texture(lol)
-- lol.tx:SetColorTexture(1,1,1,.5)
--
-- local sixty = CreateFrame("Frame", "target30", shi)
-- sixty:SetWidth(1)
-- sixty:SetHeight(32)
-- sixty:SetPoint("BOTTOM", shi, "BOTTOMLEFT", shi:GetWidth()*2/3, 0)
-- sixty:SetFrameStrata("BACKGROUND")
-- sixty:SetFrameLevel(5)
-- sixty.tx = LindUF:Texture(sixty)
-- sixty.tx:SetColorTexture(1,1,1,.5)



TargetFrame:SetScript("OnEvent", nil);
TargetFrame:Hide();
-- target.lua END --
