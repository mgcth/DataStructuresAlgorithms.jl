"""
    DynamicArray

A dynamic aray implementation. 
"""
mutable struct DynamicArray{T}
    size::Int
    capacity::Int
    data::AbstractVector{T}
    DynamicArray{T}() where T = new(0, 0, Vector{T}(undef, 0))
end

"""
    push!(a, x)

Add new element x to end of existing array a.
"""
function push!(a::DynamicArray{T}, x::T) where T
    if a.size >= a.capacity
        a.capacity = a.capacity == 0 ? 1 : a.capacity
        resize!(a, a.capacity * 2)
    end

    a.size += 1
    a[a.size] = x

    return nothing
end

"""
    pop!(a)

Remove last element from array a.
"""
function pop!(a::DynamicArray)
    x = a[a.size]
    a.size -= 1

    if a.size <= a.capacity ÷ 4
        resize!(a, a.capacity ÷ 2)
    end

    return x
end

"""
    getindex(a, i)

Get element from array a at index i.
"""
function getindex(a::DynamicArray, i::Int)
    i <= a.size || throw(BoundsError(a, i))

    return a.data[i]
end

"""
    setindex!(a, x, i)

Set array a at index i to x.
"""
setindex!(a::DynamicArray{T}, x::T, i::Int) where T = (a.data[i] = x)

"""
    size(a)

Get size of dynamic array.
"""
size(a::DynamicArray) = a.size

"""
    resize!(a, n)

Resize the array.
"""
resize!(a::DynamicArray, n::Int) = (a.capacity = n; resize!(a.data, n))

"""
    isempty(a)

Check if array is empty.
"""
isempty(a::DynamicArray) = size(a) == 0