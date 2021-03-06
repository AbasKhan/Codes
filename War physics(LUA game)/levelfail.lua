local storyboard = require( "storyboard" )
local physics= require("physics")
local controls = require( "controls" )
local scene = storyboard.newScene()


--display ojects variables
local sg = {} --screen group of the scene
local textSize = 30 --size of the menu text
local menuItemDist = 40 --distance between items of menu
local textColor = 255 --text color of menu

local sceneChangeEffect = "fade"
local sceneChangeTime = 200

--display Objects
local playText
local optionsItem



function nextstage(event)
storyboard.gotoScene("force",sceneChangeEffect, sceneChangeTime)

end


function replay(event)
storyboard.gotoScene(saved,sceneChangeEffect, sceneChangeTime)

end

function backmenu(event)

	storyboard.gotoScene("menu",sceneChangeEffect, sceneChangeTime)


end

function scene:createScene( event )


	sg = self.view --set screen group to scene's display group

	bck = display.newImageRect("store/score screen.png",480,270)
	bck.x=240
	bck.y=160
	sg:insert(bck)

	local path = system.pathForFile( "current_stage.txt" )

	local file = io.open( path, "r" )
	saved = file:read( "*a" )

	io.close( file )
	file = nil




	clear= display.newImage("store/fail.png")
	clear.x=250
	clear.y=100
	clear.xScale=.5
	clear.yScale=.5
	sg:insert(clear)



		pause = display.newGroup()

	bck = display.newImageRect("store/score screen.png",500,300)
	bck.x=2150
	bck.y=160
	pause:insert(bck)

	btm = display.newImageRect( "store/back to menu.png",60,60)
	btm.y=220
	btm.x=200

	pause:insert(btm)
	rst = display.newImageRect( "store/replay.png",60,60)
	rst.y=220
	rst.x=250
pause:insert(rst)



rst:addEventListener("touch",replay)


btm:addEventListener("touch",backmenu)
	sg:insert(pause)

--pause.isVisible=false





end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	storyboard.removeAll()
--	controls.hideControls()
	storyboard.state.score = 0

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )


end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	-----------------------------------------------------------------------------

	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)

	-----------------------------------------------------------------------------

end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene

