-- PlayerFrame:SetScript("OnEvent", nil);
-- PlayerFrame:Hide();

local player = LindUF:UnitFrame("player")
player:SetWidth(300)
player:SetHeight(20)
player:ClearAllPoints()
player:SetPoint("RIGHT", UIParent, "CENTER", -200, -200)

PlayerFrame:ClearAllPoints()
PlayerFrame:SetPoint("CENTER", player, "CENTER", 0, 0)


player.menu = function(self, unit, button, actionType)
  -- ToggleDropDownMenu(1, nil, PlayerFrameDropDown, self, 0, 0)
  ToggleDropDownMenu(1, nil, LindUF.DropDown, self, 0, 0)
end


LindUF:HealthBar(player)
LindUF:PowerBar(player)

player.PowerBar:SetHeight(10)
player.PowerBar:ClearAllPoints()
player.PowerBar:SetPoint("TOP", player.HealthBar, "BOTTOM", 0, -3)
player.PowerBar.Power:SetHeight(6)

LindUF:CastBar(player)
player.CastBar:ClearAllPoints()
player.CastBar:SetHeight(8)
player.CastBar:SetPoint("TOP", player.PowerBar, "BOTTOM", 0, -3)

LindUF:Name(player)
player.Name:ClearAllPoints()
player.Name:SetPoint("LEFT", player.HealthBar, "Left", 2, 0)


-- DROPDOWN START --
local favoriteNumber = 42 -- A user-configurable setting

-- Create the dropdown, and configure its appearance
LindUF.DropDown = CreateFrame("FRAME", "WPDemoDropDown", UIParent, "UIDropDownMenuTemplate")
LindUF.DropDown:SetPoint("CENTER")
UIDropDownMenu_SetWidth(LindUF.DropDown, 200)
--UIDropDownMenu_SetText(LindUF.DropDown, "Favorite number: " .. favoriteNumber)

-- Create and bind the initialization function to the dropdown menu
UIDropDownMenu_Initialize(LindUF.DropDown, function(self, level, menuList)
 local info = UIDropDownMenu_CreateInfo()
 if (level or 1) == 1 then
  -- Display the 0-9, 10-19, ... groups
  for i=0,4 do
   info.text, info.checked = i*10 .. " - " .. (i*10+9), favoriteNumber >= i*10 and favoriteNumber <= (i*10+9)
   info.menuList, info.hasArrow = i, true
   UIDropDownMenu_AddButton(info)
  end

 else
  -- Display a nested group of 10 favorite number options
  info.func = self.SetValue
  for i=menuList*10, menuList*10+9 do
   info.text, info.arg1, info.checked = i, i, i == favoriteNumber
   UIDropDownMenu_AddButton(info, level)
  end
 end
end,
"MENU")

-- Implement the function to change the favoriteNumber
function LindUF.DropDown:SetValue(newValue)
 favoriteNumber = newValue
 -- Update the text; if we merely wanted it to display newValue, we would not need to do this
 UIDropDownMenu_SetText(LindUF.DropDown, "Favorite number: " .. favoriteNumber)
 -- Because this is called from a sub-menu, only that menu level is closed by default.
 -- Close the entire menu with this next call
 CloseDropDownMenus()
end
-- DROPDOWN END --
