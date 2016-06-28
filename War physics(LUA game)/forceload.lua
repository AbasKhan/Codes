
local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local controls= require("controls")
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
power = 8000
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












function nxtscn()
	nextlevel.isVisible=true

end



function push(event)

if face =="right" and freeze == false then
psh.isVisible = true
elseif face == "left" and freeze == false then
psh1.isVisible = true
end

		--action.push()
		if cr.x > roof.x-100 and cr.x < roof.x  and freeze == false then
	--cr:play()
		cr:setSequence( "push" )
        cr:play()

	score=score+(distance*10)
	--scoretext.text=score
	--accel.isVisible=true
--	text.text="Objects tend to resist change a concept known as inertia "

	drag=true

	roof:applyLinearImpulse( distance * 80000, 0, roof.x, roof.y )
		lag=true
    		timer.performWithDelay( 500, relag )
		timer.performWithDelay( 1000, dieout )




	end

	   if freeze == false then
	    	--timer.performWithDelay( 1000, revert )
			timer.performWithDelay( 1000, disappear )
		end
		info.isVisible=false
		text.isVisible=false


		timer.performWithDelay(1000,nxtscn)



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

	incognito()
end


function incognito()

	info.isVisible=false
	text.isVisible=false

	psh.isVisible = false
	psh1.isVisible = false
	freeze=false
	physics.start()

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


	storyboard.removeAll()
	local view = self.view
	game = display.newGroup()
	game.x = 0
    game.y=55
    game:scale(0.55,0.55)

	build.SetBackgrounds()

	build.SetGrounds()


	build.GetRoads()



function jnext(event)

	physics.stop()
	--storyboard.gotoScene("score1",sceneChangeEffect, sceneChangeTime)

end


	nextlevel= display.newImage('store/next.png')
	nextlevel.x=400
	nextlevel.y=150
	nextlevel:scale(.5,.5)
	nextlevel.isVisible=false




    controls.GetControls()

	controls.hideControls()


	--forceBar.isVisible=true
	--forceBar.y=100
	forceBar.x=100
	forceBar:scale(1,1.5)
	--forceBar:insert(pointer)
	point.isVisible=false


h=display.viewableContentWidth
w=display.viewableContentHeight

local img=display.newImageRect("store/loading.png",900,500)
img.x=430
img.y=190
game:insert(img)

local tray=display.newImage("store/homake.png")
tray.x=380
tray.y=50
tray:scale(1,1)
game:insert(tray)

string1=" Force is any influence that causes an object to undergo a certain change"

text1= display.newText(string1, 0,0,300,50, "Comic Sans MS", 12);
text1.x=260
text1.y=90


local hint=display.newImageRect("store/hint.png",40,40)
hint.x=40
hint.y=370
game:insert(hint)


man = display.newGroup()
man.x=125
man.y=10
roof = display.newImageRect( "store/40 kg.png" ,50,50)
roof.x = 80; roof.y =20
roof.myName="crate"
--roof.pos="platform"
physics.addBody( roof, "dynamic", { density=50000,friction=.6} )
man:insert(roof)

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

man:insert(cr)

--game:insert(man)

--local sheet = graphics.newImageSheet( "1.png", { width=110, height=120, numFrames=15,sheetContentWidth = 450,  sheetContentHeight = 500} )
--enemy = display.newSprite( sheet, { name="redman", start=1, count=15, time=750 ,loopCount = 1 } )





accel = display.newImage('store/al.png')

man:insert(accel)
accel:scale(1,1)
accel.isVisible = false

mass = display.newImage('store/aero.png')

man:insert(mass)
mass:scale(1.5,1.5)






psh = display.newImageRect('store/lin force.png',40,25)
psh:scale(1.5,1.5)
psh.isVisible = false

psh1 = display.newImageRect('store/lin force.png',40,25)
psh1.x=cr.x + 55
psh1.y=cr.y - 20
psh1.isVisible = false
psh1:rotate(180)
game:insert(psh1)
man:insert(psh)

game:insert(man)

xhape = { -20,-15, 20,-15, 20,15, -20,15 }





info = display.newImageRect("store/instruct.png",500,200)
info.x=250
info.y=200
info.alpha=0.6
info.isVisible=false
--game:insert(info)


string="When we apply sufficient force on a mass it moves in the direction of force"

text= display.newText(string, 0,0,250,0, "Comic Sans MS", 12);

text.x= 180
text.y=260
text.isVisible=false

view:insert(game)




local ld1=display.newImageRect("store/loading box.png",61,61)
ld1.x=665
ld1.y=390

ld1.isVisible=false

game:insert(ld1)


local ld2=display.newImageRect("store/loading box.png",61,61)
ld2.x=742
ld2.y=390

ld2.isVisible=false

game:insert(ld2)

local ld3=display.newImageRect("store/loading box.png",61,61)
ld3.x=815
ld3.y=390

ld3.isVisible=false

game:insert(ld3)

function reset()
ld1.isVisible=false
ld2.isVisible=false
ld3.isVisible=false
incognito()
storyboard.gotoScene("force","fade",100)
end


function three()
ld3.isVisible=true
timer.performWithDelay( 2500, reset)
end



function two()
ld2.isVisible=true
timer.performWithDelay( 2000, three)
end



function one()
ld1.isVisible=true
timer.performWithDelay( 2000, two)
end

timer.performWithDelay( 2000, one)







function stop()
pressed=false
pressed2=false
cr:setLinearVelocity( 0, 0)
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
--info.isVisible=true
--controls.hideControls()
guide = true
--box.isVisible=true
--cancel.isVisible=true
text.isVisible=true

--timer.performWithDelay( 5000, hidebox )
end



function anim()
cr:setSequence("push")
cr:play()
psh.isVisible=true
accel.isVisible=true
roof:applyLinearImpulse( 12 * 80000, 0, roof.x, roof.y )
tell()
end


timer.performWithDelay(2000,anim)


function mv()

if drag == false then

--trg2.angularVelocity = 0
--trg1.angularVelocity = 0
end



--game.x=game.x - 2


accel.x=roof.x +70
accel.y=roof.y

mass.x=roof.x
mass.y=roof.y+60


psh.x=cr.x + 45
psh.y=cr.y - 20

psh1.x=cr.x - 55
psh1.y=cr.y - 20


cr.isFixedRotation = true



end



function killthis()

physics.stop()
storyboard.gotoScene("score",sceneChangeEffect, sceneChangeTime)
end



function coll(event)

if event.phase=="began" then
	if event.other.myName=="ground" or event.other.myName=="crate" or event.other.myName=="rock"then

		onearth=true
	end

		if event.other.myName=="wallend" then

		timer.performWithDelay(1000,killthis)


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
--info:addEventListener("tap",hide)
--cnl:addEventListener("touch",hide1)
--info:addEventListener("touch",tell)

--Runtime:addEventListener("collision",coll)
Runtime:addEventListener( "enterFrame", mv )

--rect1:addEventListener( "touch",onDoubleTap )
Runtime:addEventListener("preCollision",precoll)

nextlevel:addEventListener("touch",jnext)

end

function scene:enterScene(event)
storyboard.purgeScene( "menu" )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )

--key:removeEventListener("collision",spin)
cr:removeEventListener("collision",coll)
--info:removeEventListener("touch",hide)
--cnl:addEventListener("touch",hide1)
--info:removeEventListener("touch",tell)
controls.KillControls()
controls.hideControls()
text1:removeSelf()

--nextlevel:removeEventListener("touch",jnext)
nextlevel:removeSelf()

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
