-- DROPDOWN START --
LindUF.DropDown = function(self, p)
  f = CreateFrame("FRAME", "ldd."..p.unit, p, "UIDropDownMenuTemplate")

  UIDropDownMenu_Initialize(f, function(self, level, menuList)
      local info = UIDropDownMenu_CreateInfo()
      if level == 1 then
        info.text = "RaidTargetIcon"
        info.hasArrow = true
        info.notCheckable = true
        UIDropDownMenu_AddButton(info)

        if p.unit == pet then
          info.text = "Dismiss Pet"
          info.hasArrow = false
          info.func = self.PetDismiss
          UIDropDownMenu_AddButton(info)
        end
      end
      if level == 2 then
        local index = GetRaidTargetIndex(p.unit)

        for i = 1, 8 do
          if index == i then
            info.checked = true
          else
            info.checked = false
          end

          info.text = "-"
          info.func = self.SetMarker
          info.icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..i
          info.arg1 = i
          UIDropDownMenu_AddButton(info, 2)
        end
      end
    end,
  "MENU")

  f.SetMarker = function(self, value)
    SetRaidTarget(p.unit, value)
    CloseDropDownMenus()
  end

  f.PetDismiss = function(self)
    PetDismiss()
  end

  p.DropDown = f
end

-- -- DROPDOWN END --

LindUF.UnitFrame = function(self, unit)

  local f = CreateFrame("Button", "Lind."..unit, UIParent, "SecureUnitButtonTemplate")
  f.unit = unit
  f:SetWidth(100)
  f:SetHeight(30)
  f:SetPoint("CENTER", 0, 0)
  f:SetAttribute("unit", unit)
  f:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  f:SetAttribute("type1", "target")
  f:SetAttribute("type2", "menu")
  LindUF:DropDown(f)
  RegisterUnitWatch(f)

  f.menu = function(self, unit, button, actionType)
    -- ToggleDropDownMenu(1, nil, PlayerFrameDropDown, self, 0, 0)
    ToggleDropDownMenu(1, nil, f.DropDown, "cursor", 0, 0)
  end

  f:SetScript("OnUpdate", function(self, ...)
    local IconIndex = GetRaidTargetIndex(self.unit)
    if IconIndex then
      if not self.raidIcon then
        self.raidIcon = CreateFrame("Frame", self.unit.."Icon", self)
        self.raidIcon:SetWidth(32)
        self.raidIcon:SetHeight(32)
        self.raidIcon:SetPoint("CENTER", self, "CENTER", 0, 10)
        self.raidIcon.texture = self.raidIcon:CreateTexture(nil, "BACKGROUND")
        self.raidIcon.texture:SetAllPoints(self.raidIcon)
      end
      self.raidIcon.texture:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..IconIndex..".PNG")
    else
      if self.raidIcon then
        self.raidIcon.texture:SetTexture(nil)
      end
    end
  end)
  f:SetScript("OnEnter", function(self, motion)
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
    GameTooltip:SetUnit(self.unit)
    GameTooltip:Show()
  end)

  f:SetScript("OnLeave", function(self, motion)
    GameTooltip:Hide()
  end)
  return f
end
