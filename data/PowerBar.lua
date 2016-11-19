-- LindUF.PowerBar = function(self, p)
function LindUF:PowerBar(p)
  if not p then return end
  if p.PowerBar then return end

  local f = CreateFrame("Frame", "lind."..p.unit..".PowerBar", p)

  f:SetBackdrop( {
      bgFile = "Interface\\AddOns\\LindUF\\LindBar.tga",
      edgeFile = "Interface\\AddOns\\LindUF\\LindBorder.tga",
      tile = false, tileSize = 0, edgeSize = 8,
      insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
  f:SetBackdropColor(.2, .2, .2, .8);
  f:SetBackdropBorderColor(1, 1, 1, .8)

  f.unit = p.unit
  f:SetFrameStrata("BACKGROUND")
  f:SetFrameLevel(0)

  f:SetWidth(p:GetWidth())
  f:SetHeight(p:GetHeight())
  f:SetAllPoints(p)

  f.Power = CreateFrame("StatusBar", "lind."..p.unit..".Power", f)
  f.Power:SetStatusBarTexture("Interface\\AddOns\\LindUF\\LindBar.tga")
  f.Power:SetStatusBarColor(1, 1, 0, 1)
  f.Power:SetPoint("CENTER", f, "CENTER", 0, 0)
  f.Power:SetWidth(f:GetWidth()-4)
  f.Power:SetHeight(f:GetHeight()-4)
  f.Power:SetFrameStrata("BACKGROUND")
  f.Power:SetFrameLevel(1)

  f.power = -1
  f.update = 0

  f:SetScript("OnUpdate", function(self, elapsed)
    self.update = self.update + elapsed
    if self.update < 0.1 then return else self.update = 0 end
    local power = UnitPower(self.unit)
    local powerMax = UnitPowerMax(self.unit)
    local r, g, b = LindUF.PowerColor(self.unit)
    if power ~= self.power then
      if powerMax > 0 then
        self.Power:SetAlpha(1)
        self:SetAlpha(1)
        self.Power:SetStatusBarColor(r, g, b, 1)
        self.Power:SetMinMaxValues(0, powerMax)
        self.Power:SetValue(power)
      else
        self.Power:SetAlpha(0)
        self:SetAlpha(0)
      end
    end
  end)

  p.PowerBar = f
end


-- Name.lua START --
-- LindUF.Name = function(self, p)
function LindUF:Name(p)
  if not p then return end
  if p.Name then return end

  local f = CreateFrame("Frame", "lind."..p.unit..".Name", p)
  f:SetWidth(1)
  f:SetHeight(1)

  f.Text = f:CreateFontString(nil, "OVERLAY")
  f.Text:SetPoint("LEFT", 0, 0)
  f.Text:SetFont(LindUF.font, 14, "OUTLINE")
  f.Text:SetTextColor(1, 1, 1)
  f:SetFrameStrata("BACKGROUND")
  f:SetFrameLevel(3)
  f.name = ""
  f.realm = ""
  f.unit = p.unit
  f.update = 0
  f:SetScript("OnUpdate", function(self, elapsed)
    self.update = self.update + elapsed
    if self.update < 0.3 then return else self.update = 0 end

    name, realm = UnitName(self.unit)
    if name ~= self.name then
      self.Text:SetText(name)
      self.name = name
    end

  end)
  p.Name = f
end

-- Name.lua END --
