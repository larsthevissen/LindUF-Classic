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
