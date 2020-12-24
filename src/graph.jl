module Graph

"""
    NodeType

Holds types a Node can take.
"""
NodeType = Union{T, Nothing} where T

"""
    Node

Node type.
"""
mutable struct Node{T}
    name::T
    to::Dict{T, Float64}
    from::Dict{T, Float64}
    Node{T}(name) where T = new(name)
end

# function add(a::Node)

# end

# function test()
#     a = Node("A", [["B", 1], ["AA", 2]], ["C"])
# end

end