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


local function slevel(event)

if event.phase == "ended" then
		print("start game pressed")
	--storyboard.gotoScene("loading",sceneChangeEffect, sceneChangeTime)
	storyboard.gotoScene("select",sceneChangeEffect, sceneChangeTime)

	end

end

local function resume(event)

	if event.phase=="ended" then


		--local stage="select"
		local path = system.pathForFile( "current_stage.txt")

		local file = io.open( path, "r" )
		local stage = file:read( "*a" )

		io.close( file )

		storyboard.gotoScene(stage,sceneChangeEffect,sceneChangeTime)


	end
end

local function teach(event)

	if event.phase=="ended" then




		storyboard.gotoScene("detail",sceneChangeEffect,sceneChangeTime)


	end
end


local function Exit(event)

if event.phase == "ended" then
		os.exit()

	end

end



function scene:createScene( event )

	sg = self.view --set screen group to scene's display group

	h=display.contentHeight
	w=display.contentWidth



	bck = display.newImageRect("store/mnu.jpg",w,h)
	bck.x=240
	bck.y=170
	sg:insert(bck)

	playText=display.newImage("store/new game.png")
	playText.x=390
	playText.y=55
	playText.touch = onStartTouch
	sg:insert(playText)

	Rsm=display.newImage("store/resume game.png")
	Rsm.x=390
	Rsm.y=105
	sg:insert(Rsm)

	SelectLevel=display.newImage("store/select level.png")
	SelectLevel.x=390
	SelectLevel.y=165
	sg:insert(SelectLevel)

	Option=display.newImage("store/in.png")
	Option.x=390
	Option.y=225
	sg:insert(Option)


	Quit=display.newImage("store/quit.png")
	Quit.x=390
	Quit.y=275
	sg:insert(Quit)


end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	storyboard.removeAll()
	storyboard.state.score = 0
	playText:addEventListener("touch", playText)
	SelectLevel:addEventListener("touch",slevel)
	Rsm:addEventListener("touch",resume)
	Option:addEventListener("touch",teach)
	Quit:addEventListener("touch",Exit)

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	playText:removeEventListener("touch", playText)
	SelectLevel:removeEventListener("touch",slevel)
	Quit:removeEventListener("touch",Exit)
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
