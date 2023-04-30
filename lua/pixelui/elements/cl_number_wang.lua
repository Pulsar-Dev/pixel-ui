local PANEL = {}

AccessorFunc(PANEL, "HideWang", "HideWang", FORCE_BOOL)
AccessorFunc(PANEL, "Interval", "Interval", FORCE_NUMBER)
AccessorFunc(PANEL, "Min", "Min", FORCE_NUMBER)
AccessorFunc(PANEL, "Max", "Max", FORCE_NUMBER)

function PANEL:Init()
    self:SetHideWang(false)
    self:SetNumeric(true)
    self:SetInterval(1)
    self:SetValue(1)
    self:SetMin(1)
    self:SetMax(100)
    self:SetHistoryEnabled(false)
    self:SetUpdateOnType(true)
    self.UpButton = self:Add("PIXEL.ImgurButton")
    self.UpButton:SetImgurID("RD7dJ7x")
    self.UpButton.DoClick = function(s)
        local current = tonumber(self:GetValue())
        if not current then current = self:GetMin() or 0 end
        local interval = self:GetInterval() or 1
        local new = current + interval
        if (new > self:GetMax()) or (new < self:GetMin()) then
            new = current
        end
        self:SetValue(new)
    end

    self.DownButton = self:Add("PIXEL.ImgurButton")
    self.DownButton:SetImgurID("Y9Dqinn")
    self.DownButton.DoClick = function(s)
        local current = tonumber(self:GetValue())
        if not current then current = self:GetMin() or 0 end
        local interval = self:GetInterval() or 1
        local new = current - interval
        if (new > self:GetMax()) or (new < self:GetMin()) then
            new = current
        end
        self:SetValue(new)
    end

    function self:AllowInput()
        local value = self:GetValue()
        value = tonumber(value)
        if not value then
            value = self:GetMin() or 0
        end
        if (value > self:GetMax()) then
            self.TextEntry:SetText(self:GetMax())
            return true
        end

        if (value < self:GetMin()) then
            self.TextEntry:SetText(self:GetMin())
            return true
        end
        return false
    end

    function self:OnValueChange()
        local value = self:GetValue()
        if not value then value = self:GetMin() or 0 end
        value = tonumber(value)
        if (value > self:GetMax()) then
            self.TextEntry:SetText(self:GetMax())
        elseif (value < self:GetMin()) then
            self.TextEntry:SetText(self:GetMin())
        end
    end
end

function PANEL:LayoutContent(w, h)
    if self:GetHideWang() then
        self.UpButton:SetVisible(false)
        self.DownButton:SetVisible(false)
    end
    local height = (h / 4)
    self.UpButton:SetSize(height, height)
    self.UpButton:SetPos(w - height - PIXEL.Scale(10), (h / 2) - height)

    self.DownButton:SetSize(height, height)
    self.DownButton:SetPos(w - height - PIXEL.Scale(10), h - self.UpButton:GetY() - height)

    local zPos = self:GetZPos()
    self.UpButton:SetZPos(zPos + 1)
    self.DownButton:SetZPos(zPos + 1)
end


vgui.Register("PIXEL.NumberWang", PANEL, "PIXEL.TextEntry")