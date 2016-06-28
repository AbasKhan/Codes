
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local controls= require("controls")
local widget = require( "widget" )
local build	 = require("callipermake")


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


shoot_count=0
ecount  =0
fell1 =false
fell2 =false
alive  =  true
drag=false
guide=false

spin=0
collected=0

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


local scoreboard
local scoretext




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


		if cr.x >trq.x-50 and cr.x<trq.x  then
	trq:rotate(-30)
	transition.to(spike,{time=1000,x=spike.x-150})
	transition.to(slide,{time=1000,x=slide.x-150})
	--transition.to(pillar,{time=1000,y=pillar.y+150})


	spin=1

	end


	   if freeze == false then
	    	--timer.performWithDelay( 1000, revert )
			timer.performWithDelay( 1000, disappear )
		end


end


function shoot(event)

	  	   if (event.phase == 'began') then
	   		if counter == 1 then
			vanish()
			end

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

start = event.xStart
ended = event.x

if event.phase=="began" then
	if jumping==true  and onearth == false then

		action.DoubleJump()

    end

elseif event.phase=="ended" then
	 print("whaat")
if onearth ==true then
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
    game.y=46
    game:scale(0.55,0.55)

	build.group(game)
	build.SetBackgrounds()

	build.SetGrounds()

	build.GetRoads()

    controls.GetControls()



local current_stage = "vernier2"

local path = system.pathForFile( "current_stage.txt" )

local file = io.open( path, "w" )
file:write( current_stage )

io.close( file )
file = nil



lifter=display.newImageRect("store/tile.png",195,20)
lifter.x=185
lifter.y=130
lifter:rotate(90)
game:insert(lifter)



slide1=display.newImageRect("store/tile.png",195,20)
slide1.x=800
slide1.y=450
game:insert(slide1)


slide2=display.newImageRect("store/tile.png",195,20)
slide2.x=980
slide2.y=450
game:insert(slide2)



	scoreboard = display.newImageRect( "store/score board.png",100,100 )
	scoreboard.x = 280; scoreboard.y = 50
	scoreboard:scale(0.8,0.6)

--scoreboard.isVisible=false










local sheet2 = graphics.newImageSheet( "store/right walk.png", {  width=88, height=136, numFrames=14} )

local sheet3 = graphics.newImageSheet( "store/left walk.png", { width=88, height=136 , numFrames=14} )


local sheet4 = graphics.newImageSheet( "store/right jump.png", { width=88, height=136 , numFrames=16} )

local sheet5 = graphics.newImageSheet( "store/left jump.png", { width=88, height=136 , numFrames=16} )

local sheet6 = graphics.newImageSheet( "store/right push.png", { width=88, height=136 , numFrames=14} )
local sequenceData = {
                { sheet=sheet2 ,name="man",  frames={1,2,3,4,5,6,7,8,9,10,11,12,13,14,13,12,11,10,3,2,1},time=950 ,loopCount = 1 },
                {  sheet=sheet3,name="man2", frames={14,13,12,11,10,9,8,7,6,5,4,3,2,1,2,3,4,12,13,14},time=950  ,loopCount = 1},
			    { sheet=sheet4 ,name="jump",  frames={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1},time=950 ,loopCount = 1 }
				,{ sheet=sheet5 ,name="jump2",frames={16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},time=950 ,loopCount = 1 }
                ,{  sheet=sheet6,name="push", frames={1,2,3,4,5,6,7,8,9,10,11,12,13,14,13,12,11,10,9,8,7,6,5,4,3,2,1},time=950  ,loopCount = 1}
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


--local sheet = graphics.newImageSheet( "1.png", { width=110, height=120, numFrames=15,sheetContentWidth = 450,  sheetContentHeight = 500} )
--enemy = display.newSprite( sheet, { name="redman", start=1, count=15, time=750 ,loopCount = 1 } )



local sheet7 = graphics.newImageSheet( "store/keyw.png", {  width=105, height=59, numFrames=20} )
local sequenceData = {sheet=sheet7 , start=1,count=20,time=2000 }
key2 = display.newSprite( sheet7, sequenceData )
kShape = { -21,-11, 21,-11, 21,11, -21,11 }
key2.myName="key2"
key2:rotate(90)
key2:scale(0.7,0.7)
key2.x = 650; key2.y = 50;
key2:play()
physics.addBody( key2,"kinematic", { density=3000.0, friction=0.5,shape=kShape} )
game:insert(key2)



spike=display.newImageRect("store/spikes.png",40,250)
spike.x=600
spike.y=350
spike:rotate(90)
spike.myName="spike"
physics.addBody( spike,"kinematic", { density=10000.0,friction=5, bounce=0.3}  )
--obj:scale(2,2)
game:insert(spike)

spike1=display.newImage("store/spikes.png")
spike1.x=990
spike1.y=130
spike1.myName="spike"
physics.addBody( spike1,"kinematic", { density=10000.0,friction=5, bounce=0.3}  )
spike1:scale(.8,.8)
game:insert(spike1)



slide=display.newImageRect("store/tile.png",25,25)
slide.x=600
slide.y=350
physics.addBody( slide,"kinematic", { density=10000.0,friction=5, bounce=0.3 , radius=16}  )
game:insert(slide)


brick=display.newImageRect("store/tile.png",70,30)
brick.x=500
brick.y=180
brick.myName="ground"
brick.action="fall1"
physics.addBody( brick,"kinematic", { density=18000.0,friction=0.5, bounce=0.3 , radius=16}  )
game:insert(brick)

brick1=display.newImageRect("store/tile.png",70,30)
brick1.x=650
brick1.y=180
brick1.myName="ground"
brick1.action="fall2"
physics.addBody( brick1,"kinematic", { density=18000.0,friction=0.5, bounce=0.3 , radius=16}  )
game:insert(brick1)




lift1=display.newImageRect("store/trap.png",60,60)
lift1.x=185
lift1.y=50
physics.addBody( lift1,"kinematic", { density=10000.0,friction=5, bounce=0.3 , radius=18}  )
--obj:scale(2,2)
lift1.myName="spike"
game:insert(lift1)

key3 = display.newSprite( sheet7, sequenceData )
key3.myName="key3"
key3:rotate(90)
key3:scale(0.7,0.7)
key3.x = 430; key3.y = 150;
key3:play()
physics.addBody( key3,"kinematic", { density=3000.0, friction=0.5,shape=kShape} )
game:insert(key3)







trq=display.newImageRect("store/trq.png",80,80)
trq.x=860
trq.y=180
game:insert(trq)











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





up=1
up1=1




function movelift1()
	if up1==1 then

		transition.to(lift1,{time=2000,y=lift1.y+150})
		up1=0

	elseif up1==0 then

		transition.to(lift1,{time=2000,y=lift1.y-150})
		up1=1

	end

	move_time1=timer.performWithDelay(2000,movelift1)

end

timer.performWithDelay(2000,movelift1)





jump_time=timer.performWithDelay(10,chx)

function mv()

if drag == false then

--trg2.angularVelocity = 0
--trg1.angularVelocity = 0
end


if (cr.x > 80 and cr.x < 1100) then
		game.x = (-cr.x + 80)/1.75

	end


	if (cr.y > 180 and cr.y < 500) then
		game.y = (game.y - 20)/1.5

	end

if spin==0 then
spike.angularVelocity=150
slide.angularVelocity=150
lift1.angularVelocity=-300
end



scoretext.text=score.."  n"



psh.x=cr.x + 45
psh.y=cr.y - 20

psh1.x=cr.x - 55
psh1.y=cr.y - 20


cr.isFixedRotation = true



end



function killthis()

physics.stop()
storyboard.gotoScene("vir_load",sceneChangeEffect, sceneChangeTime)
end







function killkey()
	key2:removeSelf()
	collected=collected+1
end
function killkey1()
	key3:removeSelf()
	collected=collected+1
end

function fail()
	storyboard.gotoScene("levelfail",sceneChangeEffect, sceneChangeTime)
end

function sensor()
brick.isSensor=true
end
function falldown()
	brick.bodyType="dynamic"
	timer.performWithDelay(10,sensor)


end

function sensor1()
brick1.isSensor=true
end
function falldown1()
	brick1.bodyType="dynamic"
	timer.performWithDelay(10,sensor1)


end

function coll(event)

	if event.phase=="began" then
		if event.other.myName=="ground" or event.other.myName=="crate" or event.other.myName=="rock"then

			onearth=true
		end

		if event.other.myName=="wallend" and collected==2 then

			timer.performWithDelay(1000,killthis)


		end


		if event.other.myName=="spike" then
			display.getCurrentStage():setFocus(nil)
			timer.performWithDelay(100,fail)



		end


		if event.other.myName=="trap" then
			display.getCurrentStage():setFocus(nil)
			timer.performWithDelay(100,fail)
		end

		if event.other.myName=="key2" then
			timer.performWithDelay(10,killkey)

		end
		if event.other.myName=="key3" then
			timer.performWithDelay(10,killkey1)

		end

		if event.other.action=="fall1" then
				timer.performWithDelay(200,falldown)
		end
		if event.other.action=="fall2" then
				timer.performWithDelay(200,falldown1)
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
--cnl:addEventListener("touch",hide1)
--info:addEventListener("touch",tell)

--Runtime:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )

--rect1:addEventListener( "touch",onDoubleTap )
Runtime:addEventListener("preCollision",precoll)

end

function scene:enterScene(event)
storyboard.removeAll()

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )

--key:removeEventListener("collision",spin)
cr:removeEventListener("collision",coll)

timer.cancel(move_time1)
timer.cancel(jump_time)
s_count:removeSelf()
info:removeEventListener("touch",hide)
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
scoreboard.isVisible=false
scoretext.isVisible=false

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
