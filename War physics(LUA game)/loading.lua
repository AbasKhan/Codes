
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()



 
 
 
 function scene:createScene( event )
	local game = self.view
	--local game = display.newGroup()
	game.x = 0
	
	h=display.viewableContentWidth
w=display.viewableContentHeight 

local img=display.newImageRect("store/loading.png",h,w)
img.x=240
img.y=160
game:insert(img)

local force=display.newImageRect("store/force.png",40,40)
force.x=80
force.y=245

game:insert(force)

string="With               Button you can apply force"

text= display.newText(string, 0,0, "Comic Sans MS", 14);
text.x=150
text.y=250

game:insert(text)

local ld1=display.newImageRect("store/loading box.png",31,31)
ld1.x=365
ld1.y=267

ld1.isVisible=false

game:insert(ld1)


local ld2=display.newImageRect("store/loading box.png",31,31)
ld2.x=405
ld2.y=267

ld2.isVisible=false

game:insert(ld2)

local ld3=display.newImageRect("store/loading box.png",31,31)
ld3.x=444
ld3.y=267

ld3.isVisible=false

game:insert(ld3)

function reset()
ld1.isVisible=false
ld2.isVisible=false
ld3.isVisible=false

storyboard.gotoScene("game","fade",100)
end


function three()
ld3.isVisible=true
timer.performWithDelay( 1000, reset)
end



function two()
ld2.isVisible=true
timer.performWithDelay( 1500, three)
end



function one()
ld1.isVisible=true
timer.performWithDelay( 1500, two)
end

timer.performWithDelay( 1500, one)


end

function scene:enterScene(event)
--storyboard.purgeScene( "menu" )
	
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