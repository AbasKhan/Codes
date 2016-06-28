
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "htp.ActionH" )
local controls= require("htp.controlsH")
local widget = require( "widget" )
local build	 = require("htp.MakeStage1H")


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

jumpfix=0
rightfix=0
leftfix=0
forcefix=0
firefix=0
nextfix=0












function push(event)

if face =="right" and freeze == false then
psh.isVisible = true
elseif face == "left" and freeze == false then
psh1.isVisible = true
end

		action.push()



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

		if firefix==1 then

		transition.to(firebutton,{x=440,y=60})
		--firebutton:setSequence("normal")
		firefix=2
		timer.performWithDelay(1000,late)


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


		if jumpfix==1 then

		transition.to(jump,{x=80,y=225})
		jump:setSequence("normal")
		jumpfix=2
		timer.performWithDelay(1000,late)


		end


		end
	end



end












function tell()
--controls.hideControls()
guide = true
--box.isVisible=true
--cancel.isVisible=true
text.isVisible=true

--timer.performWithDelay( 5000, hidebox )
end










function jumplevel(event)

	--controls.KillControls()
	print("??")
	storyboard.gotoScene("menu",sceneChangeEffect, sceneChangeTime)

end





 function scene:createScene( event )
	local view = self.view
	game = display.newGroup()
	game.x = 0
    game.y=55
    game:scale(0.55,0.55)

	nextlevel=display.newImageRect("store/next.png",80,50)
			nextlevel.x=450
			nextlevel.y=250
			nextlevel.isVisible=false
			nextlevel:addEventListener("touch",jumplevel)


	build.SetBackgrounds()

	build.SetGrounds()

	build.GetRoads()

	--build.GetPuzzles()

    controls.GetControls()

	controls.hideControls()

	function late()

	print("call")
		if jumpfix==0 then
			jump.isVisible=true
			jumpfix=1




		elseif rightfix==0 then


			right.isVisible=true
			rightfix=1



		elseif leftfix==0 then
			left.isVisible=true
			leftfix=1




		elseif forcefix==0 then
			forcebutton.isVisible=true
			forcefix=1



		elseif firefix==0 then
			firebutton.isVisible=true
			firefix=1


		elseif nextfix==0 then
			nextfix=1
			nextlevel.isVisible=true

		end


	end

	timer.performWithDelay(1000,late)




info = display.newImageRect("store/instruct.png",500,50)
info.x=250
info.y=150
info.isVisible=false







	local scoreboard = display.newImageRect( "store/score board.png",180,30 )
scoreboard.x = 280; scoreboard.y = 40

scoreboard.isVisible=false





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





scoretext=display.newText(score.."newtons", 0,0, nil, 10)

scoretext.x=280
scoretext.y=40


--game:insert(info)








function stop()
pressed=false
pressed2=false
cr:setLinearVelocity( 0, 0)
end





function incognito()

info.isVisible=false
text.isVisible=false

psh.isVisible = false
psh1.isVisible = false
freeze=false

--physics.start()
--controls.showControls()

physics.start()
freeze=false

end



function hide(event)

--box.isVisible=false

if event.numTaps >= 2  then
incognito()

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









function mv()

if drag == false then

--trg2.angularVelocity = 0
--trg1.angularVelocity = 0
end



--game.x=game.x - 2

if (cr.x > 80 and cr.x < 1100) then
		game.x = (-cr.x + 80)/1.75

	end


	if (cr.y > 180 and cr.y < 500) then
		game.y = (game.y - 20)/1.5

	end


scoretext.text=score.."  newtons"







psh.x=cr.x + 45
psh.y=cr.y - 20

psh1.x=cr.x - 55
psh1.y=cr.y - 20


cr.isFixedRotation = true



end







function coll(event)

if event.phase=="began" then
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
--cnl:addEventListener("touch",hide1)
--info:addEventListener("touch",tell)

--Runtime:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )

--rect1:addEventListener( "touch",onDoubleTap )
Runtime:addEventListener("preCollision",precoll)

end

function scene:enterScene(event)
storyboard.purgeScene( "menu" )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
--key:removeEventListener("collision",spin)
cr:removeEventListener("collision",coll)
info:removeEventListener("touch",hide)
--cnl:addEventListener("touch",hide1)
--info:removeEventListener("touch",tell)
--build.KillControls()

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
