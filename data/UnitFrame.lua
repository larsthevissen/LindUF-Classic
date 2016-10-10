LindUF.UnitFrame = function(self, unit)

  local f = CreateFrame("Button", "LindBeta", UIParent, "SecureUnitButtonTemplate")

  f:SetWidth(100)
  f:SetHeight(30)
  f:SetPoint("CENTER", 0, 0)
  f:SetAttribute("unit", unit)
  f:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  f:SetAttribute("type1", "target")
  f:SetAttribute("type2", "menu")
  RegisterUnitWatch(f)
  if unit == "player" then
    f.menu = function(self, unit, button, actionType)
      ToggleDropDownMenu(1, nil, PlayerFrameDropDown, self, 0, 0)
    end
  else
    f.menu = function(self, unit, button, actionType)
      ToggleDropDownMenu(1, nil, TargetFrameDropDown, self, 0, 0)
    end
  end

  f.unit = unit

  f:SetScript("OnUpdate", function(self, ...)

  end)
  return f
end
