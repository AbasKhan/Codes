
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local controls= require("controls")
local widget = require( "widget" )


physics.start()
playvideo=true
physics.setGravity(10)
local scene = storyboard.newScene()




 function scene:createScene( event )


	storyboard.removeAll()
	local view = self.view

	game = display.newGroup()
	game.x = 0
    game.y=46
    game:scale(0.55,0.55)

local img=display.newImageRect("store/loading.png",900,500)
img.x=430
img.y=205
game:insert(img)








local sheet8 = graphics.newImageSheet( "store/pressure.png", {  width=224, height=156, numFrames=6} )

local sequenceData = { sheet=sheet8 ,name="man",start=1,count=6 ,time=1000 ,loopCount = 1 }

pen = display.newSprite( sheet8, sequenceData )

pen.x = 380; pen.y = 250;
pen:play()
pen:scale(1.7,1.7)
game:insert(pen)






local tray=display.newImage("store/homake.png")
tray.x=380
tray.y=50
tray:scale(1,1)
game:insert(tray)

string="pressure buttons can open puzzles"



local hint=display.newImageRect("store/hint.png",40,40)
hint.x=150
hint.y=425
game:insert(hint)

text= display.newText(string, 0,0, "Comic Sans MS", 12);
text.x=380
text.y=420
text:scale(2,2)
game:insert(text)

string1="Pressure is the force per unit area"

text1= display.newText(string1, 0,0, "Comic Sans MS", 12);
text1.x=400
text1.y=50
text1:scale(2,2)
game:insert(text1)





local ld1=display.newImageRect("store/loading box.png",31,31)
ld1.x=660
ld1.y=405
ld1:scale(2,2)
ld1.isVisible=false

game:insert(ld1)


local ld2=display.newImageRect("store/loading box.png",31,31)
ld2.x=740
ld2.y=405
ld2:scale(2,2)
ld2.isVisible=false

game:insert(ld2)

local ld3=display.newImageRect("store/loading box.png",31,31)
ld3.x=815
ld3.y=405
ld3:scale(2,2)
ld3.isVisible=false

game:insert(ld3)

function reset()
ld1.isVisible=false
ld2.isVisible=false
ld3.isVisible=false

storyboard.gotoScene("press","fade",100)
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




view:insert(game)





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
