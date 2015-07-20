
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local controls= require("controls")
local widget = require( "widget" )
local build	 = require("htp.MakeStage1H")


physics.start()
playvideo=true
physics.setGravity(10)
local scene = storyboard.newScene()




 function scene:createScene( event )


	storyboard.removeAll()
	local view = self.view






local path = system.pathForFile( "current_stage.txt" )

local file = io.open( path, "r" )
local saved = file:read( "*a" )

io.close( file )
file = nil




view:insert(game)






function reset()

storyboard.gotoScene(saved,"fade",100)
end


function three()

timer.performWithDelay( 50, reset)
end



function two()

timer.performWithDelay( 50, three)
end



function one()

timer.performWithDelay( 50, two)
end

one()









end

function scene:enterScene(event)
storyboard.removeAll()

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )



end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )

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
