local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local titleText
local buttonStartGame
local buttonSettings

local buttonFillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} }
local buttonStrokeFillColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} }

local function handleStart( event )
	composer.gotoScene("gameScene")
end

local function handleSettings( event )
	composer.gotoScene("settingsScene")
end

function scene:create( event )
	local sceneGroup = self.view
	
	titleText = display.newText("Dots", display.contentCenterX, display.contentCenterY - 200, "Arial", 50)
	buttonStartGame = widget.newButton(
			{
				label = "Start Game",
				onRelease = handleStart,
				emboss = false,
				-- Properties for a rounded rectangle button
				shape = "roundedRect",
				x = display.contentCenterX,
				y = display.contentCenterY,
				width = 200,
				height = 50,
				cornerRadius = 2,
				fillColor = buttonFillColor,
				strokeColor = buttonStrokeFillColor,
				strokeWidth = 4
			}
			)
	buttonSettings = widget.newButton(
			{
				label = "Settings",
				onRelease = handleSettings,
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
				
			
	sceneGroup:insert(buttonStartGame)
	sceneGroup:insert(buttonSettings)
	sceneGroup:insert(titleText)	
end

function scene:show( event )	

	local sceneGroup = self.view
    local phase = event.phase
	

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

		
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
		if composer.getSceneName( "previous" ) == "gameScene" then
			composer.removeScene( "gameScene" )
			composer.removeScene( "dots" )
	end
		
    end
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
