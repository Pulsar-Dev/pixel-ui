
local PANEL = {}

function PANEL:Init()
    self:SetClicky(false)
    self.Fraction = 0

    self.Grip = vgui.Create("PulsarUI.Button", self)
    self.Grip:NoClipping(true)
    self.Grip:SetMouseInputEnabled(true)
    self.NormalCol = PulsarUI.CopyColor(PulsarUI.Colors.Primary)
    self.HoverCol = PulsarUI.OffsetColor(PulsarUI.Colors.Primary, -15)
    local currentCol = self.NormalCol

    self.Grip.Paint = function(s, w, h)
        PulsarUI.DrawRoundedBox(8, 0, 0, w, h, currentCol)
    end

    self.Grip.Think = function(s)
        if s:IsHovered() then
            currentCol = self.HoverCol
            s:SetCursor("sizewe")
        else
            currentCol = self.NormalCol
            s:SetCursor("arrow")
        end
    end

    self.Grip.OnCursorMoved = function(pnl, x, y)
        if not pnl.Depressed then return end
        x, y = pnl:LocalToScreen(x, y)
        x = self:ScreenToLocal(x, y)
        self.Fraction = math.Clamp(x / self:GetWide(), 0, 1)
        self:OnValueChanged(self.Fraction)
        self:InvalidateLayout()
    end

    self.BackgroundCol = PulsarUI.Colors.Header
    self.FillCol = PulsarUI.OffsetColor(PulsarUI.Colors.Header, 5)
end

function PANEL:OnMousePressed()
    local w = self:GetWide()
    self.Fraction = math.Clamp(self:CursorPos() / w, 0, 1)
    self:OnValueChanged(self.Fraction)
    self:InvalidateLayout()
    self.Grip:RequestFocus()
end

function PANEL:OnValueChanged(fraction)
end

function PANEL:Paint(w, h)
    local rounding = PulsarUI.Scale(8)
    PulsarUI.DrawRoundedBox(rounding, 0, 0, w, h, self.BackgroundCol)
    PulsarUI.DrawRoundedBox(rounding, 0, 0, self.Fraction * w, h, self.FillCol)
end

function PANEL:PerformLayout(w, h)
    local gripSize = h + PulsarUI.Scale(6)
    local offset = PulsarUI.Scale(3)
    self.Grip:SetSize(gripSize, gripSize)
    self.Grip:SetPos((self.Fraction * w) - (gripSize * .5), -offset)
end

function PANEL:LayoutContent()
end

vgui.Register("PulsarUI.Slider", PANEL, "PulsarUI.Button")