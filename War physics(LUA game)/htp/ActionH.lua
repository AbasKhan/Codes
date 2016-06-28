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








t.jmp=function ()

	--onearth=false



	if face =="right" then

	cr:setSequence( "man" )

		cr:setLinearVelocity( 80, -160 )


		elseif face=="left" then

		cr:setSequence( "man2" )
		cr:setLinearVelocity( -80, -160 )

		end

		cnt=cnt+1

      timer.performWithDelay( 1500, chx )


end


t.push=function()





	   if freeze == false then
	    	--timer.performWithDelay( 1000, revert )
			timer.performWithDelay( 1000, disappear )
		end



end



t.DoubleJump = function()

      jumping=false
	if face =="right" then

	cr:setSequence( "man" )

		cr:setLinearVelocity( 80, -150 )

		--onearth=false
		elseif face=="left" then

		cr:setSequence( "man2" )

		cr:setLinearVelocity( -80, -150 )

		end

end


t.shoot = function()


        score=score+(distance*10)
		--scoretext.text=score
        psh.isVisible = true
		timer.performWithDelay( 1000, disappear )

        bullet.x = cr.x +5
        bullet.y = cr.y
        bullet.myName="bullet"


        physics.addBody( bullet, { density=3.0, friction=0.2, bounce=0.05, radius=15 } )


        force_x = distance*100
        force_y = 0

        bullet:applyForce( force_x, force_y, bullet.x, bullet.y )
		counter=1

end







return t
