-- Name.lua START --
-- LindUF.Name = function(self, p)
function LindUF:Name(p)
  if not p then return end
  if p.Name then return end

  local f = CreateFrame("Frame", "lind."..p.unit..".Name", p)
  f:SetWidth(1)
  f:SetHeight(1)
  f.length = 30

  f.Text = f:CreateFontString(nil, "OVERLAY")
  f.Text:SetPoint("LEFT", 0, 0)
  f.Text:SetFont(LindUF.font, 14, "OUTLINE")
  f:SetFrameStrata("BACKGROUND")
  f:SetFrameLevel(3)
  f.name = ""
  f.realm = ""
  f.unit = p.unit
  f.update = 0
  f:SetScript("OnUpdate", function(self, elapsed)
    local r, g, b = LindUF.ClassColor(p.unit)
    f.Text:SetTextColor(r, g, b)
    self.update = self.update + elapsed
    if self.update < 0.3 then return else self.update = 0 end

    name, realm = UnitName(self.unit)
    if (name ~= nil and name ~= '') then
      name = string.sub(name, 1, self.length)
    end
    if name ~= self.name then
      self.Text:SetText(name)
      self.name = name
    end

  end)
  p.Name = f
end

-- Name.lua END --
