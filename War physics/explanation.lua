

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

local img=display.newImageRect("store/box1.png",900,500)
img.x=430
img.y=205
game:insert(img)


local path = system.pathForFile( "current_detail.txt")

		local file = io.open( path, "r" )
		local stage = file:read( "*a" )

		io.close( file )

		--storyboard.gotoScene(stage,sceneChangeEffect,sceneChangeTime)

print(stage)


if stage=="vernier" then
string1="vernier Caliper"
string3="Slide the Vernier Scale to find the diameter of an Object"

pen = display.newImage("store/vernier1.png")
pen.x = 420; pen.y = 250;
--pen:play()
pen:scale(.8,.8)
game:insert(pen)

elseif stage=="gravity" then
string1="Gravity"
string3="Things fall back on earth becasue of earths gravity"

pen = display.newImage("store/grav.jpg")
pen.x = 420; pen.y = 250;
--pen:play()
pen:scale(1,.8)
game:insert(pen)

elseif stage=="inertia" then
string1="Inertia"
string3="A pendulum keeps moving due to inertia"

pen = display.newImage("store/inertia12.png")
pen.x = 420; pen.y = 230;
--pen:play()
pen:scale(1,.8)
game:insert(pen)

elseif stage=="potential" then
string1="Potential Energy"
string3="The higher the object is the more potential it has"

pen = display.newImage("store/pot.jpg")
pen.x = 430; pen.y = 230;
--pen:play()
pen:scale(1,.8)
game:insert(pen)

elseif stage=="pressure" then
string1="Pressure"
string3="Pressure is a ratio of force to area over which the force is distributed"

pen = display.newImage("store/press.jpg")
pen.x = 430; pen.y = 230;
--pen:play()
pen:scale(1,.8)
game:insert(pen)

elseif stage=="force" then
string1="Force"
string3="We apply force to move objects around"

pen = display.newImage("store/frc.jpg")
pen.x = 430; pen.y = 230;
--pen:play()
pen:scale(1,.8)
game:insert(pen)

end



local tomenu=display.newImage("store/bck1.png")
tomenu.x=820
tomenu.y=390
tomenu:scale(.75,.75)
game:insert(tomenu)



local tray=display.newImage("store/homake.png")
tray.x=380
tray.y=50
tray:scale(1,1)
game:insert(tray)





--string1="vernier Caliper"

text1= display.newText(string1, 0,0,"Comic Sans MS", 12);
text1.x=450
text1.y=50
text1:scale(1.8,1.8)
game:insert(text1)






text3= display.newText(string3, 0,0,250,0,"Comic Sans MS", 12);
text3.x=380
text3.y=400
text3:scale(1.6,1.6)
game:insert(text3)


local hint=display.newImageRect("store/hint.png",40,40)
hint.x=150
hint.y=400
game:insert(hint)




view:insert(game)


local function bdetail(event)
	if event.phase=="ended" then
		storyboard.purgeScene("explanation")
		storyboard.gotoScene("detail",sceneChangeEffect, sceneChangeTime)

	end

end



tomenu:addEventListener("touch",bdetail)

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
