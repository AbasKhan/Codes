
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "htp.ActionH" )
local controls= require("controls")
local widget = require( "widget" )
local build	 = require("htp.MakeStage1H")



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




rightfix=0
leftfix=0
jumpfix=0
firefix=0
forcefix=0

sright=nil
sleft=nil









function push(event)

if face =="right" and freeze == false then
psh.isVisible = true
elseif face == "left" and freeze == false then
psh1.isVisible = true
end


		action.push()

		if forcefix ==1 then
			blink.isVisible=false
			sforce:setSequence( "normal" )
			transition.to(sforce,{x=50,y=50})
			forcefix=2
			--late()
			timer.performWithDelay(1000,late)

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

			  if firefix ==1 then
			  blink.isVisible=false
				sfire:setSequence( "normal" )
				transition.to(sfire,{x=450,y=50})
				firefix=2
				--late()
				timer.performWithDelay(1000,late)

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


		if jumpfix ==1 then
			blink.isVisible=false
			sup:setSequence( "normal" )
			transition.to(sup,{x=100,y=200})
			jumpfix=2
			--late()
			timer.performWithDelay(1000,late)

		end

		end
	end



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

if rightfix ==1 then
blink.isVisible=false
sright:setSequence( "normal" )
transition.to(sright,{x=150,y=250})
rightfix=2
--late()
timer.performWithDelay(1000,late)
end


if event.phase=="began"  then


face="right"
--print(event.y)
cr:setSequence( "man" )
print("its fine")
display.getCurrentStage():setFocus(event.target)
Runtime:addEventListener("enterFrame", GoRight)



elseif event.phase=="moved" and event.y<190  then
display.getCurrentStage():setFocus(nil)
Runtime:removeEventListener("enterFrame", GoRight)



elseif event.phase=="ended" then
display.getCurrentStage():setFocus(nil)
Runtime:removeEventListener("enterFrame", GoRight)


end

end


function t2(event)

if leftfix ==1 then
sleft:setSequence( "normal" )
transition.to(sleft,{x=50,y=250})
leftfix=2
blink.isVisible=false
--late()
timer.performWithDelay(1000,late)

end

if event.phase=="began"    then


face="left"

cr:setSequence( "man2" )
display.getCurrentStage():setFocus(event.target)
Runtime:addEventListener("enterFrame", GoLeft)




elseif event.phase=="moved" and event.y<190  then
display.getCurrentStage():setFocus(nil)
Runtime:removeEventListener("enterFrame", GoLeft)

elseif event.phase=="ended" then

Runtime:removeEventListener("enterFrame", GoLeft)
display.getCurrentStage():setFocus(nil)



end




end












function backmenu(event)

	storyboard.gotoScene("menu",sceneChangeEffect, sceneChangeTime)


end



function jnext(event)

	storyboard.gotoScene("forceload",sceneChangeEffect, sceneChangeTime)

end




 function scene:createScene( event )

	physics.start()
--	storyboard.purgeScene( "menu" )

	local view = self.view

	game = display.newGroup()
	game.x = 0
    game.y=55
    game:scale(0.55,0.55)

	--build.setDisplayGroup(game)


	build.SetBackgrounds()

	build.SetGrounds()


	build.GetRoads()



--	build.GetPuzzles()

	controls.GetControls()
	controls.hideControls()




	local sheet2 = graphics.newImageSheet( "store/btn2.png", {  width=525 ,height=592, numFrames=2} )
	local sequenceData ={ {sheet=sheet2,name="rbtn",frames={1,2},time=500} ,{sheet=sheet2,name="normal",frames={2}} }
	sleft = display.newSprite( sheet2, sequenceData )
	sleft:setSequence( "rbtn" )
	sleft.x=230
	sleft.y=180
	sleft.xScale=.1
	sleft.yScale=.1

	sleft:play()
	sleft.isVisible=false
	sleft:addEventListener("touch",t2)



	local sheet4 = graphics.newImageSheet( "store/btn1.png", {  width=525 ,height=592, numFrames=2} )
	local sequenceData ={ {sheet=sheet4,name="lbtn",frames={1,2},time=500} ,{sheet=sheet4,name="normal",frames={1}} }
	sright = display.newSprite( sheet4, sequenceData )
	sright:setSequence( "lbtn" )
	sright.x=240
	sright.y=180
	sright.xScale=.1
	sright.yScale=.1

	sright:play()
	sright:addEventListener("touch",t)
	sright.isVisible=false



	local sheet5 = graphics.newImageSheet( "store/btn3.png", {  width=525 ,height=592, numFrames=2} )
	local sequenceData ={ {sheet=sheet5,name="ubtn",frames={1,2},time=500},{sheet=sheet5,name="normal",frames={1}} }
	sup = display.newSprite( sheet5, sequenceData )
	sup.x=240
	sup.y=180
	sup.xScale=.1
	sup.yScale=.1

	sup:play()
	sup:addEventListener("touch",onDoubleTap)
	sup.isVisible=false



	local sheet6 = graphics.newImageSheet( "store/btn5.png", {  width=525 ,height=592, numFrames=2} )
	local sequenceData ={ {sheet=sheet6,name="ubtn",frames={1,2},time=500},{sheet=sheet6,name="normal",frames={1}} }
	sforce = display.newSprite( sheet6, sequenceData )

	sforce.x=240
	sforce.y=180
	sforce.xScale=.1
	sforce.yScale=.1

	sforce:play()
	sforce:addEventListener("touch",push)
	sforce.isVisible=false


	local sheet7 = graphics.newImageSheet( "store/btn4.png", {  width=525 ,height=592, numFrames=2} )
	local sequenceData ={ {sheet=sheet7,name="ubtn",frames={1,2},time=500},{sheet=sheet7,name="normal",frames={1}} }
	sfire = display.newSprite( sheet7, sequenceData )

	sfire.x=240
	sfire.y=180
	sfire.xScale=.1
	sfire.yScale=.1

	sfire:play()
	sfire:addEventListener("touch",shoot)
	sfire.isVisible=false


	local sheet3 = graphics.newImageSheet( "store/btn fo.png", {  width=590 ,height=548, numFrames=2} )
	local sequenceData1 = {sheet=sheet3,name="blk",frames={1,2},time=500}
	blink = display.newSprite( sheet3, sequenceData1 )
	blink:setSequence( "blk" )
	blink.x=235
	blink.y=185
	blink.xScale=.4
	blink.yScale=.4

	blink:play()

	--sright:addEventListener("touch",t2)




--	menu.isVisible=true



	forceBar.isVisible=false


	nextline = display.newImage('store/next.png')
	nextline.x=800
	nextline.y=250
	nextline:addEventListener("touch",jnext)
	nextline.isVisible=false
	game:insert(nextline)






	function late()

		if leftfix ==0 then

			sleft.isVisible=true
			leftfix=1



		elseif rightfix==0 then
			blink.isVisible=true
			sright.isVisible=true
			rightfix=1

		elseif jumpfix==0 then
			blink.isVisible=true
			sup.isVisible=true
			jumpfix=1

		elseif forcefix==0 then
			blink.isVisible=true
			sforce.isVisible=true
			forcefix=1

		elseif firefix ==0 then
			blink.isVisible=true
			sfire.isVisible=true
			firefix=1
			else
			blink.isVisible=false
			nextline.isVisible=true
		end


	end


	timer.performWithDelay(1000,late)








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








function mv()

if drag == false then

--trg2.angularVelocity = 0
--trg1.angularVelocity = 0
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

		if event.other.myName=="3end" then

	storyboard.gotoScene("Stage3.stage3",sceneChangeEffect, sceneChangeTime)
	end

end
end





function endstage(event)



		if event.other.myName=="crate" then
			print(event.other.myName)

			storyboard.gotoScene("storyboard 2.game1",sceneChangeEffect, sceneChangeTime)
			--timer.performWithDelay(2000,nextstage)




		end


end






function revert()

physics.start()
freeze=false
end



hit=0


--add controls





cr:addEventListener("collision",coll)
gd:addEventListener("collision",endstage)
info:addEventListener("tap",hide)
--cnl:addEventListener("touch",hide1)
--info:addEventListener("touch",tell)

--Runtime:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )

--rect1:addEventListener( "touch",onDoubleTap )
Runtime:addEventListener("preCollision",precoll)

end

function scene:enterScene(event)


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
physics.stop()
--key:removeEventListener("collision",spin)
cr:removeEventListener("collision",coll)
info:removeEventListener("touch",hide)
--cnl:addEventListener("touch",hide1)
--info:removeEventListener("touch",tell)
controls.KillControls()
ground1:removeSelf()
scoretext:removeSelf()
Runtime:removeEventListener("enterFrame", GRight)
Runtime:removeEventListener("enterFrame", GLeft)

--Runtime:addEventListener("collision",coll)
jump:removeEventListener( "touch",onDoubleTap )
Runtime:removeEventListener( "enterFrame", mv )


--Runtime:addEventListener( "enterFrame", intro )
sfire:removeSelf()
sright:removeSelf()
sleft:removeSelf()
sforce:removeSelf()
sup:removeSelf()
blink:removeSelf()

Runtime:removeEventListener("preCollision",precoll)

storyboard.removeScene("ngame")
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
