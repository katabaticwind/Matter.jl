mutable struct Bounds
	min
	max
end

function Bounds(vertices)
	b = Bounds(Vector(0., 0.), Vector(0., 0.))
	update!(b, vertices)
	return b
end

# TODO velocity
function update!(b::Bounds, vertices)
	b.min.x = Inf
	b.max.x = -Inf
	b.min.y = Inf
	b.max.y = -Inf

	for vertex in vertices
		if (vertex.x > b.max.x) b.max.x = vertex.x end
		if (vertex.x < b.min.x) b.min.x = vertex.x end
		if (vertex.y > b.max.y) b.max.y = vertex.y end
		if (vertex.y < b.min.y) b.min.y = vertex.y end
	end
end

function contains!(b::Bounds, point::Vector)
	return (
			point.x >= b.min.x && point.x <= bounds.max.x &&
			point.y >= b.min.y && point.y <= bounds.max.y
			)
end

function overlaps!(boundsA::Bounds, boundsB::Bounds)
	return (boundsA.min.x <= boundsB.max.x && boundsA.max.x >= boundsB.min.x
			&& boundsA.max.y >= boundsB.min.y && boundsA.min.y <= boundsB.max.y)
end

function translate!(b::Bounds, v::Vector)
	b.min += v
	b.max += v
end

function shift!(b::Bounds, pos::Vector)
	delta = b.max - b.min
	b.min = position
	b.max = position + delta
end
