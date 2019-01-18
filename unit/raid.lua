-- raid.lua START --

local raid = {}
for i = 1, MAX_RAID_MEMBERS do
  raid[i] = LindUF:UnitFrame("raid"..i)
  raid[i]:SetWidth(100)
  raid[i]:SetHeight(25)
  raid[i]:ClearAllPoints()
  -- if (i % 5 == 1) then
  --   raid[i]:SetPoint("LEFT", UIParent, "BOTTOMLEFT", 10, 270-i/5*26)
  -- else
  --   raid[i]:SetPoint("LEFT", raid[i-1], "RIGHT", 5, 0)
  -- end
  if (i < 21) then
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 20, 300-i*30)
  else
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 130, 300-(i-20)*30)
  end
  LindUF:HealthBar(raid[i])

  LindUF:Name(raid[i])
  raid[i].Name:ClearAllPoints()
  raid[i].Name:SetPoint("LEFT", raid[i].HealthBar, "Left", 2, 0)
  raid[i].Name.length = 4

  raid[i].raidIcon:SetWidth(16)
  raid[i].raidIcon:SetHeight(16)
  raid[i].raidIcon:SetPoint("CENTER", 0, 0)

end
