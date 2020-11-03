mutable struct World <: Composite
	gravity
end


function apply!(world::World, force::Vector)
	for body in world.bodies
		apply_force!(body, force, body.position)
	end
end