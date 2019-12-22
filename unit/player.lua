

local f = LindUF:UnitFrame("player")
f:ClearAllPoints()
f:SetWidth(300)
f:SetHeight(15)
f:SetPoint("RIGHT", UIParent, "CENTER", -100, -150)


LindUF:health(f)
f.HealthBar.Texture:SetColorTexture(1,0,0,.7)
f.HealthBar:ClearAllPoints()
f.HealthBar:SetWidth(300)
f.HealthBar:SetHeight(15)
f.HealthBar:SetPoint("RIGHT", UIParent, "CENTER", -100, -150)

LindUF:power(f)
f.PowerBar.Texture:SetColorTexture(1,0,0,.5)
f.PowerBar:ClearAllPoints()
f.PowerBar:SetWidth(300)
f.PowerBar:SetHeight(10)
f.PowerBar:SetPoint("TOP", f.HealthBar, "BOTTOM", 0, -5)
f.PowerBar:SetReverseFill(true)


LindUF:HealthText(f)
f.HealthText:ClearAllPoints()
f.HealthText.Text:ClearAllPoints()
f.HealthText:SetPoint("RIGHT", f.HealthBar, "RIGHT", 2, 0)
f.HealthText.Text:SetPoint("LEFT", f.HealthText, "RIGHT", 0, 0)

LindUF:PowerText(f)
f.PowerText:ClearAllPoints()
f.PowerText.Text:ClearAllPoints()
f.PowerText:SetPoint("RIGHT", f.PowerBar, "RIGHT", 2, 0)
f.PowerText.Text:SetPoint("LEFT", f.PowerText, "RIGHT", 0, 0)

LindUF:Name(f)
f.Name:ClearAllPoints()
f.Name:SetPoint("RIGHT", f.HealthBar, "LEFT", -2, 0)
f.Name.Text:ClearAllPoints()
f.Name.Text:SetPoint("RIGHT", 0, 0)


-- f.PowerBar.Texture:SetVertexOffset(3, -5, 0)
-- f.PowerBar.BackgroundTexture:SetVertexOffset(3, -5, 0)
-- f.PowerBar.Texture:SetVertexOffset(1, -5, 0)
-- f.PowerBar.BackgroundTexture:SetVertexOffset(1, -5, 0)


-- f.HealthBar.Texture:SetVertexOffset(3, -10, 0)
-- f.HealthBar.BackgroundTexture:SetVertexOffset(3, -10, 0)
-- f.HealthBar.Texture:SetVertexOffset(1, -10, 0)
-- f.HealthBar.BackgroundTexture:SetVertexOffset(1, -10, 0)

LindUF.Player = f


-- PlayerFrame:SetScript("OnEvent", nil);
-- PlayerFrame:Hide();
