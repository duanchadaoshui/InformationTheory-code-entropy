#=
data struct 2bitTree
=#

mutable struct Nodes
	weight::Real
	char::String
	# code::String
	leftchild::Nodes
	rightchild::Nodes
	parentn::Nodes
	function Nodes(w::Real,c)
		x = new();
		x.weight = w
		x.char = string(c)
		x.leftchild = x
		x.rightchild = x
		x.parentn = x	
		return x
	end
	function Nodes(w::Real,c,left::Nodes,right::Nodes)
		x = new();
		x.weight = w
		x.char = string(c)
		x.leftchild = left
		x.rightchild = right
		x.parentn = x
	    return x
	end
	# function Nodes(w::Real,c::String,)
	    
	# end
end

function initnodes(p1,c::String)
    v = sortperm(vec(p1),rev=true)
	p1 = p1[v]
	c = c[v]
	tr = []
	for i = 1:length(p1)
		push!(tr,Nodes(p1[i],c[i]))
	end
	return p1,c,tr
end

#=
input array{Nodes}
array has been sorted from big to small
return n::Nodes
=#
function creathfmtree!(tr)::Nodes
	while length(tr)!=1
		min1 = pop!(tr)
		min2 = pop!(tr)
		tmp = Nodes(min1.weight+min2.weight, min1.char*min2.char, min1, min2)# leftchild is smaller than rightchild
		min1.parentn = tmp
		min2.parentn = tmp
		push!(tr,tmp)
		nodessort!(tr)
	end
	return tr[1]
	#=while length(tr) == 1
	# 1.pop 后两个，即最小的两个
	# 2.生成新的Nodes
	# 3.push 新的Nodes
	# 4.排序
    =#
end
#=
input array{Nodes}
根据数组中每个nodes的weight排序
output new array
=#
function nodessort!(tr)
    p = [x.weight for x in tr]
    v = sortperm(p,rev=true)
    tr[1:end] = tr[v]
    return tr
end