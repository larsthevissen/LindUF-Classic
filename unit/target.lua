-- target.lua START --

LindUF.Target = LindUF:UnitFrame("target")
LindUF.Target:ClearAllPoints()
LindUF.Target:SetWidth(150)
LindUF.Target:SetHeight(30)
LindUF.Target:SetPoint("LEFT", UIParent, "CENTER", 100, -120)
LindUF:power(LindUF.Target)
local f = LindUF.Target.PowerBar
f.bar.tx:SetColorTexture(1,0,0,.5)
f.bg:ClearAllPoints()
f.bg:SetWidth(150)
f.bg:SetHeight(10)
f.bg:SetPoint("LEFT", UIParent, "CENTER", 94, -136)
f.bar.tx:SetVertexOffset(3, 5, 0)
f.bar:RegisterEvent("UNIT_TARGET")
f.bgtx:SetVertexOffset(3, 5, 0)
f.bar.tx:SetVertexOffset(1, 5, 0)
f.bgtx:SetVertexOffset(1, 5, 0)
f = nil
LindUF:health(LindUF.Target)
local shi = LindUF.Target.HealthBar
shi.bar.tx:SetColorTexture(1,0,0,.7)
shi.bar:SetReverseFill(true)
shi.bar:RegisterEvent("UNIT_TARGET")
shi.bg:ClearAllPoints()
shi.bg:SetWidth(150)
shi.bg:SetHeight(20)
shi.bg:SetPoint("LEFT", UIParent, "CENTER", 100, -120)
shi.bar.tx:SetVertexOffset(3, 10, 0)
shi.bgtx:SetVertexOffset(3, 10, 0)
shi.bar.tx:SetVertexOffset(1, 10, 0)
shi.bgtx:SetVertexOffset(1, 10, 0)

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

-- LindUF:CastBar(target)
-- target.CastBar:ClearAllPoints()
-- target.CastBar:SetHeight(8)
-- target.CastBar:SetPoint("TOP", target.PowerBar, "BOTTOM", 0, -3)

-- LindUF:Name(target)
-- target.Name:ClearAllPoints()
-- target.Name:SetPoint("LEFT", target.HealthBar, "LEFT", 2, 0)

-- LindUF:HealthText(target)
-- target.HealthText:ClearAllPoints()
-- target.HealthText:SetPoint("RIGHT", target.HealthBar, "RIGHT", 2, 0)

TargetFrame:SetScript("OnEvent", nil);
TargetFrame:Hide();
-- target.lua END --
