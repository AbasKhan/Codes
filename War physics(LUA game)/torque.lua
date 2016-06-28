
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local widget = require( "widget" )
local controls=require("controls")


physics.start()
playvideo=true
physics.setGravity(10)
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
onearth=true



ecount  =0
fell1 =false
fell2 =false
alive  =  true
drag=false
guide=false




rock=nil
key2=nil
key=nil
cr=nil
cancel=nil
--cnl:addEventListener("touch",hide1)
info=nil
twenty=nil
fifty=nil
hnd=nil
onef=nil
forcebutton=nil
firebutton=nil
rect=nil
rect1=nil






function onDoubleTap( event )


if event.phase=="began" then
	if jumping==true  and onearth == false then

		action.DoubleJump()

    end


elseif event.phase=="ended" then
	 print("whaat")
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




function push(event)
if face =="right" and freeze == false then
psh.isVisible = true
elseif face == "left" and freeze == false then
psh1.isVisible = true
end

		--action.push()
		 if freeze == false then
	    	--timer.performWithDelay( 1000, revert )
			timer.performWithDelay( 1000, disappear )
		end
end






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




 function scene:createScene( event )
	local view = self.view
	game = display.newGroup()
	game.x = 0
    game.y=50
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
sky.x = 240; sky.y = 80

local sky2 = display.newImage( "store/background.png" )
sky2.x = 785; sky2.y = 80

local sky3 = display.newImage( "store/background.png" )
sky3.x = 1330; sky3.y = 80


local sky31 = display.newImage( "store/background.png" )
sky31.x = 1750; sky31.y = 80


local sky5 = display.newImageRect( "store/dark.png",500,200 )
sky5.x = 240; sky5.y = 400

local sky6 = display.newImageRect( "store/dark.png",500,200 )
sky6.x = 740; sky6.y = 400

local sky7 = display.newImageRect( "store/dark.png",500,200 )
sky7.x = 1240; sky7.y = 400

game:insert(sky3)
game:insert(sky31)
game:insert(sky2)
game:insert(sky)

game:insert(sky7)
game:insert(sky5)
game:insert(sky6)



rock=display.newImageRect( "store/10 n.png" ,10,10)
rock.x = 680; rock.y = 200
--rock.isVisible=false







	ground = display.newImage( "store/down ground.png" )
ground.x = 240; ground.y = 280

ground.myName="ground"
physics.addBody( ground, "static", { friction=0.5, bounce=0.3 } )




 ground1 = display.newImage( "store/down ground.png" )
ground1.x = 1000; ground1.y = 280
ground1.myName="ground"
physics.addBody( ground1, "static", { friction=0.5, bounce=0.3 } )

local ground5 = display.newImage( "store/down ground.png" )
ground5.x = 1400; ground5.y = 280
ground5.myName="ground"
physics.addBody( ground1, "static", { friction=0.5, bounce=0.3 } )


	scoreboard = display.newImageRect( "store/score board.png",100,100 )
	scoreboard.x = 280; scoreboard.y = 50
	scoreboard:scale(0.8,0.6)









ground2 = display.newImageRect( "store/platform.png" ,205,50)
ground2.x = 620; ground2.y = 10
ground2.myName="ground"
ground2.pos="platform"
physics.addBody( ground2, "static", { friction=0.5, bounce=0.3 } )

local ground4 = display.newImage( "store/nail.png" )
ground4.x = 600; ground4.y = 260


game:insert(ground4)

game:insert(ground2)
game:insert(ground1)
game:insert(ground)
game:insert(ground5)




 road = display.newImage( "store/road.png" )
road.x = 240; road.y = 215
distance = 2

 road2 = display.newImage( "store/road.png" )
road2.x = 1000; road2.y = 215

local road3 = display.newImage( "store/road.png" )
road3.x = 1800; road3.y = 215

local road4 = display.newImage( "store/road.png" )
road4.x = 1400; road4.y = 215

game:insert(road3)
game:insert(road)
game:insert(road2)
game:insert(road4)


btn2 = display.newImage("store/button 3.png")
btn2.x=530
btn2.y=200

--btn.isVisible=false
btn2.myName="scd"
physics.addBody( btn2, "kinematic",{ friction=2.0, bounce=0 } )
game:insert(btn2)






btn = display.newImageRect("store/button 2.png",60,150)
btn.x=830
btn.y=125
--btn.isVisible=false
physics.addBody( btn, "kinematic",{ isSensor=true , friction=0, bounce=0 } )
game:insert(btn)


key2 = display.newImageRect("store/key.png",80,80)
key2.x=550
key2.y=200


keyshape2= { 0,-35, 50,-25, -36,45, -40,15 }
key2:rotate(250)
--btn.isVisible=false
physics.addBody( key2, "kinematic",{ isSensor=true , friction=0, bounce=0 ,shape=keyshape2 } )
game:insert(key2)



key = display.newImageRect("store/key.png",80,80)
key.x=810
key.y=160


keyshape= { 0,-35, 50,-25, -36,45, -60,15 }
key:rotate(90)
--btn.isVisible=false
physics.addBody( key, "kinematic",{ isSensor=true , friction=0, bounce=0 ,shape=keyshape } )
game:insert(key)








startwall = display.newImage("store/img.png")
startwall .x=-5
startwall .y=180
startwall.isSensor = true
startwall.myName="wall"
physics.addBody( startwall,"static",{density=3.0, friction=0.5, bounce=0.3 } )

wall = display.newImageRect("store/img.png",100,120)
wall .x=1055
wall .y=180
wall.isSensor = true
wall.myName="wallend"
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
cr.yScale=1

Shape = { -11,-51, 11,-51, 11,51, -11,51 }

physics.addBody( cr,"dynamic", { density=30.0, friction=0.5 ,shape=Shape } )

game:insert(cr)


--local sheet = graphics.newImageSheet( "1.png", { width=110, height=120, numFrames=15,sheetContentWidth = 450,  sheetContentHeight = 500} )
--enemy = display.newSprite( sheet, { name="redman", start=1, count=15, time=750 ,loopCount = 1 } )








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

target1 = display.newImageRect('store/target.png',70,70)

target1.myName="target1"
physics.addBody( target1,"dynamic", { density=10.0, friction=0.5 ,radius= 30 } )
game:insert(target1)








box = display.newImageRect( "store/msg.png",200,100 )
box.x=cr.x+10
box.y=cr.y
box.isVisible=false

game:insert(box)

string="Objects can be moved by applying force"

text= display.newText(string, 0,0,150,50, "Comic Sans MS", 12);

text.x=box.x + 200
text.y=cr.y -50
text.isVisible=false
--msg.isVisible=false
game:insert(text)



scoretext=display.newText(score.."n", 0,0, nil, 10)

scoretext.x=280
scoretext.y=55
scoretext:setTextColor(0,0,0)










myJoints={}
 link = {}
 link1 = {}


local removeBody = function( event )
if event.other.myName=="bullet" then
 	local t = event.target
	local phase = event.phase
	--print (t)

	if "began" == phase  then
		t:removeSelf() -- destroy object

	end

end
	return true
end


function fall()

	transition.to(ground2,{time=5000 ,y=205})
end


--chain = display.newImage("link.png")










controls.GetControls()





for i = 1,1 do

	for j = 1,8 do
		if(j==8)then
		link1[j] = target1

		else
		link1[j] = display.newImageRect( "store/link.png",7,17)
		game:insert(link1[j])
		end
		link1[j].x = 270 + (i*278)
		link1[j].y = 20 + (j*17)
		physics.addBody( link1[j], { density=25.0, friction=0, bounce=0 } )
		if(j<8) then
		link1[j]:addEventListener( "collision", removeBody )
		end
		-- Create joints between links
		if (j > 1) then
			prevLink = link1[j-1] -- each link is joined with the one above it
		else
			prevLink = ground2-- top link is joined to overhanging beam
		end

		myJoints[#myJoints + 1] = physics.newJoint( "pivot", prevLink, link1[j], 270 + (i*278), 16 + (j*17) )

	end
end


for i = 1,1 do

	for j = 1,10 do
		if(j==10)then
		link[j] = target1
		else
		link[j] = display.newImageRect( "store/link.png",7,17)
		game:insert(link[j])
		end
		link[j].x = 240 + (i*460)
		link[j].y = 20 + (j*17)
		physics.addBody( link[j], { density=35.0, friction=0, bounce=0 } )

		-- Create joints between links
		if (j > 1) then
			prevLink = link[j-1] -- each link is joined with the one above it
		else
			prevLink = ground2-- top link is joined to overhanging beam
		end

		myJoints[#myJoints + 1] = physics.newJoint( "pivot", prevLink, link[j], 240 + (i*460), 16 + (j*17) )

	end
end



physics.addBody( rock, "static", { isSensor=true,friction=0.5 } )
game:insert(rock)


local inertia = display.newImageRect( "store/inertia.png",80,30 )
inertia.x = rock.x + 20; inertia.y = rock.y
inertia.isVisible=false
game:insert(inertia)


view:insert(game)



info = display.newImage("store/instruct.png")
info.x=300
info.y=100
info.isVisible=false
--game:insert(info)


string="Objects can be moved by applying force"

text= display.newText(string, 0,0, "Comic Sans MS", 12);

text.x= 200
text.y=150
text.isVisible=false

view:insert(game)



function stop()
pressed=false
pressed2=false
cr:setLinearVelocity( 0, 0)
end









function GoRight(event)

--print(onearth)
if freeze == false and onearth== true then
cr:play()

cr:setLinearVelocity( 120, 90)
end
end

function GoLeft(event)
if freeze == false and onearth== true  then
cr:play()

cr:setLinearVelocity( -120, 90)
end
end





function t(event)
if event.phase=="began" then
face="right"

cr:setSequence( "man" )
event.target=right
display.getCurrentStage():setFocus(right)
Runtime:addEventListener("enterFrame", GoRight)


elseif event.phase=="moved" then

Runtime:removeEventListener("enterFrame", GoRight)

 display.getCurrentStage():setFocus( nil )


elseif event.phase=="ended" then

Runtime:removeEventListener("enterFrame", GoRight)
 display.getCurrentStage():setFocus( nil )
end

end



function t2(event)


if event.phase=="began"   then
face="left"
cr:setSequence( "man2" )
Runtime:addEventListener("enterFrame", GoLeft)




elseif event.phase=="moved" then
Runtime:removeEventListener("enterFrame", GoLeft)



elseif event.phase=="ended" then

Runtime:removeEventListener("enterFrame", GoLeft)

end

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

if event.object2.myName =="ebullet" and event.object1.myName=="ground"   then

timer.performWithDelay( 100, liquid )
end




if event.object2.myName =="ebullet" and event.object1.myName=="green man"  then

timer.performWithDelay( 50, liquid )
end




if event.object2.myName =="bullet" and event.object1.myName=="ground"  then

timer.performWithDelay( 100, liquid1 )
end


if event.object2.myName =="bullet" and event.object1.myName=="scd"  then

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
--cancel.isVisible=true
text.isVisible=true

--timer.performWithDelay( 5000, hidebox )
end













function mv()


--print(onearth)

--game.x=game.x - 2
--print(game.x)
if (cr.x > 80 and cr.x < 1100) then
		game.x = (-cr.x + 80)/1.75

	end



scoretext.text=score.."  newtons"





if target1.x - 270 < cr.x and switchint==false then
text.text="I wonder if i could move this switch ...hmm"
switchint=true
info.isVisible=true
tell()
end


psh.x=cr.x + 45
psh.y=cr.y - 20

psh1.x=cr.x - 55
psh1.y=cr.y - 20






cr.isFixedRotation = true

--action.runtimeActions()


end

function rot()
key:rotate(30)
key2:rotate(-30)

--transition.to(btn,{y = btn.y - 80})
--transition.to(key,{x=key.x +10 , y = key.y - 90})
key.isSensor=true
btn.isSensor=true
--fall()
end


function rot2()
btn2.isSensor=true
key2:rotate(-30)
key2.isSensor=true
--transition.to(btn2,{time = 1800 ,x=btn2.x+20 ,y = btn2.y + 80})
--transition.to(key2,{x = key2.x - 20})

fall()

end

fixer=0
once=0

once2=0
function spin(event)
if event.other.myName=="target1" then
	fixer=fixer + 1
	if once == 0 then
	once=once+1
	print("it spun")
	timer.performWithDelay( 100, rot )
	end

end
end




function spin2(event)
if event.other.myName=="target1" then

	if once2 == 0 then
	once2=once2+1
	print("it spun")
	timer.performWithDelay( 100, rot2 )
	end

end
end



function coll(event)

if event.phase=="began" then
	if event.other.myName=="ground" or event.other.myName=="crate" or event.other.myName=="rock"then

		onearth=true
	end
	if event.other.myName=="wallend" then

	storyboard.gotoScene("storyboard 2.game1",sceneChangeEffect, sceneChangeTime)
	end
end
end


function revert()
inertia.isVisible=false
physics.start()
freeze=false
end



hit=0
function inert(event)
	if event.other.myName=="target1" then
		hit=hit+1
		if hit == 3  then
		physics.pause()
		freeze=true
		inertia.isVisible=true
		timer.performWithDelay( 4000, revert )
		print("inertia")
		end
		if hit > 3 then
			inertia.isVisible=true
			timer.performWithDelay( 1000, revert )
		end



	end
end


rock:addEventListener("collision",inert)
key2:addEventListener("collision",spin2)
key:addEventListener("collision",spin)
cr:addEventListener("collision",coll)





--Runtime:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )

info:addEventListener("tap",hide)

--Runtime:addEventListener( "enterFrame", intro ))
Runtime:addEventListener("preCollision",precoll)

end

function scene:enterScene(event)
storyboard.purgeScene( "menu" )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
rock:removeEventListener("collision",inert)
key2:removeEventListener("collision",spin2)
--key:removeEventListener("collision",spin)

info:removeEventListener("tap",hide)
cr:removeEventListener("collision",coll)

--cnl:addEventListener("touch",hide1)
info:removeEventListener("touch",tell)


Runtime:removeEventListener("enterFrame", GoRight)
Runtime:removeEventListener("enterFrame", GoLeft)

--Runtime:addEventListener("collision",coll)
Runtime:removeEventListener( "enterFrame", mv )


--Runtime:addEventListener( "enterFrame", intro )
jump:removeEventListener( "touch",onDoubleTap )

controls.KillControls()
controls.hideControls()

scoreboard:removeSelf()
scoretext:removeSelf()

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
