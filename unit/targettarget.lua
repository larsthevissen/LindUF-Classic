-- targettarget.lua START --
local targettarget = LindUF:UnitFrame("targettarget")
targettarget:SetWidth(100)
targettarget:SetHeight(20)
targettarget:ClearAllPoints()
targettarget:SetPoint("LEFT", UIParent, "CENTER", 270, -120)

LindUF:health(targettarget)
local f = targettarget.HealthBar
f.Texture:SetColorTexture(1,0,0,.7)
f.Background:ClearAllPoints()
f.Background:SetWidth(100)
f.Background:SetHeight(20)
f.Background:SetPoint("LEFT", UIParent, "CENTER", 270, -120)

LindUF:Name(targettarget)
targettarget.Name:ClearAllPoints()
targettarget.Name:SetPoint("LEFT", f.Background, "LEFT", 2, 0)
-- targettarget.lua END --
