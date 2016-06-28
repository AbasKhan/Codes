local controls=require("controls")
local t={}

t.applytw = function()
	distance=2
	power=80000
	transition.to(point,{x=80})
end

t.applyf = function ()
	distance=5
	power=120000
	transition.to(point,{x=110})
end

t.applyh =function ()
	distance=10
	power=140000
	transition.to(point,{x=140})
end

t.applyonef =function()
	distance=15
	power=160000
	transition.to(point,{x=174})
end


first=0

function chx()

chk = chk + 1

end


t.jmp=function ()

	--onearth=false



	if face =="right" then

	cr:setSequence( "man" )

		cr:setLinearVelocity( 80, -180 )


		elseif face=="left" then

		cr:setSequence( "man2" )
		cr:setLinearVelocity( -80, -180 )

		end

		cnt=cnt+1

     jump_time=timer.performWithDelay( 1500, chx )


end


t.push=function()




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



end



t.DoubleJump = function()

      jumping=false
	if face =="right" then

	cr:setSequence( "man" )

		cr:setLinearVelocity( 80, -180 )

		--onearth=false
		elseif face=="left" then

		cr:setSequence( "man2" )

		cr:setLinearVelocity( -80, -180 )

		end

end


t.shoot = function()


        score=score+(distance*10)
		--scoretext.text=score

		timer.performWithDelay( 1000, disappear )

		if face=="right" then
        bullet.x = cr.x +5
		psh.isVisible = true
		elseif face == "left" then
		bullet.x = cr.x -5
		psh1.isVisible = true
		end
        bullet.y = cr.y
        bullet.myName="bullet"

		Shape2 = { -11,-21, 11,-21, 11,21, -11,21 }

        physics.addBody( bullet, { density=3.0, friction=0.2, bounce=0.5, radius=15,shape=Shape2 } )


        force_x = distance*100
        force_y = 0
		if face =="right" then
		print(face)
        bullet:applyForce( force_x, force_y, bullet.x, bullet.y )
		bullet.angularVelocity=500

		elseif face =="left" then
		bullet:applyForce( -force_x, force_y, bullet.x, bullet.y )
		bullet.angularVelocity=-500
		end
		counter=1

end







return t
