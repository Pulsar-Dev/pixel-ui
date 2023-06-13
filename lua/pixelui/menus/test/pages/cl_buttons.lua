PIXEL = PIXEL or {}
local sc = PIXEL.Scale
local PANEL = {}


function PANEL:Init()
	self.Button = vgui.Create("PIXEL.Button", self)
	self.Button:Dock(TOP)
	self.Button:DockMargin(sc(10), sc(10), sc(10), sc(10))
	self.Button:SetTall(sc(50))
	self.Button.DoClick = function()
		notification.AddLegacy("Normal Button!", NOTIFY_GENERIC, 5)
	end

	self.ClickyButton = vgui.Create("PIXEL.Button", self)
	self.ClickyButton:Dock(TOP)
	self.ClickyButton:DockMargin(sc(10), sc(10), sc(10), sc(10))
	self.ClickyButton:SetTall(sc(50))
	self.ClickyButton:SetClicky(true)
	self.ClickyButton.DoClick = function()
		notification.AddLegacy("Normal Clicky Button!", NOTIFY_GENERIC, 5)
	end

	self.ClickyTextButton = vgui.Create("PIXEL.TextButton", self)
	self.ClickyTextButton:Dock(TOP)
	self.ClickyTextButton:DockMargin(sc(10), sc(10), sc(10), sc(10))
	self.ClickyTextButton:SetTall(sc(50))
	self.ClickyTextButton:SetText("Clicky Button!")
	self.ClickyTextButton.DoClick = function()
		notification.AddLegacy("Clicky Text Button!", NOTIFY_GENERIC, 5)
	end

	self.TextButton = vgui.Create("PIXEL.TextButton", self)
	self.TextButton:Dock(TOP)
	self.TextButton:DockMargin(sc(10), sc(10), sc(10), sc(10))
	self.TextButton:SetTall(sc(50))
	self.TextButton:SetText("Non Clicky Button!")
	self.TextButton:SetClicky(false)
	self.TextButton.DoClick = function()
		notification.AddLegacy("Non Clicky Text button!", NOTIFY_GENERIC, 5)
	end

	self.NoSoundButton = vgui.Create("PIXEL.TextButton", self)
	self.NoSoundButton:Dock(TOP)
	self.NoSoundButton:DockMargin(sc(10), sc(10), sc(10), sc(10))
	self.NoSoundButton:SetTall(sc(50))
	self.NoSoundButton:SetText("No Sound Clicky Button!")
	self.NoSoundButton:SetSounds(false)
	self.NoSoundButton.DoClick = function()
		notification.AddLegacy("No Sound Button!", NOTIFY_GENERIC, 5)
	end


	self.ImgurButton = vgui.Create("PIXEL.ImgurButton", self)
	self.ImgurButton:Dock(TOP)
	self.ImgurButton:DockMargin(sc(10), sc(10), sc(10), sc(10))
	self.ImgurButton:SetSize(sc(50), sc(50))
	self.ImgurButton:SetImgurID("8bKjn4t")
	self.ImgurButton:SetNormalColor(PIXEL.Colors.PrimaryText)
	self.ImgurButton:SetHoverColor(PIXEL.Colors.Negative)
	self.ImgurButton:SetClickColor(PIXEL.Colors.Positive)
	self.ImgurButton:SetDisabledColor(PIXEL.Colors.DisabledText)
	self.ImgurButton.DoClick = function()
		notification.AddLegacy("Imgur Button!", NOTIFY_GENERIC, 5)
	end
end

function PANEL:PaintMore(w,h)

end

vgui.Register("PIXEL.Test.Buttons", PANEL)