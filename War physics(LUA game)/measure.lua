

local storyboard = require( "storyboard" )
local physics = require("physics")
local action = require( "Action" )
local controls= require("controls")
local widget = require( "widget" )



physics.start()
playvideo=true
physics.setGravity(0,0)
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
rate = 2


ecount  =0
fell1 =false
fell2 =false
alive  =  true
drag=false
guide=false

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


playerPoints = 6
rate = 2


local scoreboard
local scoretext



function scorePoint()
    playerPoints = playerPoints - 0.1
    scoreDisplay.text = playerPoints.."mms"
end


function Point()
    playerPoints = playerPoints + 0.1
    scoreDisplay.text = playerPoints.."mms"
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
			if cr.x > roof.x-400 and cr.x < roof.x  and freeze == false  and lag==false  then
	--cr:play()
		cr:setSequence( "push" )
        cr:play()

	score=score+(distance*10)
	--scoretext.text=score
	--accel.isVisible=true
--	text.text="Objects tend to resist change a concept known as inertia "

	drag=true

	roof:applyLinearImpulse( distance * 75000, 0, roof.x, roof.y )
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
	physics.setGravity(0,0)



local background = display.newImage( "store/box1.png", 0, 0, true )
background.x = display.contentWidth / 2
background.y = display.contentHeight / 2
game:insert(background)





local calliper = display.newImageRect( "store/main_scale.png",380,200,true )
calliper.x = 200
calliper.y = 130
--physics.addBody( calliper, "static", { friction=0.5 } )
game:insert(calliper)



local fix = display.newImageRect( "store/button.png",40,50,true )
fix.x = 65
fix.y = 109
fix.isVisible=false
physics.addBody( fix, "static" )

game:insert(fix)




local fix1 = display.newImageRect( "store/button.png",40,50,true )
fix1.x = 65
fix1.y = 214
fix1.isVisible=false
physics.addBody( fix1, "static" )
game:insert(fix1)



local button = display.newImageRect( "store/use.png",120,50,true )
button.x = 240
button.y = 270
--fix.isVisible=false
physics.addBody( button, "static" )
game:insert(button)


read = display.newImageRect( "store/jaw.png",30,180,true )
read.x = 200
read.y = 123
physics.addBody( read, "dynamic" ,{density=100})
read.isBullet=true
game:insert(read)



screen = display.newImageRect( "store/screen.png",160,60,true )
screen.x =  240
screen.y = 110
game:insert(screen)

 scoreDisplay = display.newText( (playerPoints.."mm"), 0, 0, native.systemFont, 20 )
 scoreDisplay.x = 220
 scoreDisplay.y = 105
 scoreDisplay:setTextColor( 255,0,0 )
 game:insert(scoreDisplay)


rock = display.newImageRect( "store/Animkey.png",70,50 )
rock.x = 70
rock.y = 150
game:insert(rock)

rock:setReferencePoint( display.BottomRightReferencePoint )
physics.addBody( rock, "dynamic",{density=15} )
rock.isBullet=true
current = rock
current.mywidth=70



local up = display.newImageRect( "store/left.png",50,50,true )
up.x = 40
up.y = 270
game:insert(up)


local down = display.newImageRect( "store/right.png",50,50,true )
down.x = 440
down.y = 270
game:insert(down)



local rock1 = display.newImage( "store/Animkey.png")
game:insert(rock1)
rock1.x = 440
rock1.y = 80
rock1:scale(.5,.5)
rock1.isBullet=true
physics.addBody( rock1, "dynamic", {density=15} )
game:insert(rock1)


local rock2 = display.newImage( "store/Animkey.png")
game:insert(rock2)
rock2.x = 440
rock2.y = 150
rock2.isBullet=true
rock2:scale(.5,.5)
physics.addBody( rock2, "dynamic", {density=15} )

game:insert(rock2)


local rock3 = display.newImage( "store/Animkey.png")
game:insert(rock3)
rock3.x = 440
rock3.y = 220
rock3.isBullet=true
rock3:scale(.5,.5)
physics.addBody( rock3, "dynamic", {density=15} )
game:insert(rock3)


local bar = display.newImageRect( "store/stone bar.png",80,220, true )
game:insert(bar)
bar.x = 440
bar.y = 140

game:insert(bar)





 Display = display.newText( ("Find a 1.5 mm rock"), 0, 0, native.systemFont, 20 )
 Display.x = display.contentWidth - 170
 Display.y = display.contentHeight - 265
 Display:setTextColor( 255,255,0 )

function kaboom(event)
display.remove(current)

rock = display.newImageRect( "store/Animkey.png",70,50, true )
rock.isBullet=true
physics.addBody( rock, "dynamic", {density=15} )
game:insert(rock)
rock.x = 76
rock.y = 150
transition.to(read,{x=200})
playerPoints=6
rate=2

current=rock
current.mywidth=70
end


function kaboom1(event)
display.remove(current)
rock = display.newImageRect( "store/Animkey.png",55,50, true )
rock.isBullet=true
physics.addBody( rock, "dynamic", {density=15} )
game:insert(rock)
rock.x = 74
rock.y = 150
transition.to(read,{x=200})
playerPoints=6
rate=2

current=rock
current.mywidth=55
end


function kaboom2(event)
display.remove(current)
rock = display.newImageRect( "store/Animkey.png",50,50, true )
rock.isBullet=true
physics.addBody( rock, "dynamic", {density=15} )
game:insert(rock)
rock.x = 70
rock.y = 150
transition.to(read,{x=200})
playerPoints=6
rate=2

current=rock
current.mywidth=50
end



function move(event)
	if(rate>0)then
	read.x=read.x - rate
	transition.to(read,{x=read.x})
	print(read.x)
	--playerPoints=playerPoints -1
	scorePoint()


	end
end


function moveright(event)
	if(read.x<300)then
	read.x=read.x + rate
	transition.to(read,{x=read.x})
	print(read.x)
	Point()

	end
end



function reading(event)
	rate=0

end


function check(event)

	if event.phase=="ended" then
		if current.mywidth==50 then
		--game:removeSelf()

		storyboard.gotoScene("menu","fade", 200)

		end

	end

end


print(display.contentWidth..display.contentHeight)

read:addEventListener("collision" , reading)
--button:addEventListener("touch" , usethis)
down:addEventListener("touch" , moveright)
up:addEventListener("touch" , move)
rock1:addEventListener("touch" , kaboom2)

rock2:addEventListener("touch" , kaboom)

rock3:addEventListener("touch" , kaboom1)

button:addEventListener("touch",check)


view:insert(game)

end





function scene:enterScene(event)
storyboard.removeAll()


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
--key:removeEventListener("collision",spin)
physics.setGravity(0,10)
Display:removeSelf()

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
