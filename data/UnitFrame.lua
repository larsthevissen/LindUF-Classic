-- DROPDOWN START --
-- LindUF.DropDown = function(self, p)
function LindUF:DropDown(p)
  f = CreateFrame("FRAME", "ldd."..p.unit, p, "UIDropDownMenuTemplate")

  UIDropDownMenu_Initialize(f, function(self, level, menuList)
      local info = UIDropDownMenu_CreateInfo()
      if level == 1 then
        info.text = "RaidTargetIcon"
        info.hasArrow = true
        info.notCheckable = true
        UIDropDownMenu_AddButton(info)
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

  f.LeaveParty = function(self)
    LeaveParty()
  end

  p.DropDown = f
end

-- -- DROPDOWN END --

-- LindUF.UnitFrame = function(self, unit)
function LindUF:UnitFrame(unit)

  local lars = {}
  lars.width = 100
  lars.height = 30
  lars.SetWidth = function(self, w) self.width = w end
  lars.GetWidth = function(self) return self.width end

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

  if f.unit == "player" then
    f.menu = function(self, unit, button, actionType)
      ToggleDropDownMenu(1, nil, PlayerFrameDropDown, self, 0, 0)
    end
  elseif f.unit == "target" then
    f.menu = function(self, unit, button, actionType)
      ToggleDropDownMenu(1, nil, TargetFrameDropDown, self, 0, 0)
    end
  elseif f.unit == "pet" then
    f.menu = function(self, unit, button, actionType)
      ToggleDropDownMenu(1, nil, PetFrameDropDown, self, 0, 0)
    end
  else
    f.menu = function(self, unit, button, actionType)
      ToggleDropDownMenu(1, nil, f.DropDown, "cursor", 0, 0)
    end
  end

  f.raidIcon = CreateFrame("Frame", f.unit.."Icon", f)
  f.raidIcon:SetWidth(32)
  f.raidIcon:SetHeight(32)
  f.raidIcon:SetPoint("CENTER", f, "CENTER", 0, 10)
  f.raidIcon.texture = f.raidIcon:CreateTexture(nil, "BACKGROUND")
  f.raidIcon.texture:SetAllPoints(f.raidIcon)
  f.raidIcon:SetAlpha(.65)

  f:SetScript("OnUpdate", function(self, ...)
    local IconIndex = GetRaidTargetIndex(self.unit)
    if IconIndex then
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
