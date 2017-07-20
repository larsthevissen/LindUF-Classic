-- raid.lua START --
local raid = {}
for i = 1, MAX_RAID_MEMBERS do
  raid[i] = LindUF:UnitFrame("raid"..i)
  -- raid[i] = LindUF:UnitFrame("player")
  raid[i]:SetWidth(100)
  raid[i]:SetHeight(20)
  raid[i]:ClearAllPoints()
  if (i < 21) then
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 10, 200-i*23)
  else
    raid[i]:SetPoint("LEFT", UIParent, "LEFT", 120, 200-(i-20)*23)
  end

  LindUF:HealthBar(raid[i])

  LindUF:Name(raid[i])
  raid[i].Name:ClearAllPoints()
  raid[i].Name:SetPoint("LEFT", raid[i].HealthBar, "Left", 2, 0)

  raid[i].raidIcon:SetWidth(16)
  raid[i].raidIcon:SetHeight(16)
  raid[i].raidIcon:SetPoint("CENTER", 0, 0)


  raid[i].HealthBar:RegisterEvent("GROUP_ROSTER_UPDATE")
  raid[i].HealthBar:SetScript("OnEvent", function(self, ...)
    role = UnitGroupRolesAssigned(self.unit)
    if role == "TANK" then
      self:SetBackdropBorderColor(1,0,0,.8)
    elseif role == "HEALER" then
      self:SetBackdropBorderColor(0,1,0,.8)
    else
      self:SetBackdropBorderColor(1,1,1,.8)
    end
  end)


end

-- raid.lua END --
