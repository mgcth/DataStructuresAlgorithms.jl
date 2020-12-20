module DS

using Random

export Node, RMHeap, add!, remove!, meld!

"""
    NodeType

Holds types a Node can take.
"""
NodeType = Union{T, Nothing} where T

"""
    Node

Node type.
"""
mutable struct Node{T <: NodeType}
    key::T
    left::Node{T}
    right::Node{T}
    Node{T}() where T = new()
    Node{T}(key) where T = new(key)
    Node{T}(key, left, right) where T = new(key, left, right)
end

"""
    Stack

A simple stack interface based on Julia Arrays.
"""
mutable struct Stack{T}
    data::Array{T, 1}
end

#push!(s::Stack{T}, x::T) where T = push!(s.data, x)#; return nothing
pop!(s::Stack{T}) where T = pop!(s.data)#; return nothing
peek(s::Stack{T}) where T = s.data[end];
size(s::Stack{T}) where T = size(s.data)


"""
    RMHeap

Randomised meldable heaps.
"""
mutable struct RMHeap{T <: NodeType}
    root::Node{T}
    RMHeap{T}() where T = new(Node{T}())
end

getmin(item::RMHeap) = item.root

function add!(rmheap::RMHeap{T}, x::T) where {T <: NodeType}
    rmheap.root = meld(rmheap.root, Node{T}(x))
    return nothing
end

function remove(rmheap::RMHeap{T}) where{T <: NodeType}
    x = rmheap.root.key
    meld(rmheap.left, rmheap.right)
    return x
end

function meld!(rmheap::RMHeap{T}, other::RMHeap{T}) where{T <: NodeType}
    rmheap.root = meld!(rmheap.root, other.root)
    other.root = nothing
    return nothing
end

function meld(node1::Node{T}, node2::Node{T}) where{T <: NodeType}
    if !isdefined(node1, :key) return node2 end
    if !isdefined(node2, :key) return node1 end

    if node1.key > node2.key
        tmp = node1
        node1 = node2
        node2 = tmp
    end

    if rand((0, 1)) == 1
        if !isdefined(node1, :left) node1.left = Node{T}() end
        node1.left = meld(node1.left, node2)
    else
        if !isdefined(node1, :right) node1.right = Node{T}() end
        node1.right = meld(node1.right, node2)
    end

    return node1
end

function test(n)
    r = RMHeap{NodeType}()

    for i = 1:n
        add!(r, i)
    end
end

"""
    MinPQ

Binary heap minimum priority queue.
"""
mutable struct MinPQ{T}
    pq::Array{T, 1}
    N::Int
    MinPQ{T}(n::Int) where T = new(Array{T}(undef, n), n)
    MinPQ{T}() where T = new(Array{T}(undef, 0), 0)
end

isempty(pq::MinPQ) = pq.N == 0
getmin(pq::MinPQ) = pq.pq[1]
greater(pq::MinPQ, i::Int, j::Int) = pq.pq[i] > pq.pq[j]

function add!(pq::MinPQ, x::T) where T
    pq.N += 1
    push!(pq.pq, x)
    swim!(pq, pq.N)

    return nothing
end

function swim!(pq::MinPQ, k::Int)
    while k > 1 && greater(pq, k ÷ 2, k)
        tmp = pq.pq[k ÷ 2]
        pq.pq[k ÷ 2] = pq.pq[k]
        pq.pq[k] = tmp
        k = k ÷ 2  
    end

    return nothing
end

function removemin(pq::MinPQ)
    min = pq.pq[1]
    pq.pq[1] = pq.pq[pq.N]
    pq.pq[pq.N] = min
    pop!(pq.pq)
    pq.N -= 1
    sink(pq, 1)
    return min
end

function sink!(pq::MinPQ, k::Int)
    while 2k <= pq.N
        j = 2k
        if j < pq.N && greater(pq, j, j + 1) j += 1 end
        if !greater(pq, k, j) break end
        tmp = pq.pq[k]
        pq.pq[k] = pq.pq[j]
        pq.pq[j] = tmp
        k = j
    end

    return nothing
end

function testMinPQ(n)
    r = MinPQ{NodeType}()

    for i = 1:n
        add!(r, i)
    end
end

end


module Search

function linearsearch(array, item)
    for i in 1:length(array)
        if array[i] == item
            return i
        end
    end

    return zero(item)
end

function binarysearch(array, item)
    lo = 1
    hi = length(array)

    while lo <= hi
        mid = lo + (hi - lo) ÷ 2

        if item < array[mid]
            hi = mid-1
        elseif item > array[mid]
            lo = mid+1
        else
            return mid
        end
    end

    return zero(item)
end

function binarysearch_index(array, item)
    lo = 1
    hi = length(array)
    mid = 1

    while lo <= hi
        mid = lo + (hi - lo) ÷ 2

        if item < array[mid]
            hi = mid-1
        elseif item > array[mid]
            lo = mid+1
        else
            return mid
        end
    end

    return mid
end

end


module Sort

"""
    selectionsort(array)

A selection sort algorithm, O(n^2).
"""
function selectionsort(array)
    for i in 1:length(array)
        min = Inf
        k = 1
        for j in i:length(array)
            if array[j] < min
                min = array[j]
                k = j
            end
        end
        tmp = array[k]
        array[k] = array[i]
        array[i] = tmp
    end

    return array
end

"""
    insertionsort(array, lo = 2, hi = length(array))

Insertion sort with linear search, O(n^2), but best case O(n). Fast for small arrays.
"""
function insertionsort(array, lo = 2, hi = length(array))
    i = lo
    while i <= hi
        j = i
        while j > lo-1 && array[j-1] > array[j]
            tmp = array[j]
            array[j] = array[j-1]
            array[j-1] = tmp
            j -= 1
        end
        i += 1
    end

    return array
end

"""
    merge(array1, array2)
"""
function merge(array1::Array{T, 1}, array2::Array{T, 1}) where T
    array = Array{T}(undef, length(array1) + length(array2))

    i = 1; j = 1; k = 1
    while j <= length(array1) && k <= length(array2)
        if array1[j] < array2[k]
            array[i] = array1[j]
            j += 1
        else
            array[i] = array2[k]
            k += 1
        end

        i += 1
    end

    array[i:end] = [array1[j:end]; array2[k:end]]
    return array
end

"""
    mergesort(array)
    
Mergesort algorithm with insertion sort at lowest level, O(nlogn).
"""
function mergesort(array)
    return mergesort(array, 1, length(array))
end

function mergesort(array, lo, hi)
    if hi - lo <= 2
        return insertionsort(array, lo + 1, hi)[lo:hi]
    else
        mid = lo + (hi - lo) ÷ 2
        array1 = mergesort(array, lo, mid)
        array2 = mergesort(array, mid + 1, hi)

        return merge(array1, array2)
    end
end

module Graph



end