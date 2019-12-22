-- targettarget.lua START --
local targettarget = LindUF:UnitFrame("targettarget")
targettarget:SetWidth(100)
targettarget:SetHeight(20)
targettarget:ClearAllPoints()
targettarget:SetPoint("BOTTOMRIGHT", LindUF.Target, "TOPRIGHT", 0, 15)

LindUF:health(targettarget)
local f = targettarget.HealthBar
f.Texture:SetColorTexture(1,0,0,8)
f:ClearAllPoints()
f:SetAllPoints(targettarget)
f:SetReverseFill(true)

LindUF:Name(targettarget)
targettarget.Name:ClearAllPoints()
targettarget.Name:SetPoint("LEFT", f, "RIGHT", 2, 0)
-- targettarget.lua END --
