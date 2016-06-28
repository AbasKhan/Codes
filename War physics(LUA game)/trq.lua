
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local controls= require("controls")
local widget = require( "widget" )
local build	 = require("MakeStage4")
local imgsht=require("imagesheet")


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

ghit=0

prex=0
prey=0

trans=0

local scoreboard
local scoretext


	h=display.contentHeight
	w=display.contentWidth






function push(event)

if face =="right" and freeze == false then
psh.isVisible = true
elseif face == "left" and freeze == false then
psh1.isVisible = true
end



if cr.x > target1.x-100 and cr.x < target1.x  and freeze == false and lag==false then
	--cr:play()
		cr:setSequence( "push" )
        cr:play()

	score=score+(distance*10)
	--scoretext.text=score
	--accel.isVisible=true
--	text.text="Objects tend to resist change a concept known as inertia "

	drag=true

	target1:applyLinearImpulse( distance * 40000, 0, target1.x, target1.y )
		lag=true
		timer.performWithDelay( 500, relag )
		timer.performWithDelay( 1000, dieout )




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
			 bullet = display.newImage('store/knife.png')
			  game:insert(bullet)
			  action.shoot()


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






















 function scene:createScene( event )
	local view = self.view
	game = display.newGroup()
	game.x = 0
    game.y=-30
    game:scale(0.55,0.55)


	build.group(game)

	build.SetBackgrounds()

	build.SetGrounds()

	build.GetRoads()

	--build.GetPuzzles()

    controls.GetControls()



scoreboard = display.newImageRect( "store/score board.png",100,100 )
scoreboard.x = 280; scoreboard.y = 50
scoreboard:scale(0.8,0.6)




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



target1 = display.newImageRect('store/target.png',60,60)

target1.myName="target1"
target1.x=250
target1.y=200

physics.addBody( target1,"dynamic", { density=15000.0,friction=5, bounce=0.0, radius=20 }  )
game:insert(target1)






wShape = { -25,-25, 25,-25, 25,25, -25,25 }
wall1=display.newImageRect("store/hit.png",150,150)
wall1.x=750
wall1.y=200
wall1.myName="puzzle"
physics.addBody( wall1,"kinematic", { density=30.0, friction=5 ,shape=wShape } )
game:insert(wall1)
wall1:rotate(180)
wall1:scale(.7,.7)





points=display.newImageRect("store/40.png",50,30)
points.x=200
points.y=100
points.isVisible=false


bag = display.newGroup()
bag.y=20
--points.isVisible=false





lft=display.newImageRect("store/wheel.png",100,100)
lft.x=w+350
lft.y=330
bag:insert(lft)
game:insert(bag)




local sheet7 = graphics.newImageSheet( "store/imagesheet.png", {  width=185, height=333, numFrames=24} )
local seq 	  ={sheet=sheet7 ,name="sp",frames ={1,7,13},time=500 }
spring = display.newSprite( sheet7, seq )
--spring=display.newImageRect("store/spr.png",50,50)
spring.x=380
spring.y=380
--spring.myName="spr"
--spring:play()
spring:scale(.3,.3)
sShape = { -11,-21, 11,-21, 11,21, -11,21 }
physics.addBody( spring,"kinematic", { density=10000.0,friction=5, bounce=0.3,shape=sShape}  )
spring:rotate(45)
game:insert(spring)




head=display.newImageRect("store/block.png",10,30)
head.x=spring.x+20
head.y=spring.y-10
head.myName="spr"
physics.addBody( head,"static", { density=10000.0,friction=5, bounce=0.3}  )
head:rotate(-45)
head.isVisible=false
game:insert(head)

obj=display.newImageRect("store/tile.png",50,20)
obj.x=500
obj.y=400
physics.addBody( obj,"static", { density=10000.0,friction=5, bounce=0.3}  )
obj:scale(2,2)
game:insert(obj)


prex=obj.x
prey=obj.y





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

obj:addEventListener("touch",moveit)
spring:addEventListener("touch",moveit)


function rotate(event)
if event.phase=="began" then
	obj:rotate(30)
	lft:rotate(-30)
	end

end


lft:addEventListener("touch",rotate)





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


function chx()
chk = chk + 1
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



function gothit(event)


if event.object2.myName =="target1" and event.object1.myName=="puzzle"   then

	if(event.force>25000) then

	print(event.force)
	end

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

if drag == false then

--trg2.angularVelocity = 0
--trg1.angularVelocity = 0
end



--game.x=game.x - 2

if target1.y>550 or target1.x>850 or cr.y>450 and ghit==0 then
print("working")
timer.performWithDelay(100,die)
gothit=2
end

function die()



		storyboard.gotoScene("trqfail",sceneChangeEffect, sceneChangeTime)


end




head.x=spring.x+30
head.y=spring.y-25

scoretext.text=score.."  newtons"



psh.x=cr.x + 45
psh.y=cr.y - 20

psh1.x=cr.x - 55
psh1.y=cr.y - 20




end


--InCase of error uncomment physics stop it produces a warning of physics which aint a big problem i guess

function killthis()

--physics.stop()
storyboard.gotoScene("trqscore",sceneChangeEffect, sceneChangeTime)
end

function falldown()
	wall1.bodyType="dynamic"

end



function hitwall(event)
if event.other.myName=="puzzle" then
	--wall1:applyLinearImpulse( -5000, 0, wall1.x, wall1.y )
	--wall2:applyLinearImpulse( -8000, 0, wall2.x, wall2.y )
--	light.isVisible=false

	points.isVisible=true
	transition.to(points,{time=2000,y=-50})
	ghit=1
	timer.performWithDelay(100,falldown)
	timer.performWithDelay(2000,killthis)

		elseif event.other.myName=="spr" then
		print("Got a hit")

		target1:applyLinearImpulse( 200000, -200000,target1.x, target1.y )

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
end
end


function revert()

physics.start()
freeze=false
end



hit=0


--add controls





cr:addEventListener("collision",coll)
info:addEventListener("tap",hide)
target1:addEventListener("collision",hitwall)

Runtime:addEventListener("postCollision",gothit)
--cnl:addEventListener("touch",hide1)
--info:addEventListener("touch",tell)

--Runtime:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )

--rect1:addEventListener( "touch",onDoubleTap )
Runtime:addEventListener("preCollision",precoll)

end

function scene:enterScene(event)
storyboard.removeScene( "menu" )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
--physics.stop()
--key:removeEventListener("collision",spin)
score=0
scoretext.text=score.."  newtons"
cr:removeEventListener("collision",coll)
info:removeEventListener("touch",hide)
--points:removeSelf()
--scoretext:removeSelf()
--cnl:addEventListener("touch",hide1)
--info:removeEventListener("touch",tell)
controls.KillControls()
controls.hideControls()


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
