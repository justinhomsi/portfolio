local composer = require( "composer" )
local scene = composer.newScene()

local myTimer
local loadingText

function scene:create( event )
	local sceneGroup = self.view
	
end

function scene:show( event )
	local sceneGroup = self.view
	
	loadingText = display.newText("Loading..", display.contentCenterX, display.contentCenterY, "Arial", 20)
	sceneGroup:insert( loadingText )

end

local goToMenu = function()
	composer.gotoScene( "mainmenu", zoomOutInFadeRotate, 500)
end

myTimer = timer.performWithDelay( 1000, goToMenu, 1 )

function scene:hide()
	if myTimer then timer.cancel( myTimer ); end
	
end

function scene:destroy( event )

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene