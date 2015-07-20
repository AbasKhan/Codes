
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "storyboard 2.Act" )
local widget = require( "widget" )
local controls= require("controls")


physics.start()
playvideo=true
physics.setGravity(0,10)
local scene = storyboard.newScene()
--physics.setDrawMode( "hybrid" )

--function intro(event)
--	if playvideo==true then
-- media.playVideo ("animation.mp4")
-- 	playvideo=false
--	end
--	end

face ="right"

cnt =0
chk =0

score=0

switchint=false
freeze =false
jumping=false
power = 80000
pressed=false
pressed2=false
counter =0

ecount  =0
fell1 =false
fell2 =false
alive  =  true
drag=false
guide=false

onearth=true
lag=false

rect=nil
rect1=nil



local scoreboard
local scoretext
local light



function applytw(event)
	action.applytw()
end

function applyf(event)
	action.applyf()
end

function applyh(event)
	action.applyh()
end

function applyonef(event)
	action.applyonef()
end



function onDoubleTap( event )


if event.phase=="began" then

	if jumping==true  and onearth == false then

		action.DoubleJump()

    end


elseif event.phase=="ended" then

if cnt == chk then
   		--if event.yStart - event.y > 50 and onearth==true then

		onearth=false
		jumping=true


		action.jmp()
		if face=="right" then
		cr:setSequence( "jump" )
		elseif face=="left" then
		cr:setSequence( "jump2" )
		end
		cr:play()
		--end
		end
	end
end







function GoRight(event)
if freeze == false and onearth==true then
cr:play()

cr:setLinearVelocity( 120, 90)
end
end


function GoLeft(event)
if freeze == false and onearth==true then
cr:play()

cr:setLinearVelocity( -120, 90)
end
end


function t(event)
if event.phase=="began"  then
face="right"

cr:setSequence( "man" )

display.getCurrentStage():setFocus(right)
Runtime:addEventListener("enterFrame", GoRight)


elseif event.phase=="moved" then

display.getCurrentStage():setFocus(nil)
Runtime:removeEventListener("enterFrame", GoRight)



elseif event.phase=="ended" then
display.getCurrentStage():setFocus(nil)
Runtime:removeEventListener("enterFrame", GoRight)

end

end



function t2(event)


if event.phase=="began"    then
face="left"
cr:setSequence( "man2" )
display.getCurrentStage():setFocus(left)
Runtime:addEventListener("enterFrame", GoLeft)




elseif event.phase=="moved" then

Runtime:removeEventListener("enterFrame", GoLeft)
display.getCurrentStage():setFocus(nil)


elseif event.phase=="ended" then

Runtime:removeEventListener("enterFrame", GoLeft)
display.getCurrentStage():setFocus(nil)
end

end

function relag()
lag=false

end



function push(event)
if face =="right" and freeze == false then
psh.isVisible = true
elseif face == "left" and freeze == false then
psh1.isVisible = true
end


		--action.push()
	if cr.x > ct.x-100 and cr.x < ct.x  and freeze == false and lag==false then
	--cr:play()
		cr:setSequence( "push" )
        cr:play()

	score=score+(distance*10)
	--scoretext.text=score
	--accel.isVisible=true
--	text.text="Objects tend to resist change a concept known as inertia "

	drag=true

	ct:applyLinearImpulse( distance * 45000, 0, ct.x, ct.y )
		lag=true
		timer.performWithDelay( 500, relag )
		timer.performWithDelay( 1000, dieout )




	end

	   if freeze == false then
	    	--timer.performWithDelay( 1000, revert )
			timer.performWithDelay( 1000, disappear )
		end
end






 function scene:createScene( event )

local view = self.view
	local game = display.newGroup()
	game.x = 0
    game.y=-25
    game:scale(0.55,0.55)








	function shoot(event)

	   if (event.phase == 'began') then
	   		if counter == 1 then
			vanish()
			end
              bullet = display.newImage('store/knife.png')
			  game:insert(bullet)
			  action.shoot()


end
end






local sky = display.newImage( "store/background.png" )
sky.x = 240; sky.y = 230

local sky2 = display.newImage( "store/background.png" )
sky2.x = 785; sky2.y = 230

local sky3 = display.newImage( "store/background.png" )
sky3.x = 1330; sky3.y = 230




game:insert(sky3)
game:insert(sky2)
game:insert(sky)


local sky1 = display.newImageRect( "store/dark.png",500,200 )
sky1.x = 240; sky1.y = 480

local sky21 = display.newImageRect( "store/dark.png",500,200 )
sky21.x = 740; sky21.y = 480

local sky31 = display.newImageRect( "store/dark.png",500,200 )
sky31.x = 1200; sky31.y = 480




game:insert(sky31)
game:insert(sky21)
game:insert(sky1)





ground = display.newImageRect( "store/down ground.png",450,93 )
ground.x = 150; ground.y = 400
ground.isVisible=false
ground.myName="ground"
physics.addBody( ground, "static", { friction=0.5, bounce=0.3 } )



ground11 = display.newImageRect( "store/down ground.png",460,93 )
ground11.x = 230; ground11.y = 650
--ground11.isVisible=false
ground11.myName="ground"
physics.addBody( ground11, "static", { friction=0.5, bounce=0.3 } )



ground12 = display.newImageRect( "store/down ground.png",600,93 )
ground12.x = 840; ground12.y = 650
--ground11.isVisible=false
ground12.myName="ground"
physics.addBody( ground12, "static", { friction=0.5, bounce=0.3 } )


local strip = display.newImage("store/strip.png")
strip.x=150
strip.y=380

game:insert(strip)




local strip2 = display.newImage("store/strip.png")
strip2.x=710
strip2.y=380

game:insert(strip2)


 ground1 = display.newImage( "store/down ground.png" )
ground1.x = 830; ground1.y = 410
ground1.myName="ground"
--ground1.isVisible=false
physics.addBody( ground1, "static", { friction=0.5, bounce=0.3 } )

local ground5 = display.newImage( "store/down ground.png" )
ground5.x = 1400; ground5.y = 400
ground5.myName="ground"
physics.addBody( ground1, "static", { friction=0.5, bounce=0.3 } )


hk= display.newImageRect( "store/s.png" ,40,30)
hk.x = 540; hk.y = 100
hk.myName="ground"

physics.addBody( hk, "static", { friction=0.5, bounce=0.3 } )



hk1= display.newImageRect( "store/s.png" ,40,30)
hk1.x = 720; hk1.y = 100
hk1.myName="ground"

physics.addBody( hk1, "static", { friction=0.5, bounce=0.3 } )


game:insert(hk)
game:insert(hk1)
game:insert(ground1)
game:insert(ground11)
game:insert(ground12)
game:insert(ground)
game:insert(ground5)





scoreboard = display.newImageRect( "store/score board.png",100,100 )
scoreboard.x = 280; scoreboard.y = 50
scoreboard:scale(0.8,0.6)

--scoreboard.isVisible=false


 road = display.newImage( "store/road.png" )
road.x = 240; road.y = 345
distance = 2

 road2 = display.newImage( "store/road.png" )
road2.x = 780; road2.y = 345

local road3 = display.newImage( "store/road.png" )
road3.x = 1800; road3.y = 232

local road4 = display.newImage( "store/road.png" )
road4.x = 1400; road4.y = 345

game:insert(road3)
game:insert(road)
game:insert(road2)
game:insert(road4)


 road1 = display.newImage( "store/road.png" )
road1.x = 240; road1.y = 580


 road21 = display.newImage( "store/road.png" )
road21.x = 780; road21.y = 580

local road31 = display.newImage( "store/road.png" )
road31.x = 1800; road31.y = 580

local road41 = display.newImage( "store/road.png" )
road41.x = 1200; road41.y = 580

game:insert(road31)
game:insert(road1)
game:insert(road21)
game:insert(road41)





startwall = display.newImage("store/img.png")
startwall .x=-5
startwall .y=180
startwall.isSensor = true
startwall.myName="wall"
physics.addBody( startwall,"static",{density=3.0, friction=0.5, bounce=0.3 } )

wall = display.newImage("store/img.png")
wall .x=950
wall .y=180
wall.isSensor = true
wall.myName="wall"
physics.addBody( wall,"static",{density=3.0, friction=0.5, bounce=0.3 } )

game:insert(wall)

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
cr:setSequence( "man" )
cr.myName="green man"
cr.x = 20; cr.y = 180;

Shape = { -13,-51, 13,-51, 13,51, -13,51 }

physics.addBody( cr,"dynamic", { density=30.0, friction=0.5 ,shape=Shape} )

game:insert(cr)


--local sheet = graphics.newImageSheet( "1.png", { width=110, height=120, numFrames=15,sheetContentWidth = 450,  sheetContentHeight = 500} )
--enemy = display.newSprite( sheet, { name="redman", start=1, count=15, time=750 ,loopCount = 1 } )






ct=display.newImageRect("store/round.png",60,60)
ct.y=150
ct.x=200
ct.myName="crate"
physics.addBody( ct, "dynamic", { density=10000.0,friction=5, bounce=0.3, radius=30} )


game:insert(ct)





psh = display.newImageRect('store/lin force.png',40,25)

psh.isVisible = false

psh1 = display.newImageRect('store/lin force.png',40,25)
psh1.x=cr.x + 55
psh1.y=cr.y - 20
psh1.isVisible = false
psh1:rotate(180)
game:insert(psh1)
game:insert(psh)


xhape = { -20,-15, 20,-15, 20,15, -20,15 }







scoretext=display.newText(score.."n", 0,0, nil, 10)

scoretext.x=280
scoretext.y=55
scoretext:setTextColor(0,0,0)










info = display.newImage("store/instruct.png")
info.x=300
info.y=100
info.isVisible=false

string="Objects can be moved by applying force"


text= display.newText(string, 0,0, 200, 0,"Comic Sans MS", 12);

text.x= 200
text.y=150
text.isVisible=false









accel = display.newImageRect( "store/al.png",60,35)
accel.x = 240
accel.y = 215
game:insert(accel)
accel.isVisible=false

accel1 = display.newImageRect( "store/accel.png",50,25)
accel1.x = 240
accel1.y = 215
accel1:rotate(180)
game:insert(accel1)
accel1.isVisible=false

aero = display.newImage( "store/aero.png")
aero.y = 272
aero.x = 175
game:insert(aero)

aero2 = display.newImage( "store/aero.png")
aero2.x = 860
aero2.y = 275
--game:insert(aero2)



controls.GetControls()


light=display.newImageRect("store/light.png",200,5)
light.x=260
light.y=500
light:rotate(90)
game:insert(light)


wall1=display.newImageRect("store/cube.png",50,50)
wall1.x=260
wall1.y=400
wall1.myName="puzzle"
physics.addBody( wall1,"dynamic", { density=300.0, friction=0.5  } )
game:insert(wall1)
wall1.isBullet=true

wall2=display.newImageRect("store/cube.png",50,50)
wall2.x=260
wall2.y=460
wall2.myName="puzzle"
physics.addBody( wall2,"dynamic", { density=300.0, friction=0.5  } )
game:insert(wall2)
wall2.isBullet=true


wall3=display.newImageRect("store/cube.png",50,50)
wall3.x=260
wall3.y=480
wall3.myName="puzzle"
physics.addBody( wall3,"dynamic", { density=300.0, friction=0.5  } )
game:insert(wall3)
wall3.isBullet=true



view:insert(game)


points=display.newImageRect("store/30.png",50,30)
points.x=200
points.y=100
points.isVisible=false



function stop()
pressed=false
pressed2=false
cr:setLinearVelocity( 0, 0)
end




function hide(event)

--box.isVisible=false

if event.numTaps >= 2  then
info.isVisible=false
text.isVisible=false

psh.isVisible = false
psh1.isVisible = false
freeze=false

--physics.start()
controls.showControls()

physics.start()
freeze=false

end
end

function coll(event)

if event.phase=="began" then
	if event.other.myName=="ground" or event.other.myName=="crate" or event.other.myName=="rock"then

		onearth=true
	end
end




if event.other.myName == "green man"  then
if guide == false then
physics.pause()
freeze=true
info.isVisible=true
tell()
end
end

end






function vanish()

bullet:removeSelf()
counter=0
end


function chx()
chk = chk + 1
end





function revert()
accel.isVisible=false
accel1.isVisible=false
end

function disappear()
psh.isVisible=false
psh1.isVisible=false
end

















function smash(event)


if event.other.myName == "rock" then

timer.performWithDelay( 100, goup )

end

end




function precoll(event)


if event.object2.myName =="bullet" then

timer.performWithDelay( 50, liquid1 )
end



if event.object2.myName =="bullet" and event.object1.myName=="ground"  then

timer.performWithDelay( 100, liquid1 )
end




if event.object2.myName =="bullet" and event.object1.myName=="ground"   then
timer.performWithDelay( 100, liquid1 )
end


end



function liquid (event)
ebullet.isSensor=true

end


function liquid1 (event)
bullet.isSensor=true
end




tab = 0






function tell()
controls.hideControls()
guide = true
--box.isVisible=true
text.isVisible=true

--timer.performWithDelay( 5000, hidebox )
end



function hitwall(event)
if event.other.myName=="puzzle" then

	light.isVisible=false

	points.isVisible=true
	transition.to(points,{time=2000,y=-50})
	--timer.performWithDelay(4000,killthis)
end

end


function mv()

--game.x=game.x - 2
--print(game.x)
if (cr.x > 80 and cr.x < 250) then
		game.x = (-cr.x + 80)/1.75

	end

scoretext.text=score.."  newtons"





aero.isVisible=true
psh.x=cr.x + 45
psh.y=cr.y - 20

psh1.x=cr.x - 55
psh1.y=cr.y - 20

accel.x=ct.x + 55
accel.y=ct.y

accel1.x=ct.x - 25
accel1.y=ct.y


aero.x=ct.x



cr.isFixedRotation = true

--action.runtimeActions()


end








--cnl:addEventListener("touch",hide1)
info:addEventListener("tap",hide)

ct:addEventListener("collision",hitwall)
cr:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )


--Runtime:addEventListener( "enterFrame", intro )

Runtime:addEventListener("preCollision",precoll)

end

function scene:enterScene(event)





end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
--physics.stop()
cr:removeEventListener("collision",coll)
info:removeEventListener("touch",hide)
--cnl:addEventListener("touch",hide1)
--info:removeEventListener("touch",tell)
controls.KillControls()
controls.hideControls()
--light:removeSelf()

Runtime:removeEventListener("enterFrame", GoRight)
Runtime:removeEventListener("enterFrame", GoLeft)

--Runtime:addEventListener("collision",coll)
jump:removeEventListener( "touch",onDoubleTap )
Runtime:removeEventListener( "enterFrame", mv )


--Runtime:addEventListener( "enterFrame", intro )



Runtime:removeEventListener("preCollision",precoll)
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
