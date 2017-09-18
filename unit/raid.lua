-- raid.lua START --

local raid = {}
for i = 1, MAX_RAID_MEMBERS do
  raid[i] = LindUF:UnitFrame("raid"..i)
  -- raid[i] = LindUF:UnitFrame("player")
  raid[i]:SetWidth(65)
  raid[i]:SetHeight(25)
  raid[i]:ClearAllPoints()
  if (i % 5 == 1) then
    raid[i]:SetPoint("BOTTOM", UIParent, "BOTTOM", -139, 270-i/5*26)
  else
    raid[i]:SetPoint("LEFT", raid[i-1], "RIGHT", 5, 0)
  end

  LindUF:HealthBar(raid[i])

  LindUF:Name(raid[i])
  raid[i].Name:ClearAllPoints()
  raid[i].Name:SetPoint("LEFT", raid[i].HealthBar, "Left", 2, 0)
  raid[i].Name.length = 4

  raid[i].raidIcon:SetWidth(16)
  raid[i].raidIcon:SetHeight(16)
  raid[i].raidIcon:SetPoint("CENTER", 0, 0)


  -- raid[i]:RegisterEvent("GROUP_ROSTER_UPDATE")
  -- raid[i]:SetScript("OnEvent", function(self, ...)
  --   role = UnitGroupRolesAssigned(self.unit)
  --   if role == "TANK" then
  --     self.HealthBar:SetBackdropBorderColor(1,0,0,.8)
  --   elseif role == "HEALER" then
  --     self.HealthBar:SetBackdropBorderColor(0,1,0,.8)
  --   else
  --     self.HealthBar:SetBackdropBorderColor(1,1,1,.8)
  --   end
  -- end)


end

-- local LindRaid = CreateFrame("Frame", "lindRaid", UIParent)
--
-- LindRaid:SetBackdrop( {
--     bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
--     edgeFile = "Interface\\AddOns\\LindUF\\LindBorder.tga",
--     tile = false, tileSize = 0, edgeSize = 8,
--     insets = { left = 0, right = 0, top = 0, bottom = 0 }
--   })
-- LindRaid:SetBackdropColor(.2, .2, .2, .0);
-- LindRaid:SetBackdropBorderColor(1, 1, 1, .8)
--
-- LindRaid:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
-- LindRaid:SetWidth(100)
-- LindRaid:SetHeight(50)
-- LindRaid:RegisterEvent("GROUP_ROSTER_UPDATE")
-- LindRaid:RegisterEvent("PLAYER_LOGIN")
-- LindRaid:SetScript("OnEvent", function(self, ...)
--
--   local playerNumber = GetNumGroupMembers()
--   local groupNumber = math.floor(playerNumber / 5)
--   local width = (groupNumber*100)
--   local height = 50
--
--   if playerNumber > 5 then
--     height = (5*height)
--   else
--     height = (playerNumber*height)
--   end
--
--   print(height)
--
--   self:SetWidth(width)
--   self:SetHeight(height)
--   self:Show()
-- end)

-- LindRaid:SetScript("OnUpdate", function(self, ...)
--   local playerNumber = GetNumGroupMembers()
--   local groupNumber = math.floor(playerNumber / 5)
--   self:ClearAllPoints()
--   local width = groupNumber * 50
--   local height = 135
--   self:SetWidth(width)
--   self:SetHeight(height)
--   self:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 100)
--
--
--   local count = 0
--
--   for i = 1, MAX_RAID_MEMBERS do
--     raid[i]:ClearAllPoints()
--     if count % 5 == 0 then
--       groupNumber = groupNumber - 1
--       count = 0
--     end
--     if count == 1 then
--       raid[i]:SetPoint("TOPLEFT", self, "TOPLEFT", 50*groupNumber, 0)
--     else
--       raid[i]:SetPoint("TOP", raid[i-1], "BOTTOM", 0, 2)
--     end
--     count = count + 1
--   end
-- end)
-- raid.lua END --
