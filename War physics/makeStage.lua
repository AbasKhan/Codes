local c={}
local game

c.getGroup=function(group)

game=group
print("hello")

end



c.background=function()


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



c.grounds=function()

local ground = display.newImage( "store/dawnground 1.png")
ground.x = 220; ground.y = 335

ground.myName="ground"
physics.addBody( ground, "static", { friction=0.5, bounce=0.3 } )



local gd = display.newImageRect( "store/down ground.png",1500,150 )
gd.x = 1200; gd.y = 530

gd.myName="ground"
physics.addBody( gd, "static", { friction=0.5, bounce=0.3 } )




local gril=display.newImageRect("store/11.png",300,50)
gril.x=605
gril.y=230
game:insert(gril)

 local ground1 = display.newImageRect( "store/down ground.png",820,50 )
ground1.x = 1150; ground1.y = 250
ground1.myName="ground"
physics.addBody( ground1, "static", { friction=0.5, bounce=0.3 } )
ground1.isVisible=false


local strip = display.newImage("store/strip.png")
strip.x=910
strip.y=250

game:insert(strip)


local strip1 = display.newImage("store/strip.png")
strip1.x=1210
strip1.y=250

game:insert(strip1)


local strip2 = display.newImage("store/strip.png")
strip2.x=1550
strip2.y=250

game:insert(strip2)


local wall = display.newImage( "store/img.png" )
wall.x = 1200; wall.y = 410
wall.myName="wallend"
physics.addBody( wall, "static", { friction=0.5, bounce=0.3 } )



game:insert(wall)

game:insert(ground1)
game:insert(ground)

game:insert(gd)



end


c.roads=function()

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



return c
