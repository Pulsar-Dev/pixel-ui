local PANEL = {}

function PANEL:Init()
    self.TextEntry = vgui.Create("PulsarUI.TextEntryInternal", self)

    self.PlaceholderTextCol = PulsarUI.OffsetColor(PulsarUI.Colors.SecondaryText, -110)

    self.DisabledCol = PulsarUI.OffsetColor(PulsarUI.Colors.Background, 6)
    self.FocusedOutlineCol = PulsarUI.Colors.PrimaryText

    self.OutlineCol = PulsarUI.OffsetColor(PulsarUI.Colors.Scroller, 10)
    self.InnerOutlineCol = PulsarUI.CopyColor(PulsarUI.Colors.Transparent)
end

function PANEL:PerformLayout(w, h)
    self.TextEntry:Dock(FILL)

    local xPad, yPad = PulsarUI.Scale(4), PulsarUI.Scale(8)
    self:DockPadding(xPad, yPad, xPad, yPad)

    self:LayoutContent(w, h)
end

function PANEL:Paint(w, h)
    if not self:IsEnabled() then
        PulsarUI.DrawRoundedBox(8, 0, 0, w, h, self.DisabledCol)
        PulsarUI.DrawSimpleText("Disabled", "UI.TextEntry", PulsarUI.Scale(4), h / 2, PulsarUI.Colors.SecondaryText, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        return
    end

    if self:GetValue() == "" then
        PulsarUI.DrawSimpleText(self:GetPlaceholderText() or "", "UI.TextEntry", PulsarUI.Scale(10), h / 2, self.PlaceholderTextCol, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    local outlineThickness = PulsarUI.Scale(1)
    PulsarUI.DrawOutlinedRoundedBox(4, 0, 0, w, h, self.OutlineCol, outlineThickness)

    local col = PulsarUI.Colors.Transparent

    if self:IsEditing() then
        col = self.FocusedOutlineCol
    end

    if self.OverrideCol then
        col = self.OverrideCol
    end

    self.InnerOutlineCol = PulsarUI.LerpColor(FrameTime() * 8, self.InnerOutlineCol, col)

    PulsarUI.DrawOutlinedRoundedBox(4, outlineThickness, outlineThickness, w - outlineThickness * 2, h - outlineThickness * 2, self.InnerOutlineCol, PulsarUI.Scale(1))
end

function PANEL:LayoutContent(w, h) end

function PANEL:OnChange() end
function PANEL:OnValueChange(value) end

function PANEL:IsEnabled() return self.TextEntry:IsEnabled() end
function PANEL:SetEnabled(enabled) self.TextEntry:SetEnabled(enabled) end

function PANEL:GetValue() return self.TextEntry:GetValue() end
function PANEL:SetValue(value) self.TextEntry:SetValue(value) end

function PANEL:IsMultiline() return self.TextEntry:IsMultiline() end
function PANEL:SetMultiline(isMultiline) self.TextEntry:SetMultiline(isMultiline) end

function PANEL:IsEditing() return self.TextEntry:IsEditing() end

function PANEL:GetEnterAllowed() return self.TextEntry:GetEnterAllowed() end
function PANEL:SetEnterAllowed(allow) self.TextEntry:SetEnterAllowed(allow) end

function PANEL:GetUpdateOnType() return self.TextEntry:GetUpdateOnType() end
function PANEL:SetUpdateOnType(enabled) self.TextEntry:SetUpdateOnType(enabled) end

function PANEL:GetNumeric() return self.TextEntry:GetNumeric() end
function PANEL:SetNumeric(enabled) self.TextEntry:SetNumeric(enabled) end

function PANEL:GetHistoryEnabled() return self.TextEntry:GetHistoryEnabled() end
function PANEL:SetHistoryEnabled(enabled) self.TextEntry:SetHistoryEnabled(enabled) end

function PANEL:GetTabbingDisabled() return self.TextEntry:GetTabbingDisabled() end
function PANEL:SetTabbingDisabled(disabled) self.TextEntry:SetTabbingDisabled(disabled) end

function PANEL:GetPlaceholderText() return self.TextEntry:GetPlaceholderText() end
function PANEL:SetPlaceholderText(text) self.TextEntry:SetPlaceholderText(text) end

function PANEL:GetInt() return self.TextEntry:GetInt() end
function PANEL:GetFloat() return self.TextEntry:GetFloat() end

function PANEL:IsEditing() return self.TextEntry:IsEditing() end
function PANEL:SetEditable(enabled) self.TextEntry:SetEditable(enabled) end

function PANEL:AllowInput(value) end
function PANEL:GetAutoComplete(txt) end

function PANEL:OnKeyCode(code) end
function PANEL:OnEnter() end

function PANEL:OnGetFocus() end
function PANEL:OnLoseFocus() end

vgui.Register("PulsarUI.TextEntry", PANEL, "Panel")