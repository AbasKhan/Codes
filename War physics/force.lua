
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local controls= require("controls")
local widget = require( "widget" )
local build	 = require("MakeStage1")


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
distance=2



ecount  =0
fell1 =false
fell2 =false
alive  =  true
drag=false
guide=false



shoot_count=0
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

jnext=0


hit_target=0
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

print(cr.x.."   "..target.x)
		--action.push()

if cr.x > crate.x-50 and cr.x < crate.x  and freeze == false and lag==false then
	--cr:play()
		cr:setSequence( "push" )
        cr:play()

	score=score+(distance*10)
	--scoretext.text=score
	--accel.isVisible=true
--	text.text="Objects tend to resist change a concept known as inertia "

	drag=true

	crate:applyLinearImpulse( distance * 20000, 0, crate.x, crate.y )
		lag=true
		timer.performWithDelay( 500, relag )
		timer.performWithDelay( 1000, dieout )





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

local current_stage = "force"

local path = system.pathForFile( "current_stage.txt" )

local file = io.open( path, "w" )
file:write( current_stage )

io.close( file )
file = nil


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

--local sheet = graphics.newImageSheet( "1.png", { width=110, height=120, numFrames=15,sheetContentWidth = 450,  sheetContentHeight = 500} )
--enemy = display.newSprite( sheet, { name="redman", start=1, count=15, time=750 ,loopCount = 1 } )




crate=display.newImageRect("store/3d box.png",60,60)
crate.x=200
crate.y=180
crate.myName="ground"
physics.addBody( crate,"dynamic", { density=18000.0,friction=0.5, bounce=0.3 }  )
game:insert(crate)


pillar=display.newImageRect("store/pillar11.png",60,120)
pillar.x=418
pillar.y=180
pillar.myName="ground"
physics.addBody( pillar,"kinematic", { density=18000.0,friction=0.5, bounce=0.3}  )
game:insert(pillar)

target=display.newImageRect("store/hit2.png",80,80)
target.x=750
target.y=180
target.myName="ground"
physics.addBody( target,"kinematic", { density=18000.0,friction=0.5, bounce=0.3}  )
game:insert(target)


target2=display.newImageRect("store/hit2.png",80,80)
target2.x=700
target2.y=415
target2.myName="ground"
physics.addBody( target2,"kinematic", { density=18000.0,friction=0.5, bounce=0.3}  )
game:insert(target2)



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





trap = display.newImageRect("store/tk.png",150,50)
trap.x=550
trap.y=430
trap.myName="spike"
trap.isBullet=true
physics.addBody( trap,"kinematic", { density=10000.0,friction=5, bounce=0.3}  )
trap:scale(1.2,1)
game:insert(trap)


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








function mv()

if drag == false then

--trg2.angularVelocity = 0
--trg1.angularVelocity = 0
end



--game.x=game.x - 2

print(jnext)

if (cr.x > 80 and cr.x < 1100) then
		game.x = (-cr.x + 80)/1.75

	end


	if (cr.y > 180 and cr.y < 500) then
		game.y = (game.y - 20)/1.5

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
storyboard.gotoScene("pendulum",sceneChangeEffect, sceneChangeTime)
end



function coll(event)

if event.phase=="began" then
	if event.other.myName=="ground" or event.other.myName=="crate" or event.other.myName=="rock"then

		onearth=true
	end

		if event.other.myName=="wallend" and hit_target==2 then

		timer.performWithDelay(1000,killthis)

		end

			if event.other.myName=="spike" then

			storyboard.gotoScene("levelfail",sceneChangeEffect, sceneChangeTime)

			end
end
end


function revert()

physics.start()
freeze=false
end



hit=0


--add controls

function fall(t)

	t:removeSelf()
	hit_target=hit_target+1
	if hit_target==2 then
		timer.performWithDelay(1000,killthis)

	end


end


function ontarget(event)

	if event.phase=="ended" then
		t=event.target

		jnext=jnext+1


		timer.performWithDelay(10,fall(t))

	end

end




cr:addEventListener("collision",coll)
info:addEventListener("tap",hide)
target:addEventListener("collision",ontarget)
target2:addEventListener("collision",ontarget)

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
info:removeEventListener("touch",hide)
--cnl:addEventListener("touch",hide1)
--info:removeEventListener("touch",tell)
controls.KillControls()
controls.hideControls()
s_count:removeSelf()
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
