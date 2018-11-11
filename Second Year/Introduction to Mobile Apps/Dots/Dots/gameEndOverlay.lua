local composer = require( "composer" )

local scene = composer.newScene()
local widget = require( "widget" )

local winnerText
local buttonMenu
local backgroundRect

local function handleMenu( event )
	composer.gotoScene( "mainmenu" )
end

local buttonFillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} }
local buttonStrokeFillColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} }

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	local params = event.params
	
	
	if ( phase == "will" ) then
		if params.redScore > params.yellowScore then
			winnerText = display.newText("Red Wins!", display.contentCenterX, display.contentCenterY, "Arial", 20)
			winnerText:setFillColor( 1, 0, 0 )
		elseif params.yellowScore > params.redScore then
			winnerText = display.newText("Yellow Wins!", display.contentCenterX, display.contentCenterY, "Arial", 20)
			winnerText:setFillColor( 1, 1, 0 )
		else
			winnerText = display.newText("Tie Game!", display.contentCenterX, display.contentCenterY, "Arial", 20)
		end
	end
	
	buttonMenu = widget.newButton(
	{
		label = "Menu",
		onRelease = handleMenu,
		emboss = false,
		-- Properties for a rounded rectangle button
		shape = "roundedRect",
		x = display.contentCenterX,
		y = display.contentCenterY + 100,
		width = 100,
		height = 35,
		cornerRadius = 2,
		fillColor = buttonFillColor,
		strokeColor = buttonStrokeFillColor,
		strokeWidth = 4
	}
)

	backgroundRect = display.newRect(display.contentCenterX, display.contentCenterY, display.pixelWidth, display.pixelHeight)
	backgroundRect:setFillColor ( black )
	backgroundRect.alpha = 0.5
	
	sceneGroup:insert( backgroundRect )
	sceneGroup:insert( winnerText )
	sceneGroup:insert( buttonMenu )
end

scene:addEventListener( "show", scene )

return scene