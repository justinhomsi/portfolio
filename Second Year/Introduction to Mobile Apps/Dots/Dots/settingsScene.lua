local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local settingsText
local buttonBack
local gridSizeText
local gridSizePlus
local gridSizeMinus
local gridSizeInt = 5
local gridSizeIntText
local buttonApply

local buttonFillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} }
local buttonStrokeFillColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} }

local function handleBack( event )
	composer.gotoScene("mainmenu")
end

local function handlePlus( event )
	if gridSizeInt >= 3 and gridSizeInt < 10 then
		gridSizeInt = gridSizeInt + 1
		gridSizeIntText.text = (""..gridSizeInt)
	end
end

local function handleMinus( event )
	if gridSizeInt > 3 and gridSizeInt <= 10 then
		gridSizeInt = gridSizeInt - 1
		gridSizeIntText.text = (""..gridSizeInt)
	end
end

local function handleApply( event )
	composer.setVariable( "gridSize", gridSizeInt)
	composer.gotoScene( "mainmenu" )
end

function scene:create( event )
	local sceneGroup = self.view
	
	settingsText = display.newText("Settings", display.contentCenterX, display.contentCenterY - 200, "Arial", 50)
	gridSizeText = display.newText("Grid Size:", display.contentCenterX, display.contentCenterY - 50, "Arial", 25)
	gridSizeIntText = display.newText(""..gridSizeInt, display.contentCenterX, display.contentCenterY, "Arial", 20)
	
	sceneGroup:insert(gridSizeText)
	sceneGroup:insert(gridSizeIntText)
	sceneGroup:insert(settingsText)
end

function scene:show( event )
	local sceneGroup = self.view
	
	buttonBack = widget.newButton(
		{
			label = "Back",
			onRelease = handleBack,
			emboss = false,
			-- Properties for a rounded rectangle button
			shape = "roundedRect",
			x = display.contentCenterX - 100,
			y = display.contentCenterY + 250,
			width = 100,
			height = 35,
			cornerRadius = 2,
			fillColor = buttonFillColor,
			strokeColor = buttonStrokeFillColor,
			strokeWidth = 4
		}
		)
		
	gridSizePlus = widget.newButton(
		{
			label = "+",
			onRelease = handlePlus,
			emboss = false,
			-- Properties for a rounded rectangle button
			shape = "roundedRect",
			x = display.contentCenterX + 80,
			y = display.contentCenterY,
			width = 50,
			height = 50,
			cornerRadius = 2,
			fillColor = buttonFillColor,
			strokeColor = buttonStrokeFillColor,
			strokeWidth = 4
		}
		)
		
	gridSizeMinus = widget.newButton(
		{
			label = "-",
			onRelease = handleMinus,
			emboss = false,
			-- Properties for a rounded rectangle button
			shape = "roundedRect",
			x = display.contentCenterX - 80,
			y = display.contentCenterY,
			width = 50,
			height = 50,
			cornerRadius = 2,
			fillColor = buttonFillColor,
			strokeColor = buttonStrokeFillColor,
			strokeWidth = 4
		}
		)
		
	buttonApply = widget.newButton(
		{
			label = "Apply",
			onRelease = handleApply,
			emboss = false,
			-- Properties for a rounded rectangle button
			shape = "roundedRect",
			x = display.contentCenterX,
			y = display.contentCenterY + 100,
			width = 200,
			height = 50,
			cornerRadius = 2,
			fillColor = buttonFillColor,
			strokeColor = buttonStrokeFillColor,
			strokeWidth = 4
		}
		)	
		
		sceneGroup:insert(buttonBack)
		sceneGroup:insert(gridSizePlus)
		sceneGroup:insert(gridSizeMinus)
		sceneGroup:insert(buttonApply)
end

function scene:hide( event )
	local sceneGroup = self.view
end

function scene:destroy( event )
	local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene