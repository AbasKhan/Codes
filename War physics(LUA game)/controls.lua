
local build	 = require("MakeStage1")
local storyboard = require( "storyboard" )



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
if event.phase=="began"  then
face="right"
cr.isFixedRotation = true
print(event.y)
cr:setSequence( "man" )

display.getCurrentStage():setFocus(right)
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


if event.phase=="began"    then
face="left"
cr.isFixedRotation = true
cr:setSequence( "man2" )
display.getCurrentStage():setFocus(left)
Runtime:addEventListener("enterFrame", GoLeft)


elseif event.phase=="moved" and event.y<190  then
display.getCurrentStage():setFocus(nil)
Runtime:removeEventListener("enterFrame", GoLeft)


elseif event.phase=="ended" then

Runtime:removeEventListener("enterFrame", GoLeft)
display.getCurrentStage():setFocus(nil)
end

end










local c={}
















c.hideControls=function()
left.isVisible=false
right.isVisible=false
jump.isVisible=false
firebutton.isVisible=false
forcebutton.isVisible=false
forceBar.isVisible=false
menu.isVisible=false
end


c.showControls=function()
left.isVisible=true
right.isVisible=true
jump.isVisible=true
firebutton.isVisible=true
forcebutton.isVisible=true
forceBar.isVisible=true
menu.isVisible=true
end











c.GetControls=function()


	pause = display.newGroup()
	pause.x=-20

	bck = display.newImageRect("store/score screen.png",500,300)
	bck.x=270
	bck.y=160
	pause:insert(bck)

	btm = display.newImageRect( "store/back to menu.png",60,60)
	btm.y=160
	btm.x=205

	pause:insert(btm)
	rst = display.newImageRect( "store/replay.png",60,60)
	rst.y=160
	rst.x=275
pause:insert(rst)

	rsm= display.newImageRect( "store/play.png",60,60)
	rsm.y=160
	rsm.x=345
pause:insert(rsm)

pause.isVisible=false



right = display.newImageRect( "store/right.png",50,50)
right.y=275
right.x=110





firebutton = display.newImageRect( "store/fire.png",50,50)
firebutton.y=60
firebutton.x=445


left = display.newImageRect( "store/left.png",50,50)
left.y=275
left.x=25

jump = display.newImageRect( "store/jump.png",50,50)
jump.y=230
jump.x=65



menu = display.newImageRect( "store/menu.png",60,60)
menu.y=270
menu.x=450




forcebutton = display.newImageRect( "store/force.png",40,40)
forcebutton.y=50
forcebutton.x=40





forceBar = display.newGroup()
point = display.newImageRect( "store/33.png",36,18)
point.x = 80; point.y = 50
forceBar:insert(point)



twenty = display.newImage("store/20 n.png")
twenty .x=80
twenty .y=50
twenty.isSensor = true

forceBar:insert(twenty)

physics.addBody( twenty,"kinematic",{ isSensor = true,density=3.0, friction=0.5, bounce=0.3 } )

fifty = display.newImage("store/50 n.png")
fifty .x=110
fifty .y=50
fifty.isSensor = true
physics.addBody( fifty,"kinematic",{ isSensor = true,density=3.0, friction=0.5, bounce=0.3 } )

forceBar:insert(fifty)

hnd = display.newImage("store/100 n.png")
hnd .x=140
hnd .y=50
hnd.isSensor = true
physics.addBody( hnd,"kinematic",{ isSensor = true,density=3.0, friction=0.5, bounce=0.3 } )

forceBar:insert(hnd)

onef = display.newImage("store/150 n.png")
onef .x=174
onef .y=50
onef.isSensor = true
physics.addBody( onef,"kinematic",{isSensor = true, density=3.0, friction=0.5, bounce=0.3 } )

forceBar:insert(onef)

forceBar:scale(1.2,.8)
forceBar.y=10
forceBar.x=-10


right:addEventListener("touch",t)
left:addEventListener("touch",t2)

jump:addEventListener( "touch",onDoubleTap )


twenty:addEventListener("touch",applytw)
fifty:addEventListener("touch",applyf)
hnd:addEventListener("touch",applyh)
onef:addEventListener("touch",applyonef)

forcebutton:addEventListener("touch",push)
firebutton:addEventListener("touch",shoot)
menu:addEventListener("touch",pausegame)
rsm:addEventListener("touch",resume)
btm:addEventListener("touch",backmenu)
rst:addEventListener("touch",restart)


end



function pausegame(event)

	--info.isVisible=true
	c.hideControls()

	PauseMenu()




end

function backmenu(event)

	storyboard.gotoScene("menu",sceneChangeEffect, sceneChangeTime)


end


function restart(event)


	if event.phase=="ended" then


		storyboard.gotoScene("restart",sceneChangeEffect, sceneChangeTime)

	end
end



function PauseMenu()

	pause.isVisible=true
	physics.start()
	physics.pause()



end



function resume(event)

	pause.isVisible=false
	physics.start()
	c.showControls()


end



c.KillControls=function()

pause:removeSelf()

right:removeEventListener("touch",t)
left:removeEventListener("touch",t2)

forcebutton:removeEventListener("touch",push)

firebutton:removeEventListener("touch",shoot)

forceBar:removeSelf()
end


return c
