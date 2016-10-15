-- raid.lua START --
local raid = {}
for i = 1, 40 do
  raid[i] = LindUF:UnitFrame("raid"..i)
  raid[i]:SetWidth(100)
  raid[i]:SetHeight(20)
  raid[i]:ClearAllPoints()
  if (i < 21) then
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 10, 200-i*23)
  else
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 120, 200-(i-20)*23)
  end

  LindUF:HealthBar(raid[i])
end

-- raid.lua END --
