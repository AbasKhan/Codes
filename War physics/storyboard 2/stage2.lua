
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local controls= require("controls")
local widget = require( "widget" )
local build	 = require("MakeStage2")


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
chk =-1
score=0

first=0

lag=false
forceBar=nil
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

stage_Count=0


accel=nil
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
shoot_count=0



local scoreboard
local scoretext






lift_start=0


function push(event)

if face =="right" and freeze == false then
psh.isVisible = true
elseif face == "left" and freeze == false then
psh1.isVisible = true
end

if cr.x >trq.x-50 and cr.x<trq.x and lift_start==0  then
	trq:rotate(-30)
	lift_start=1
	transition.to(spike,{y=spike.y-100})

	end

 if freeze == false then
	    	--timer.performWithDelay( 1000, revert )
			timer.performWithDelay( 1000, disappear )
		end

		--action.push()

end


function shoot(event)

	   if (event.phase == 'began') then
	   		if counter == 1 then
			vanish()
			end
             --
			             --
		 if shoot_count<3 then



			 bullet = display.newImageRect('store/axe.png',80,80)
			 bullet:rotate(-30)
			 bullet.myName="bullet"
			  game:insert(bullet)
			  action.shoot()

			  shoot_count=shoot_count+1

				if shoot_count==1 then
				s_count:setSequence("1")
				s_count:play()
				end

				if shoot_count==2 then
				s_count:setSequence("2")
				s_count:play()
				end

				if shoot_count==3 then
				s_count:setSequence("3")
				s_count:play()
				end





			end


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




function onDoubleTap( event )

if event.phase=="began" then
	if jumping==true  and onearth == false then

		action.DoubleJump()

    end

elseif event.phase=="ended" then
	 print("whaat")
if onearth==true then
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






















 function scene:createScene( event )
	local view = self.view
	game = display.newGroup()
	game.x = 0
    game.y=-30
    game:scale(0.55,0.55)

startwall = display.newImage("store/img.png")
startwall .x=-5
startwall .y=180

startwall.myName="wall"
physics.addBody( startwall,"static",{density=3.0, friction=0.5, bounce=0.3 } )

	build.group(game)

	build.SetBackgrounds()

	build.SetGrounds()

	build.GetRoads()

	--build.GetPuzzles()

    controls.GetControls()



scoreboard = display.newImageRect( "store/score board.png",100,100 )
scoreboard.x = 280; scoreboard.y = 50
scoreboard:scale(0.8,0.6)


local current_stage = "storyboard 2.stage2"

local path = system.pathForFile( "current_stage.txt" )

local file = io.open( path, "w" )
file:write( current_stage )

io.close( file )
file = nil




slide1=display.newImageRect("store/tile.png",195,20)
slide1.x=550
slide1.y=565
game:insert(slide1)


slide2=display.newImageRect("store/tile.png",195,20)
slide2.x=720
slide2.y=565
game:insert(slide2)

stand1=display.newImage("store/stand.png")
stand1.x=930
stand1.y=500
stand1:scale(1,1)
game:insert(stand1)


trq=display.newImageRect("store/trq.png",80,80)
trq.x=930
trq.y=500
game:insert(trq)


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


local sht = graphics.newImageSheet( "store/numbr sheet.png", {  width=50, height=48, numFrames=4} )
local sequenceData = {{sheet=sht ,name="1",  frames={1,2},time=200,loopCount=1},{sheet=sht ,name="2",  frames={2,3},time=200,loopCount=1},{sheet=sht ,name="3",  frames={3,4},time=200,loopCount=1}}
s_count=display.newSprite( sht, sequenceData )
s_count:setSequence( "1" )

s_count.x = 400; s_count.y = 50;
s_count:scale(.7,.7)
--game:insert(s_count)

--local sheet = graphics.newImageSheet( "1.png", { width=110, height=120, numFrames=15,sheetContentWidth = 450,  sheetContentHeight = 500} )
--enemy = display.newSprite( sheet, { name="redman", start=1, count=15, time=750 ,loopCount = 1 } )



spike1=display.newImageRect("store/trap.png",60,60)
spike1.x=450
spike1.y=450
spike1.myName="spike"
physics.addBody( spike1,"dynamic", { density=10000.0,friction=5, bounce=0.3,radius=20}  )
--obj:scale(2,2)
game:insert(spike1)


accel = display.newImage('store/al.png')
accel.x=cr.x+10
accel.y=cr.y+5

accel.isVisible = false













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
--game:insert(info)


string="Objects can be moved by applying force"

text= display.newText(string, 0,0, "Comic Sans MS", 12);

text.x= 200
text.y=150
text.isVisible=false

view:insert(game)


target_Shape = { -21,10, 21,10, 21,41, -21,41 }
target1 = display.newImage('store/blade.png')

--target1.myName="target1"
physics.addBody( target1,"dynamic", { density=80.0, friction=0.5 ,shape=target_Shape} )
game:insert(target1)
target1.myName="trap"
target1:scale(.3,.3)





target=display.newImageRect("store/hit.png",80,80)
target.x=150
target.y=480
target.myName="puzzle"
physics.addBody( target,"dynamic", { density=18000.0,friction=0.5, bounce=0.3}  )
game:insert(target)


broken = display.newImage('store/broken.png',18,15)

--target1.myName="target1"
physics.addBody( broken,"dynamic", { density=10.0, friction=0.5 ,shape=target_Shape} )
--game:insert(broken)
broken:scale(.5,.5)

broken1 = display.newImage('store/broken.png',18,15)

--target1.myName="target1"
physics.addBody( broken1,"dynamic", { density=10.0, friction=0.5 ,shape=target_Shape} )
--game:insert(broken)
broken1:scale(.5,.5)



spike=display.newImageRect("store/spikes.png",40,150)
spike.x=310
spike.y=470
spike.myName="spike"
physics.addBody( spike,"kinematic", { density=10000.0,friction=5, bounce=0.3}  )
--obj:scale(2,2)
game:insert(spike)

spike2=display.newImageRect("store/spikes.png",40,150)
spike2.x=1050
spike2.y=470
spike2.myName="spike"
physics.addBody( spike2,"kinematic", { density=10000.0,friction=5, bounce=0.3}  )
--obj:scale(2,2)
game:insert(spike2)

spike3=display.newImageRect("store/spikes.png",40,150)
spike3.x=70
spike3.y=470
spike3.myName="spike"
physics.addBody( spike3,"kinematic", { density=10000.0,friction=5, bounce=0.3}  )
--obj:scale(2,2)
game:insert(spike3)



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
	--	target1:applyLinearImpulse(130,20,target1.x,target1.y)

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

	for j = 1,12 do
		if(j==11)then
		link1[j] = target1

		elseif(j==10) then
		link1[j] = broken
		game:insert(link1[j])
		else
		link1[j] = display.newImageRect( "store/clip.png",18,20)
		game:insert(link1[j])
		end
		link1[j].x = 200 + (i*278)
		link1[j].y = 100 + (j*17)
		physics.addBody( link1[j], { density=25.0, friction=0, bounce=0 } )

		-- Create joints between links
		if (j > 1) then
			prevLink = link1[j-1] -- each link is joined with the one above it
		else
			prevLink = hk-- top link is joined to overhanging beam
		end

		myJoints[#myJoints + 1] = physics.newJoint( "pivot", prevLink, link1[j], 200 + (i*278), 96 + (j*17) )

	end
end


for i = 1,1 do

	for j = 1,15 do
		if(j==15)then
		link[j] = target1
		elseif(j==10) then
		link[j] = broken1
		game:insert(link[j])
		else
		link[j] = display.newImageRect( "store/clip.png",18,20)
		game:insert(link[j])
		end
		link[j].x = 240 + (i*478)
		link[j].y = 100 + (j*17)
		physics.addBody( link[j], { density=15.0, friction=0, bounce=0 } )


		-- Create joints between links
		if (j > 1) then
			prevLink = link[j-1] -- each link is joined with the one above it
		else
			prevLink = hk1-- top link is joined to overhanging beam
		end

		myJoints[#myJoints + 1] = physics.newJoint( "pivot", prevLink, link[j], 240 + (i*478), 96 + (j*17) )

	end
end


function breakit()
	broken:removeSelf()
end

kill_timer=timer.performWithDelay(5000,breakit)



points=display.newImageRect("store/40.png",50,30)
points.x=200
points.y=100
points.isVisible=false







function moveit(event)

if event.phase =="moved" then

	display.getCurrentStage():setFocus(event.target)
--	if prey<event.y/.40 then
	transition.to(event.target,{delay=100,time=500,x=event.x/.55,y=event.y/.50})

--	end

elseif event.phase=="ended" then

display.getCurrentStage():setFocus(nil)
end

end

--obj:addEventListener("touch",moveit)



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











function vanish()

bullet:removeSelf()
counter=0
end




function relag()
lag = false
end



function revert()
accel.isVisible=false
accel1.isVisible=false
end


function dieout()
accel.isVisible=false
end

function disappear()
psh.isVisible=false
psh1.isVisible=false
end












function precoll(event)

if event.object2.myName =="ebullet" and event.object1.myName=="ground"   then

timer.performWithDelay( 100, liquid )
end



if event.object2.myName =="ebullet" and event.object1.myName=="green man"  then

timer.performWithDelay( 50, liquid )
end




if event.object2.myName =="bullet" and event.object1.myName=="ground"  then

timer.performWithDelay( 1000, liquid1 )
end


if event.object2.myName =="bullet" and event.object1.myName=="scd"  then

timer.performWithDelay( 1000, liquid1 )
end


end



function liquid (event)
ebullet.isSensor=true

end


function liquid1 (event)
--bullet.isSensor=true
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






jump_time=timer.performWithDelay( 1, chx )


function mv()

if drag == false then

--trg2.angularVelocity = 0
--trg1.angularVelocity = 0
end


--game.x=game.x - 2

if (cr.x > 80 and cr.x < 280) then
		game.x = (-cr.x + 80)/1.75

	end

if spike1.x < 520 then
spike1.angularVelocity=300

elseif spike1.x > 800 then
spike1.angularVelocity=-300
end


scoretext.text=score.."  newtons"




psh.x=cr.x + 45
psh.y=cr.y - 20

psh1.x=cr.x - 55
psh1.y=cr.y - 20




end


--InCase of error uncomment physics stop it produces a warning of physics which aint a big problem i guess

function killthis()

--physics.stop()
storyboard.gotoScene("potential_load",sceneChangeEffect, sceneChangeTime)
end


local function fallout()

	target.isSensor=true
end

function hitwall(event)

if event.other.myName=="bullet" then
	--wall1:applyLinearImpulse( -5000, 0, wall1.x, wall1.y )

	timer.performWithDelay(100,fallout)
	points.isVisible=true
	transition.to(points,{time=2000,y=-50})
	timer.performWithDelay(4000,killthis)
end


end




function coll(event)

if event.phase=="began" then
	cr.isFixedRotation = true
	if event.other.myName=="ground" or event.other.myName=="crate" or event.other.myName=="rock"then

		onearth=true
	end

		if event.other.myName=="wallend" then

	storyboard.gotoScene("Stage3.stage3",sceneChangeEffect, sceneChangeTime)
	end
	if event.other.myName=="trap" then
			display.getCurrentStage():setFocus(nil)

			storyboard.gotoScene("levelfail",sceneChangeEffect, sceneChangeTime)
		end
	if event.other.myName=="spike" then
			display.getCurrentStage():setFocus(nil)

			storyboard.gotoScene("levelfail",sceneChangeEffect, sceneChangeTime)


		end
end
end


function revert()

physics.start()
freeze=false
end



hit=0

function inertia()
	storyboard.gotoScene("potential",sceneChangeEffect, sceneChangeTime)

end


function done()
	target.isSensor=true
	timer.performWithDelay(1000,inertia)
end

function cut(event)

	if event.phase=="ended" then
		if event.other.myName=="bullet"  and event.other.isSensor==false then
		timer.performWithDelay(100,done)
		end
	end


end

--add controls





cr:addEventListener("collision",coll)
--target:addEventListener("collision",cut)
info:addEventListener("tap",hide)
target:addEventListener("collision",hitwall)
--cnl:addEventListener("touch",hide1)
--info:addEventListener("touch",tell)

--Runtime:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )

--rect1:addEventListener( "touch",onDoubleTap )
Runtime:addEventListener("preCollision",precoll)

end

function scene:enterScene(event)
storyboard.removeAll( )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
--physics.stop()
--key:removeEventListener("collision",spin)
score=0
scoretext.text=score.."  newtons"
cr:removeEventListener("collision",coll)
info:removeEventListener("touch",hide)
target:removeEventListener("collision",cut)
s_count:removeSelf()
timer.cancel(kill_timer)
timer.cancel(jump_time)
--points:removeSelf()
--scoretext:removeSelf()
--cnl:addEventListener("touch",hide1)
--info:removeEventListener("touch",tell)
controls.KillControls()
controls.hideControls()
scoreboard:removeSelf()
scoretext:removeSelf()

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
