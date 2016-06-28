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

		cr:setLinearVelocity( 0, -200 )


		elseif face=="left" then

		cr:setSequence( "man2" )
		cr:setLinearVelocity( 0, -200 )

		end

		cnt=cnt+1

      timer.performWithDelay( 1500, chx )


end


t.push=function()

	if ct.x>cr.x - 60 and cr.x > ct.x and face=="left" and freeze == false then
	--cr:play()s
	score=score+(distance*10)
	accel1.isVisible=true
	ct:applyLinearImpulse( -distance * 20000, 0, ct.x, ct.y )
	cr:setLinearVelocity( -120, 70)
	elseif crate4.x > cr.x-60 and crate4.x < cr.x and freeze == false then
	cr:play()
	score=score+(distance*10)
	accel1.isVisible=true
	crate4:applyLinearImpulse( -distance * 20000, 0, crate4.x, crate4.y )
	end

	if cr.x > ct.x-60 and cr.x < ct.x  and face=="right" and freeze == false then
	cr:setSequence( "push" )
    cr:play()
	score=score+(distance*10)
	accel.isVisible=true
	text.text="Force applied to a body accelarates the body in the direction of force depending on the force applied "
	--print(drag)





		if drag == false then
			text.isVisible=true
			physics.pause()
			freeze=true
			drag=true
			info.isVisible=true
			tell()
		end

	aero.isVisible=false


	--ct:applyForce( power, 800, ct.x, ct.y )
	ct:applyLinearImpulse( distance * 20000, 0, ct.x, ct.y )
	cr:setLinearVelocity( 120, 70)



	elseif cr.x > target1.x-60 and freeze == false then
		cr:setSequence( "push" )
        cr:play()
		score=score+(distance*10)
		target1:applyLinearImpulse( distance * 40, 0, target1.x, target1.y )
		--cr:setLinearVelocity( 120, 70)


	end

	   if freeze == false then
	    	timer.performWithDelay( 1000, revert )
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


t.shootBack = function()
 if cnt == chk and alive== true
	 then



        ebullet:rotate(-180)

        ebullet.x = enemy.x - 15
        ebullet.y = enemy.y -10
        ebullet.myName="ebullet"

        -- apply physics to the cannonball
        physics.addBody( ebullet, { density=3.0, friction=0.2, bounce=0.05, radius=15 } )

        force_x = -800
        force_y = -150

        ebullet:applyForce( force_x, force_y, ebullet.x, ebullet.y )
		cnt = cnt + 1
		timer.performWithDelay( 1000, chx )

	 end

end




return t
