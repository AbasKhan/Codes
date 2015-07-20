local game
local c ={}




c.group = function(group)
	game = group
end

c.SetBackgrounds=function()








local sky = display.newImage( "store/background.png" )
sky.x = 240; sky.y = 230

local sky2 = display.newImage( "store/background.png" )
sky2.x = 785; sky2.y = 230

local sky3 = display.newImage( "store/background.png" )
sky3.x = 1330; sky3.y = 230





local sky5 = display.newImageRect( "store/dark.png",500,200 )
sky5.x = 240; sky5.y = 450

local sky6 = display.newImageRect( "store/dark.png",500,200 )
sky6.x = 740; sky6.y = 450

local sky7 = display.newImageRect( "store/dark.png",500,200 )
sky7.x = 1330; sky7.y = 450


game:insert(sky3)
game:insert(sky2)
game:insert(sky)



game:insert(sky5)
game:insert(sky6)
game:insert(sky7)

end



c.SetGrounds=function()

startwall = display.newImage("store/img.png")
startwall .x=-5
startwall .y=180

startwall.myName="wall"
physics.addBody( startwall,"static",{density=3.0, friction=0.5, bounce=0.3 } )

startwall1 = display.newImage("store/img.png")
startwall1 .x=-5
startwall1 .y=280
startwall1.myName="ground"
physics.addBody( startwall1,"static",{density=3.0, friction=0.5, bounce=0.3 } )




local ground = display.newImageRect( "store/down ground.png",545,30 )
ground.x = -95; ground.y = 380
ground.isVisible=false
ground.myName="ground"
physics.addBody( ground, "static", { friction=0.5, bounce=0.3 } )




local ground5 = display.newImage( "store/down ground.png" )
ground5.x = 1400; ground5.y = 400
ground5.myName="ground"
physics.addBody( ground5, "static", { friction=0.5, bounce=0.3 } )





strip = display.newImage("store/strip.png")
strip.x=0
strip.y=380

game:insert(strip)




strip3 = display.newImage("store/strip.png")
strip3.x=1080
strip3.y=380

game:insert(strip3)


strip21 = display.newImage("store/strip.png")
strip21.x=180
strip21.y=580
strip21.myName="ground"
game:insert(strip21)
physics.addBody( strip21, "static", { friction=0.5, bounce=0.3 } )

strip31 = display.newImage("store/strip.png")
strip31.x=540
strip31.y=580
strip31.myName="ground"
game:insert(strip31)
physics.addBody( strip31, "static", { friction=0.5, bounce=0.3 } )



strip41 = display.newImage("store/strip.png")
strip41.x=870
strip41.y=580
strip41.myName="ground"
game:insert(strip41)
physics.addBody( strip41, "static", { friction=0.5, bounce=0.3 } )



game:insert(ground)
game:insert(ground5)

end




c.GetRoads=function()

 road = display.newImage( "store/road.png" )
road.x = -90; road.y = 345
distance = 2

 road2 = display.newImage( "store/11.png" )
road2.x = 340; road2.y = 355
road2:scale(.8,0.6)

local road3 = display.newImage( "store/road.png" )
road3.x = 1800; road3.y = 232

local road4 = display.newImage( "store/11.png" )
road4.x = 625; road4.y = 355
road4:scale(.8,0.6)

local road5 = display.newImage( "store/11.png" )
road5.x = 825; road5.y = 355
road5:scale(.8,0.6)

game:insert(road3)
game:insert(road)
game:insert(road2)
game:insert(road4)
game:insert(road5)


road1 = display.newImage( "store/road.png" )
road1.x = 240; road1.y = 548
distance = 2

 road21 = display.newImage( "store/road.png" )
road21.x = 780; road21.y = 548



local road41 = display.newImage( "store/road.png" )
road41.x = 1400; road41.y = 548

game:insert(road1)
game:insert(road21)
game:insert(road41)


end

return c
