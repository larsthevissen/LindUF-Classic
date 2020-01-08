-- raid.lua START --

local raid = {}
for i = 1, MAX_RAID_MEMBERS do
  raid[i] = LindUF:UnitFrame("raid"..i)
  raid[i]:SetWidth(75)
  raid[i]:SetHeight(20)
  raid[i]:ClearAllPoints()
  -- if (i % 5 == 1) then
  --   raid[i]:SetPoint("LEFT", UIParent, "BOTTOMLEFT", 10, 270-i/5*26)
  -- else
  --   raid[i]:SetPoint("LEFT", raid[i-1], "RIGHT", 5, 0)
  -- end
  if (i < 21) then
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 20, 300-i*22)
  else
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 100, 300-(i-20)*22)
  end
  LindUF:health(raid[i])
  raid[i].HealthBar:ClearAllPoints()
  raid[i].HealthBar:SetAllPoints(raid[i])

  LindUF:Name(raid[i])
  raid[i].Name:ClearAllPoints()
  raid[i].Name:SetPoint("LEFT", raid[i].HealthBar, "LEFT", 2, 0)
  raid[i].Name.length = 4

  raid[i].raidIcon:SetWidth(16)
  raid[i].raidIcon:SetHeight(16)
  raid[i].raidIcon:ClearAllPoints()
  raid[i].raidIcon:SetPoint("RIGHT", raid[i], "RIGHT", 0, 0)

end

local party = {}
for i = 1, 5 do

    party[i] = LindUF:UnitFrame("party"..i)
    local width = LindUF.Player:GetWidth()/4
    party[i]:SetWidth( width - 2)
    party[i]:SetHeight(20)
    party[i]:ClearAllPoints()
    party[i]:SetPoint("TOPLEFT", LindUF.Player, "BOTTOMLEFT", ((i-1)*width+1), -20)
    LindUF:health(party[i])
    LindUF:Name(party[i])

    party[i].HealthBar:ClearAllPoints()
    party[i].HealthBar:SetAllPoints(party[i])

    party[i].Name:ClearAllPoints()
    party[i].Name:SetPoint("LEFT", party[i], "LEFT", 2, 0)
    party[i].Name.length = 6

    party[i].raidIcon:SetWidth(16)
    party[i].raidIcon:SetHeight(16)
    party[i].raidIcon:SetPoint("CENTER", 0, -15)

end