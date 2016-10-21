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
  ToggleDropDownMenu(1, nil, LindUF.DropDown, "cursor", 0, 0)
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
LindUF.DropDown = CreateFrame("FRAME", "WPDemoDropDown", UIParent, "UIDropDownMenuTemplate")
LindUF.DropDown:SetPoint("CENTER")
UIDropDownMenu_SetWidth(LindUF.DropDown, 200)

UIDropDownMenu_Initialize(LindUF.DropDown, function(self, level, menuList)
 local info = UIDropDownMenu_CreateInfo()
 if level == 1 then
   info.text = "RaidTargetIcon"
   info.hasArrow = true
   info.notCheckable = true
   UIDropDownMenu_AddButton(info)
 end

 if level == 2 then
   local index = GetRaidTargetIndex("player")

   for i = 1, 8 do
     if index == i then
       info.checked = true
     else
       info.checked = false
     end

     info.text = "_"
     info.func = self.SetMarker
     info.icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..i
     info.arg1 = i
     UIDropDownMenu_AddButton(info, 2)
   end
 end

end,
"MENU")

function LindUF.DropDown:SetMarker(value)
SetRaidTarget("player",value)
 CloseDropDownMenus()
end
-- DROPDOWN END --
