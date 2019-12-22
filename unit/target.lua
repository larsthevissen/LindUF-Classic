-- -- target.lua START --

local f = LindUF:UnitFrame("target")
f:ClearAllPoints()
f:SetWidth(300)
f:SetHeight(15)
f:SetPoint("LEFT", UIParent, "CENTER", 100, -150)

LindUF:health(f)
f.HealthBar.Texture:SetColorTexture(1, 0, 0, .7)
f.HealthBar:ClearAllPoints()
f.HealthBar:SetWidth(300)
f.HealthBar:SetHeight(15)
f.HealthBar:SetPoint("LEFT", UIParent, "CENTER", 100, -150)
f.HealthBar:SetReverseFill(true)

LindUF:power(f)
f.PowerBar.Texture:SetColorTexture(1,0,0,.5)
f.PowerBar:ClearAllPoints()
f.PowerBar:SetWidth(300)
f.PowerBar:SetHeight(10)
f.PowerBar:SetPoint("TOP", f.HealthBar, "BOTTOM", 0, -5)
f.PowerBar:RegisterEvent("UNIT_TARGET")

LindUF:HealthText(f)
f.HealthText:ClearAllPoints()
f.HealthText:SetPoint("LEFT", f.HealthBar, "LEFT", -2, 0)

LindUF:PowerText(f)
f.PowerText:ClearAllPoints()
f.PowerText:SetPoint("LEFT", f.PowerBar, "LEFT", -2, 0)

LindUF:Name(f)
f.Name:ClearAllPoints()
f.Name:SetPoint("LEFT", f.HealthBar, "RIGHT", 2, 0)
-- f.Name.Text:ClearAllPoints()
-- f.Name.Text:SetPoint("RIGHT", 0, 0)

LindUF.Target = f

-- -- target.lua END --
