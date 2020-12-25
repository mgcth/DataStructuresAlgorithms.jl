"""
    Stack

A simple stack interface based on Julia Arrays, i.e. dynamic arrays.
"""
struct Stack{T <: AbstractVector}
    data::T
end

"""
    push!(s, x)

Add element to top of the stack. Time complexity O(1).
"""
function push!(s::Stack{Vector{T}}, x::T) where T
    push!(s.data, x)
    return nothing
end

"""
    pop!(s)

Remove element from top of the stack. Time complexity O(1).
"""
pop!(s::Stack{Vector{T}}) where T = pop!(s.data)

"""
    peek(s)

Lookup top stack element, don't remove.
"""
peek(s::Stack{Vector{T}}) where T = s.data[end];

"""
    length(s)
    size(s)

Get size of stack.
"""
length(s::Stack{Vector{T}}) where T = length(s.data)
size(s::Stack{Vector{T}}) where T = length(s)

"""
    isempty(s)

Check if stack is empty.
"""
isempty(s::Stack{Vector{T}}) where T = size(s) == 0