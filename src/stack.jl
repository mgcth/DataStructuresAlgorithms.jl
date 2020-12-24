"""
    Stack

A simple stack interface based on Julia Arrays, i.e. dynamic arrays.
"""
struct Stack{T <: AbstractVector}
    data::T
end

"""
    push!(s, x)

Add element at top of the stack.
"""
function push!(s::Stack{Vector{T}}, x::T) where T
    push!(s.data, x)
    return nothing
end

"""
    pop!(s)

Remove element from top of the stack.
"""
pop!(s::Stack{Vector{T}}) where T = pop!(s.data)

"""
    peek(s)

Lookup top stack element, don't remove.
"""
peek(s::Stack{Vector{T}}) where T = s.data[end];

"""
    size(s)

Get size of stack.
"""
size(s::Stack{Vector{T}}) where T = length(s.data)

"""
    isempty(s)

Check if stack is empty.
"""
isempty(s::Stack{Vector{T}}) where T = size(s) == 0