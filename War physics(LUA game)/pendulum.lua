
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








local sheet8 = graphics.newImageSheet( "store/30%.png", {  width=187, height=130, numFrames=10} )

local sequenceData = { sheet=sheet8 ,name="man",start=1,count=10 ,time=3500 ,loopCount = 1 }

pen = display.newSprite( sheet8, sequenceData )

pen.x = 380; pen.y = 250;
pen:play()
pen:scale(1.7,1.7)
game:insert(pen)


local sheet2 = graphics.newImageSheet( "store/right walk.png", {  width=88, height=136, numFrames=14} )

local sheet3 = graphics.newImageSheet( "store/left walk.png", { width=88, height=136 , numFrames=14} )


local sheet4 = graphics.newImageSheet( "store/right jump.png", { width=88, height=136 , numFrames=16} )

local sheet5 = graphics.newImageSheet( "store/left jump.png", { width=88, height=136 , numFrames=16} )

local sheet6 = graphics.newImageSheet( "store/right push.png", { width=88, height=136 , numFrames=14} )
local sequenceData = {
                { sheet=sheet2 ,name="man",  frames={10,11,12,13,14,13,12,11,10,9,8,7,6,5,4,3,2,1},time=1050 ,loopCount = 1 },
                {  sheet=sheet3,name="man2", frames={5,4,3,2,1,2,3,4,5,6,7,8,9,10,11,12,13,14},time=1050  ,loopCount = 1},
			    { sheet=sheet4 ,name="jump",  frames={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1},time=950 ,loopCount = 1 }
				,{ sheet=sheet5 ,name="jump2",frames={16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},time=950 ,loopCount = 1 }
                ,{  sheet=sheet6,name="push", frames={1,2,3,4,5,6,7,8,9,10,11,12,13,14,13,12,11,10,9,8,7,6,5,4,3,2,1},time=1050  ,loopCount = 1}
				}

cr = display.newSprite( sheet2, sequenceData )
cr:setSequence( "push" )
cr.myName="green man"
cr.x = 245; cr.y = 310;
cr.yScale=1

Shape = { -11,-51, 11,-51, 11,51, -11,51 }

physics.addBody( cr,"kinematic", { density=70.0, friction=0.5 ,shape=Shape } )

function pushit()
cr:play()
end


timer.performWithDelay(1000,pushit)
game:insert(cr)




local tray=display.newImage("store/homake.png")
tray.x=380
tray.y=50
tray:scale(1,1)
game:insert(tray)

string="Use torque wheels to solve puzzles"



local hint=display.newImageRect("store/hint.png",40,40)
hint.x=150
hint.y=420
game:insert(hint)

text= display.newText(string, 0,0, "Comic Sans MS", 12);
text.x=200
text.y=280

string1="Torque is the turning effect of a force"

text1= display.newText(string1, 0,0, "Comic Sans MS", 12);
text1.x=250
text1.y=70






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

storyboard.gotoScene("fall","fade",100)
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
text:removeSelf()
text1:removeSelf()


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
