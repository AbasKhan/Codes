local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

--display ojects variables
local sg = {} --screen group of the scene
local textSize = 30 --size of the menu text
local menuItemDist = 40 --distance between items of menu
local textColor = 255 --text color of menu

local sceneChangeEffect = "fade"
local sceneChangeTime = 200

--display Objects
local playText
local optionsItem


local function onStartTouch(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("htp.ngame",sceneChangeEffect, sceneChangeTime)

	end
end

local function onStartTouch1(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("pendulum",sceneChangeEffect, sceneChangeTime)

	end
end

local function onStartTouch2(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("inertia",sceneChangeEffect, sceneChangeTime)

	end
end

local function onStartTouch3(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("potential_load",sceneChangeEffect, sceneChangeTime)

	end
end

local function onStartTouch4(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("gravity_load",sceneChangeEffect, sceneChangeTime)

	end
end


local function onStartTouch5(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("press_load",sceneChangeEffect, sceneChangeTime)

	end
end

local function onStartTouch6(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("vir_load",sceneChangeEffect, sceneChangeTime)

	end
end

local function onStartTouch7(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("vir2",sceneChangeEffect, sceneChangeTime)

	end
end

local function onStartTouch8(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("forceload",sceneChangeEffect, sceneChangeTime)

	end
end


local function onStartTouch9(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("introduction",sceneChangeEffect, sceneChangeTime)

	end
end

local function onStartTouch91(self,event)
	if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("menu",sceneChangeEffect, sceneChangeTime)

	end
end



function scene:createScene( event )


	sg = self.view --set screen group to scene's display group
	h=display.contentHeight
	w=display.contentWidth
	bck = display.newImageRect("store/level menu background.png",w,h)
	bck.x=240
	bck.y=160
	sg:insert(bck)


local path = system.pathForFile( "Unlocked Stages/Stage1.txt")

local file = io.open( path, "r" )
local savedData = file:read( "*n" )

io.close( file )
print(savedData)


	htp= display.newImageRect("store/level pic.png",60,60)
	htp.x=70
	htp.y=65
	htp.touch = onStartTouch
	sg:insert(htp)



	htp1= display.newImageRect("store/3.png",60,60)
	htp1.x=245
	htp1.y=65
	htp1.touch = onStartTouch1
	htp1.isVisible=false
	sg:insert(htp1)

	htp2= display.newImageRect("store/9.png",60,60)
	htp2.x=420
	htp2.y=65
	htp2.touch = onStartTouch2
	htp2.isVisible=false
	sg:insert(htp2)

	htp3= display.newImageRect("store/7.png",60,60)
	htp3.x=335
	htp3.y=65
	htp3.touch = onStartTouch3
	htp3.isVisible=false
	sg:insert(htp3)

	htp4= display.newImageRect("store/6.png",60,60)
	htp4.x=70
	htp4.y=155
	htp4.touch = onStartTouch4
	htp4.isVisible=false
	sg:insert(htp4)

	htp5= display.newImageRect("store/10.png",60,60)
	htp5.x=160
	htp5.y=155
	htp5.touch = onStartTouch5
	htp5.isVisible=false
	sg:insert(htp5)

	htp6= display.newImageRect("store/8.png",60,60)
	htp6.x=335
	htp6.y=155
	htp6.touch = onStartTouch6
	htp6.isVisible=false

	sg:insert(htp6)

	htp7= display.newImageRect("store/14.png",60,60)
	htp7.x=245
	htp7.y=155
	htp7.touch = onStartTouch7
	htp7.isVisible=false

	sg:insert(htp7)

	htp8=display.newImageRect("store/1.png",60,60)
	htp8.x=160
	htp8.y=65
	htp8.touch = onStartTouch8
	htp8.isVisible=false

	sg:insert(htp8)


	htp9=display.newImageRect("store/1.png",60,60)
	htp9.x=420
	htp9.y=155
	htp9.touch = onStartTouch9


	sg:insert(htp9)

	htp91=display.newImageRect("store/bck1.png",60,60)
	htp91.x=420
	htp91.y=255
	htp91.touch = onStartTouch91


	sg:insert(htp91)



	if savedData > 1 then

		htp1.isVisible=true

			if savedData > 2 then
				htp2.isVisible=true

				end

			if savedData > 3 then
				htp3.isVisible=true

				end

			if savedData > 4 then
				htp4.isVisible=true

				end

			if savedData > 5 then
				htp5.isVisible=true

				end

			if savedData > 6 then
				htp6.isVisible=true

				end
				if savedData > 7 then
				htp7.isVisible=true

				end

				if savedData > 8 then
				htp8.isVisible=true

				end



				end






end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	storyboard.state.score = 0

	htp:addEventListener("touch", htp)
	htp1:addEventListener("touch", htp1)
	htp2:addEventListener("touch", htp2)
	htp3:addEventListener("touch", htp3)
	htp4:addEventListener("touch", htp4)
	htp5:addEventListener("touch", htp5)
	htp6:addEventListener("touch", htp6)
	htp7:addEventListener("touch", htp7)
	htp8:addEventListener("touch", htp8)
	htp9:addEventListener("touch", htp9)
	htp91:addEventListener("touch", htp91)
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	htp:removeEventListener("touch", htp)
	htp1:removeEventListener("touch", htp1)
	htp2:removeEventListener("touch", htp2)
	htp3:removeEventListener("touch", htp3)
	htp4:removeEventListener("touch", htp4)
	htp5:removeEventListener("touch", htp5)
	htp6:removeEventListener("touch", htp6)
	htp7:removeEventListener("touch", htp7)
	htp8:removeEventListener("touch", htp8)
	htp9:removeEventListener("touch", htp9)
	htp91:removeEventListener("touch", htp91)

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	-----------------------------------------------------------------------------

	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)

	-----------------------------------------------------------------------------

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
