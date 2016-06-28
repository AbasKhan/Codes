--define backgrounds


local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


local game;
local c={}

c.group = function(group)
	game = group
end


c.SetBackgrounds=function()

local sky = display.newImage( "store/background.png" )
sky.x = 240; sky.y = 80

local sky2 = display.newImage( "store/background.png" )
sky2.x = 785; sky2.y = 80

local sky3 = display.newImage( "store/background.png" )
sky3.x = 1330; sky3.y = 80


local sky31 = display.newImage( "store/background.png" )
sky31.x = 1750; sky31.y = 80


local sky5 = display.newImageRect( "store/dark.png",500,200 )
sky5.x = 648; sky5.y = 340

local sky6 = display.newImageRect( "store/dark.png",500,200 )
sky6.x = 1140; sky6.y = 340

local sky7 = display.newImageRect( "store/dark.png",500,200 )
sky7.x = 1600; sky7.y = 340

game:insert(sky3)
game:insert(sky31)
game:insert(sky2)
game:insert(sky)

game:insert(sky7)
game:insert(sky5)
game:insert(sky6)


end






c.SetGrounds=function()



ground = display.newImage( "store/dawnground 1.png")
ground.x = 220; ground.y = 335

ground.myName="ground"
physics.addBody( ground, "static", { friction=0.5, bounce=0.3 } )



gd = display.newImageRect( "store/down ground.png",1500,150 )
gd.x = 1200; gd.y = 530

gd.myName="ground"
gd.find="downground"
physics.addBody( gd, "static", { friction=0.5, bounce=0.3 } )




gril=display.newImageRect("store/11.png",300,50)
gril.x=605
gril.y=230
game:insert(gril)

ground1 = display.newImageRect( "store/down ground.png",820,50 )
ground1.x = 1150; ground1.y = 250
ground1.myName="ground"
physics.addBody( ground1, "static", { friction=0.5, bounce=0.3 } )
ground1.isVisible=false


strip = display.newImage("store/strip.png")
strip.x=910
strip.y=250

game:insert(strip)


strip1 = display.newImage("store/strip.png")
strip1.x=1210
strip1.y=250

game:insert(strip1)


strip2 = display.newImage("store/strip.png")
strip2.x=1550
strip2.y=250

game:insert(strip2)


wall = display.newImage( "store/img.png" )
wall.x = 1200; wall.y = 410
wall.myName="wallend"
physics.addBody( wall, "static", { friction=0.5, bounce=0.3 } )
game:insert(wall)



effect =display.newImage("store/downground2.png")
effect.x=440
effect.y=330


startwall = display.newImage("store/img.png")
startwall .x=-5
startwall .y=180
startwall.isSensor = true
startwall.myName="wall"
physics.addBody( startwall,"static",{density=3.0, friction=0.5, bounce=0.3 } )

game:insert(effect)






game:insert(ground1)
game:insert(ground)

game:insert(gd)


end








c.GetRoads=function()

road = display.newImage( "store/road.png" )
road.x = 168; road.y = 212
distance = 2

 road2 = display.newImage( "store/road.png" )
road2.x = 1000; road2.y = 220

road22 = display.newImage( "store/road.png" )
road22.x = 1550; road22.y = 220
game:insert(road22)

road21 = display.newImage( "store/road.png" )
road21.x = 1000; road21.y = 212


local road3 = display.newImage( "store/road.png" )
road3.x = 1750; road3.y = 212

local road4 = display.newImage( "store/road.png" )
road4.x = 1540; road4.y = 212



 road5 = display.newImage( "store/road.png" )
 road5.x = 240; road5.y = 439

 road6 = display.newImage( "store/road.png" )
 road6.x = 780; road6.y = 439

local road7 = display.newImage( "store/road.png" )
road7.x = 	1200; road7.y = 439

local road8 = display.newImage( "store/road.png" )
road8.x = 	1550; road8.y = 439


game:insert(road3)
game:insert(road)
game:insert(road2)
game:insert(road21)
game:insert(road4)
game:insert(road5)
game:insert(road6)
game:insert(road7)
game:insert(road8)



end





c.GetPuzzles=function()


ground2 = display.newImageRect( "store/support.png" ,35,50)
ground2.x = 410; ground2.y =180
ground2.myName="ground"
ground2.pos="platform"
ground2:rotate(90)
physics.addBody( ground2, "dynamic", { density=100000,friction=0.5, bounce=0.3 } )
game:insert(ground2)




ground21 = display.newImageRect( "store/support.png" ,35,50)
ground21.x = 750; ground21.y =180
ground21.myName="ground"
ground21.pos="platform"
ground21:rotate(90)
physics.addBody( ground21, "dynamic", { density=100000,friction=0.5, bounce=0.3 } )
game:insert(ground21)



roof = display.newImageRect( "store/platefrm.png" ,360,30)
roof.x = 580; roof.y =20
roof.myName="ground"
roof.pos="platform"
physics.addBody( roof, "dynamic", { density=7000,friction=.6} )
game:insert(roof)


trg1= display.newImageRect( "store/40 kg.png" ,50,50)
trg1.x = 500; trg1.y =-50
trg1.myName="crate"
--trg.pos="platform"
physics.addBody( trg1, "dynamic", { density=230,friction=1.7} )
trg1.angularVelocity = 0
game:insert(trg1)


trg2= display.newImageRect( "store/40 kg.png" ,50,50)
trg2.x = 530; trg2.y =-50
trg2.myName="crate"
--trg.pos="platform"
physics.addBody( trg2, "dynamic", { density=230,friction=1.7} )
trg2.angularVelocity = 0
game:insert(trg2)



trg3= display.newImageRect( "store/40 kg.png" ,50,50)
trg3.x = 515; trg3.y =-100
trg3.myName="crate"
--trg.pos="platform"
physics.addBody( trg3, "dynamic", { density=230,friction=1.7} )
trg2.angularVelocity = 0
game:insert(trg3)

end

















return c








