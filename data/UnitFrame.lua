LindUF.UnitFrame = function(self, unit)

  local f = CreateFrame("Button", "Lind."..unit, UIParent, "SecureUnitButtonTemplate")

  f:SetWidth(100)
  f:SetHeight(30)
  f:SetPoint("CENTER", 0, 0)
  f:SetAttribute("unit", unit)
  f:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  f:SetAttribute("type1", "target")
  f:SetAttribute("type2", "menu")
  RegisterUnitWatch(f)


  f.unit = unit

  f:SetScript("OnUpdate", function(self, ...)

  end)
  return f
end
