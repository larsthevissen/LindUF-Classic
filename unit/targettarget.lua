-- targettarget.lua START --
local targettarget = LindUF:UnitFrame("targettarget")
targettarget:SetWidth(150)
targettarget:SetHeight(20)
targettarget:ClearAllPoints()
targettarget:SetPoint("BOTTOMLEFT", target, "TOPLEFT", 0, 10)

LindUF:HealthBar(targettarget)
-- targettarget.lua END --
