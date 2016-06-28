
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "storyboard 2.Act" )
local widget = require( "widget" )
local controls= require("storyboard 2.cont")


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

rect=nil
rect1=nil




 function scene:createScene( event )
	--local game = self.view


end

function scene:enterScene(event)
storyboard.purgeScene( "game" )


	local view = self.view
	local game = display.newGroup()
	game.x = 0
   -- game.y=20
    game:scale(0.7,0.7)


	local sky = display.newImage( "store/background.png" )
sky.x = 240; sky.y = 230

local sky2 = display.newImage( "store/background.png" )
sky2.x = 785; sky2.y = 230

local sky3 = display.newImage( "store/background.png" )
sky3.x = 1330; sky3.y = 230




game:insert(sky3)
game:insert(sky2)
game:insert(sky)





ground = display.newImage( "store/down ground.png" )
ground.x = 240; ground.y = 400

ground.myName="ground"
physics.addBody( ground, "static", { friction=0.5, bounce=0.3 } )


 ground1 = display.newImage( "store/down ground.png" )
ground1.x = 780; ground1.y = 400
ground1.myName="ground"
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
game:insert(ground)
game:insert(ground5)





local scoreboard = display.newImageRect( "store/score board.png",180,30 )
scoreboard.x = 280; scoreboard.y = 40


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





forceBar = display.newGroup()

point = display.newImageRect( "store/33.png",36,18)
point.x = 80; point.y = 60
forceBar:insert(point)

twenty = display.newImage("store/20 n.png")
twenty .x=80
twenty .y=60
twenty.isSensor = true
forceBar:insert(twenty)


physics.addBody( twenty,"kinematic",{ isSensor = true,density=3.0, friction=0.5, bounce=0.3 } )

fifty = display.newImage("store/50 n.png")
fifty .x=110
fifty .y=60
fifty.isSensor = true
physics.addBody( fifty,"kinematic",{ isSensor = true,density=3.0, friction=0.5, bounce=0.3 } )
forceBar:insert(fifty)


hnd = display.newImage("store/100 n.png")
hnd .x=140
hnd .y=60
hnd.isSensor = true
physics.addBody( hnd,"kinematic",{ isSensor = true,density=3.0, friction=0.5, bounce=0.3 } )
forceBar:insert(hnd)


onef = display.newImage("store/150 n.png")
onef .x=174
onef .y=60
onef.isSensor = true
physics.addBody( onef,"kinematic",{isSensor = true, density=3.0, friction=0.5, bounce=0.3 } )

forceBar:insert(onef)

startwall = display.newImage("store/img.png")
startwall .x=-5
startwall .y=180
startwall.isSensor = true
startwall.myName="wall"
physics.addBody( startwall,"static",{density=3.0, friction=0.5, bounce=0.3 } )

wall = display.newImage("store/img.png")
wall .x=1055
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


enemy = display.newImageRect( "store/knight.png",100,100)
enemy.myName="red man"


game:insert(enemy)


enemy.x = 280; enemy.y = 180;
physics.addBody( enemy,"dynamic", { density=3.0, friction=0.5 ,shape=Shape} )

c1 = display.newImageRect( "store/down ground.png",400,9)
c1.x = 285
c1.y = 358
c1.myName="c1"
physics.addBody( c1,"kinematic",{ density=500000.0, friction=0.5, bounce=0.3 } )
c1.isBullet=true
--c1.isVisible=false


game:insert(c1)


ct=display.newImage("store/40 kg.png")
ct.y=150
ct.x=200
ct.myName="crate"
physics.addBody( ct, "dynamic", { density=100000.0,friction=0.5, bounce=0.3 } )


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

target1 = display.newImageRect('store/target.png',60,60)

--target1.myName="target1"
physics.addBody( target1,"dynamic", { density=15.0, friction=0.5 ,radius= 30 } )
game:insert(target1)







scoretext=display.newText(score.."newtons", 0,0, nil, 10)

scoretext.x=280
scoretext.y=40










info = display.newImage("store/instruct.png")
info.x=300
info.y=100
info.isVisible=false

string="Objects can be moved by applying force"


text= display.newText(string, 0,0, 200, 0,"Comic Sans MS", 12);

text.x= 200
text.y=150
text.isVisible=false




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
		target1:applyLinearImpulse(130,20,target1.x,target1.y)

	end

end
	return true
end



local removeBody1 = function( event )
if event.other.myName=="bullet" then
 	local t = event.target
	local phase = event.phase


	if "began" == phase then
		t:removeSelf() -- destroy object


	end
	end
	return true
end

--chain = display.newImage("link.png")




for i = 1,1 do

	for j = 1,11 do
		if(j==11)then
		link1[j] = target1

		else
		link1[j] = display.newImageRect( "store/link.png",7,17)
		game:insert(link1[j])
		end
		link1[j].x = 270 + (i*278)
		link1[j].y = 80 + (j*17)
		physics.addBody( link1[j], { density=25.0, friction=0, bounce=0 } )
		if(j<11) then
		link1[j]:addEventListener( "collision", removeBody )
		end
		-- Create joints between links
		if (j > 1) then
			prevLink = link1[j-1] -- each link is joined with the one above it
		else
			prevLink = hk-- top link is joined to overhanging beam
		end

		myJoints[#myJoints + 1] = physics.newJoint( "pivot", prevLink, link1[j], 270 + (i*278), 76 + (j*17) )

	end
end


for i = 1,1 do

	for j = 1,12 do
		if(j==12)then
		link[j] = target1
		else
		link[j] = display.newImageRect( "store/link.png",7,17)
		game:insert(link[j])
		end
		link[j].x = 240 + (i*478)
		link[j].y = 80 + (j*17)
		physics.addBody( link[j], { density=15.0, friction=0, bounce=0 } )

		-- Create joints between links
		if (j > 1) then
			prevLink = link[j-1] -- each link is joined with the one above it
		else
			prevLink = hk1-- top link is joined to overhanging beam
		end

		myJoints[#myJoints + 1] = physics.newJoint( "pivot", prevLink, link[j], 240 + (i*478), 76 + (j*17) )

	end
end






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




right = display.newImageRect( "store/right.png",50,50)
right.y=265
right.x=75





firebutton = display.newImageRect( "store/fire.png",50,50)
firebutton.y=60
firebutton.x=445


left = display.newImageRect( "store/left.png",50,50)
left.y=275
left.x=25

jump = display.newImageRect( "store/jump.png",50,50)
jump.y=230
jump.x=40




forcebutton = display.newImageRect( "store/force.png",50,50)
forcebutton.y=60
forcebutton.x=40

view:insert(game)



function stop()
pressed=false
pressed2=false
cr:setLinearVelocity( 0, 0)
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

if event.other.myName == "c1" or event.other.myName == "crate" and alive ==true then

timer.performWithDelay( 800, shootback  )
end


if event.other.myName == "green man" or event.other.myName == "c1"  then
if guide == false then
physics.pause()
freeze=true
info.isVisible=true
tell()
end
end

end





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

function vanish()

bullet:removeSelf()
counter=0
end


function chx()
chk = chk + 1
end


function shootback()

	 if cnt == chk and alive== true then

        ebullet = display.newImage('store/knife.png')
   		game:insert(ebullet)
		action.shootBack()
	 end
end



function revert()
accel.isVisible=false
accel1.isVisible=false
end

function disappear()
psh.isVisible=false
psh1.isVisible=false
end


function push(event)
if face =="right" and freeze == false then
psh.isVisible = true
elseif face == "left" and freeze == false then
psh1.isVisible = true
end

		action.push()
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


function kill(event)
if event.other.myName == "bullet" then
enemy:removeSelf()
alive  =  false

end

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

if event.object2.myName =="ebullet" and event.object1.myName=="c1"  then

timer.performWithDelay( 50, liquid )
end


if event.object2.myName =="ebullet" and event.object1.myName=="green man"  then

timer.performWithDelay( 50, liquid )
end


if event.object2.myName =="bullet" and event.object1.myName=="c1"   then

timer.performWithDelay( 50, liquid1 )
end



if event.object2.myName =="bullet" and event.object1.myName=="ground"  then

timer.performWithDelay( 100, liquid1 )
end


if event.object2.myName =="ebullet" and event.object1.myName=="crate"   then
timer.performWithDelay( 100, liquid )
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






function tell()
controls.hideControls()
guide = true
--box.isVisible=true
text.isVisible=true

--timer.performWithDelay( 5000, hidebox )
end




function mv()

--game.x=game.x - 2
--print(game.x)
if (cr.x > 80 and cr.x < 1100) then
		game.x = (-cr.x + 80)/1.5

	end

scoretext.text=score.."  newtons"






if target1.x - 120 < cr.x and switchint==false then
text.text="A knife wont turn this switch on ...hmm"
switchint=true
info.isVisible=true
tell()
end

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
enemy.isFixedRotation = true
--action.runtimeActions()


end








enemy:addEventListener("collision",kill)
--cnl:addEventListener("touch",hide1)
info:addEventListener("tap",hide)
twenty:addEventListener("touch",applytw)
fifty:addEventListener("touch",applyf)
hnd:addEventListener("touch",applyh)
onef:addEventListener("touch",applyonef)

forcebutton:addEventListener("touch",push)
firebutton:addEventListener("touch",shoot)
cr:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )
right:addEventListener("touch",t)
left:addEventListener("touch",t2)

--Runtime:addEventListener( "enterFrame", intro )

jump:addEventListener( "touch",onDoubleTap )
Runtime:addEventListener("preCollision",precoll)

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
