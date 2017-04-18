-- boss.lua START --
local boss = {}
for i = 1, 5 do
  boss[i] = LindUF:UnitFrame("boss"..i)
  boss[i]:SetWidth(100)
  boss[i]:SetHeight(20)
  boss[i]:ClearAllPoints()
  boss[i]:SetPoint("RIGHT", UIParent, "RIGHT", -30, 100-i*30)

  LindUF:HealthBar(boss[i])

  LindUF:Name(boss[i])
  boss[i].Name:ClearAllPoints()
  boss[i].Name:SetPoint("LEFT", boss[i].HealthBar, "Left", 2, 0)
end
-- boss.lua END --
