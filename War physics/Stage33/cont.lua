local c={}

c.hideControls=function()
left.isVisible=false
right.isVisible=false
jump.isVisible=false
firebutton.isVisible=false
forcebutton.isVisible=false
forceBar.isVisible=false
end


c.showControls=function()
left.isVisible=true
right.isVisible=true
jump.isVisible=true
firebutton.isVisible=true
forcebutton.isVisible=true
forceBar.isVisible=true
end

return c
