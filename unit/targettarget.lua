-- targettarget.lua START --
local targettarget = LindUF:UnitFrame("targettarget")
targettarget:SetWidth(150)
targettarget:SetHeight(20)
targettarget:ClearAllPoints()
targettarget:SetPoint("BOTTOMLEFT", "lind.target.HealthBar", "TOPLEFT", 0, 10)

LindUF:HealthBar(targettarget)

LindUF:Name(targettarget)
targettarget.Name:ClearAllPoints()
targettarget.Name:SetPoint("LEFT", targettarget.HealthBar, "Left", 2, 0)
-- targettarget.lua END --
