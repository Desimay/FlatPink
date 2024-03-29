local SKIN = {}

SKIN.PrintName          				= "Pink Flat"
SKIN.Author           					= "Grey Hellios"
SKIN.DermaVersion       				= 1

SKIN.colOutline 						= Color( 0, 0, 0, 20 )

SKIN.BigTitleFont 						= "greenHead"
SKIN.SmallTitleFont 					= "greenHeadSmall"
SKIN.fontButton							= "greenButton"
SKIN.menuTitle							= "Clean Green"

SKIN.bg_color							= Color(25, 25, 25, 255)
SKIN.head_color							= Color(219, 10, 91, 255)

SKIN.dPanel_bg							= Color(149, 165, 166, 255)

SKIN.scrollbar_bg						= Color(255, 0, 90, 100)
SKIN.scrollbar_btn						= Color(246, 36, 89, 200)

SKIN.colButtonHover						= Color(246, 36, 89, 255)
SKIN.colButtonNormal					= Color(219, 10, 91, 255)
SKIN.colButtonText						= Color(255, 255, 255)
SKIN.colButtonTextDisabled				= Color(0, 0, 0, 255)

SKIN.checkboxChecked					= Color(246, 36, 89, 255)
SKIN.checkboxUnChecked					= Color(0, 0, 0, 255)

SKIN.textColor							= Color(255, 255, 255, 255)
SKIN.textColor_light					= Color(200, 200, 200, 255)

/*---------------------------------------------------------
        Fonts
---------------------------------------------------------*/

surface.CreateFont("pinkHead", {
	font = "coolvetica",
	size = 50, 
	weight = 500
})

surface.CreateFont("pinkHeadSmall", {
	font = "coolvetica",
	size = 25, 
	weight = 500
})

surface.CreateFont("pinkPaint", {
	font = "coolvetica",
	size = 20, 
	outlined = true,
	weight = 500
})

surface.CreateFont("pinkButton", {
	font = "coolvetica",
	size = 25, 
	weight = 500
})

surface.CreateFont("pinkTitle", {
	font = "Default",
	size = 30, 
	weight = 500
})

/*---------------------------------------------------------
        Frame
---------------------------------------------------------*/
function SKIN:DrawSquaredBox( x, y, w, h, color )
	surface.SetDrawColor( color )
	surface.DrawRect( x, y, w, h )
			
	surface.SetDrawColor( self.colOutline )
	surface.DrawOutlinedRect( x, y, w, h )
end

function SKIN:PaintFrame( panel )
	self:DrawSquaredBox( 0, 0, panel:GetWide(), panel:GetTall(), self.bg_color )
	panel.lblTitle:SetFont(self.SmallTitleFont)
	
	draw.RoundedBox(0, 0, 0, panel:GetWide(), panel:GetTall(), self.bg_color) -- BG
	draw.RoundedBox(0, panel:GetWide() - 540, panel:GetTall() - 470, panel:GetWide() - 20, panel:GetTall() - 90, self.dPanel_bg) -- BG
	draw.RoundedBox(0, 0, 0, panel:GetWide(), 20, SKIN.head_color) -- Header Top
end

/*---------------------------------------------------------
        Button
---------------------------------------------------------*/
function SKIN:PaintButton(panel, w, h)
	if ( panel.Hovered ) then
		panel:SetTextColor(SKIN.textColor)
		surface.SetDrawColor(self.colButtonHover)
		surface.DrawRect(0, 0, w, h)
	else
		panel:SetTextColor(SKIN.textColor_light)
		surface.SetFont(self.fontButton)
		surface.SetDrawColor(self.colButtonNormal)
		surface.DrawRect(0, 0, w, h)
	end
	panel:SetFont(self.fontButton)
end

/*---------------------------------------------------------
        Scrollbar
---------------------------------------------------------*/
function SKIN:PaintScrollBarGrip( panel, w, h )
	if panel.Depressed then
		surface.SetDrawColor( SKIN.scrollbar_btn.r + 30, SKIN.scrollbar_btn.g + 10, SKIN.scrollbar_btn.b + 15 )
	else
		surface.SetDrawColor( SKIN.scrollbar_btn.r - 50, SKIN.scrollbar_btn.g - 50, SKIN.scrollbar_btn.b - 50 )
	end
	surface.DrawRect( 0, 0, w, h )
end

function SKIN:PaintVScrollBar( panel, w, h )
	surface.SetDrawColor(SKIN.scrollbar_bg)
	surface.DrawRect( 0, 0, panel:GetWide(), panel:GetTall() )
	surface.SetDrawColor(SKIN.scrollbar_bg)
	surface.DrawRect( 1, 1, panel:GetWide() - 2, panel:GetTall() - 2 )
end

function SKIN:PaintButtonDown( panel, w, h )
	self:PaintButton( panel, w, h )
	surface.SetDrawColor( SKIN.scrollbar_btn )
	surface.DrawRect( 0, 0, panel:GetWide(), panel:GetTall() )
	surface.SetDrawColor( SKIN.scrollbar_bg )
	surface.DrawRect( 1, 1, panel:GetWide() - 2, panel:GetTall() - 2 )
end

function SKIN:PaintButtonUp( panel, w, h )
	self:PaintButton( panel, w, h )
	surface.SetDrawColor(SKIN.scrollbar_btn)
	surface.DrawRect( 0, 0, panel:GetWide(), panel:GetTall() )
	surface.SetDrawColor(SKIN.scrollbar_bg)
	surface.DrawRect( 1, 1, panel:GetWide() - 2, panel:GetTall() - 2 )
end

/*---------------------------------------------------------
        List View
---------------------------------------------------------*/
function SKIN:PaintListView(panel, w, h)
	surface.SetDrawColor(80, 80, 80)
	surface.DrawRect(0, 0, w, h)
end

--[[---------------------------------------------------------
	CheckBox
-----------------------------------------------------------]]
function SKIN:PaintCheckBox( panel, w, h )
	if ( panel:GetChecked() ) then
		if ( panel:GetDisabled() ) then
			draw.RoundedBox(0, 0, 0, panel:GetWide(), panel:GetTall(), SKIN.checkboxUnChecked)
		else
			// Checked \\
			draw.RoundedBox(4, 0, 0, panel:GetWide(), panel:GetTall(), SKIN.checkboxUnChecked)
			draw.RoundedBox(6, 2, 2, panel:GetWide() - 4, panel:GetTall() - 4, SKIN.checkboxChecked)
		end
	else
		if ( panel:GetDisabled() ) then
			draw.RoundedBox(0, 0, 0, panel:GetWide(), panel:GetTall(), SKIN.checkboxUnChecked)
		else
			// Not Checked \\
			draw.RoundedBox(4, 0, 0, panel:GetWide(), panel:GetTall(), SKIN.checkboxUnChecked)
		end
	end	
end

derma.DefineSkin( "PinkFlat", "A flatui with pink and silver colors", SKIN )