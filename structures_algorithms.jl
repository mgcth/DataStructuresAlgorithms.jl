module DS

using Random

export Node, RMHeap, add!, remove!, meld!

import Base.push!, Base.pop!

"""
    LinkedList

Linked list supertype
"""
abstract type LinkedList{T} end


"""
    NodeType

Holds types a Node can take.
"""
NodeType = Union{T, Nothing} where T


"""
    DynamicArray

A dynamic aray implementation. 
"""
mutable struct DynamicArray{T <: AbstractArray}
    size::Int64
    array::T
end


"""
    SLLNode

Single linked list node. Holds pointer to next node and some value.
"""
mutable struct SLLNode{T}
    next::SLLNode{T}
    value::T
    SLLNode{T}() where T = (x = new(); x.next = x; x)
    SLLNode{T}(y::T) where T = (x = new(); x.next = x; x.value = y; x)
    SLLNode{T}(n::SLLNode{T}, x::T) where T = new(n, x)
end

"""
    DLLNode

Double linked list node. Holds pointers to previous and next nodes and some value.
"""
mutable struct DLLNode{T}
    prev::DLLNode{T}
    next::DLLNode{T}
    value::T
    DLLNode{T}() where T = (x = new(); x.prev = x; x.next = x; x)
    DLLNode{T}(y::T) where T = (x = new(); x.prev = x; x.next = x; x.value = y; x)
    DLLNode{T}(p::DLLNode{T}, n::DLLNode{T}, x::T) where T = new(p, n, x)
end

"""
    SLinkedList

A single linked list implementation.
"""
mutable struct SLinkedList{T} <: LinkedList{T}
    node::SLLNode{T}
    size::Int
    SLinkedList{T}() where T = new(SLLNode{T}(), 1)
    SLinkedList{T}(x::T) where T = new(SLLNode{T}(x), 1)
end

"""
    DLinkedList

A double linked list implementation.
"""
mutable struct DLinkedList{T} <: LinkedList{T}
    node::DLLNode{T}
    size::Int
    DLinkedList{T}() where T = new(DLLNode{T}(), 1)
    DLinkedList{T}(x::T) where T = new(DLLNode{T}(x), 1)
end

"""
    addlast!(l, x)

Add node to last position in linked list.
"""
function addlast!(l::SLinkedList{T}, x::T) where T
    n = l.node
    l.size = l.size
    while n != n.next
        n = n.next
    end

    l.size += 1
    n.value = x
    n.next = SLLNode{T}()
    return nothing
end

function addlast!(l::DLinkedList{T}, x::T) where T
    n = l.node
    l.size = l.size
    while n != n.next
        n = n.next
    end

    l.size += 1
    n.value = x
    n.next = DLLNode{T}()
    n.next.prev = n
    return nothing
end

"""
    addfirst!(l, x)

Add node to first position in linked list.
"""
function addfirst!(l::DLinkedList{T}, x::T) where T
    n = l.node
    next = n.next
    n = DLLNode{T}(x)
    n.next = next
    l.size += 1
    return nothing
end

"""
    add!(l, x, pos = 0)

Add node to linked list.
"""
function add!(l::SLinkedList, x::T, pos::Int = l.size) where T
    n = l.node
    i = 1
    while i != pos
        n = n.next
        i += 1
    end

    next = n.next
    n = SLLNode{T}(x)
    n.next = next
    l.size += 1
    return nothing
end

function add!(l::DLinkedList, x::T, pos::Int = l.size) where T
    n = l.node
    i = 1
    while i != pos
        n = n.next
        i += 1
    end

    next = n.next
    prev = n.prev
    n = DLLNode{T}(x)
    n.next = next
    n.prev = prev
    l.size += 1
    return nothing
end

"""
    remove!(l)

Remove last node from linked list.
"""
function remove!(l::SLinkedList{T}) where T
    n = l.node
    p = l.node
    while n != n.next
        p = n
        n = n.next
    end

    @show p
    @show n

    p = SLLNode{T}()
    return nothing
end

size(l::LinkedList) = l.size

function test_slinkedlist(n)
    println("SLL Time to insert $n nodes:")
    l = SLinkedList{Float64}(1.0)
    @time for i in 2:n
        addlast!(l, convert(Float64, i))
    end

    println("SLL Time to insert one node in list with $(size(l)) nodes:")
    @time addlast!(l, 0.0)

    println("DLL Time to insert $n nodes:")
    l = DLinkedList{Float64}(1.0)
    @time for i in 2:n
        addlast!(l, convert(Float64, i))
    end

    println("Time to insert one node in list with $(size(l)) nodes:")
    @time addlast!(l, 0.0)
end


"""
    Stack

A simple stack interface based on Julia Arrays, i.e. dynamic arrays.
"""
struct Stack{T <: AbstractVector}
    data::T
end
#Stack{V}() where V = new(Array{V, 1}(undef, 0))

push!(s::Stack{Vector{T}}, x::T) where T = push!(s.data, x); return nothing
pop!(s::Stack{Vector{T}}) where T = pop!(s.data)#; return nothing
peek(s::Stack{Vector{T}}) where T = s.data[end];
size(s::Stack{Vector{T}}) where T = size(s.data)

function test_stack(n)
    s = Stack(Vector{Float64}(undef, 0))

    @time for i in 1:n
        push!(s, convert(Float64, i))
    end
    
    @time for i in 1:n
        pop!(s)
    end
end

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
    RMHeap

Randomised meldable heaps type.
"""
mutable struct RMHeap{T <: NodeType}
    root::Node{T}
    RMHeap{T}() where T = new(Node{T}())
end

getmin(item::RMHeap) = item.root

"""
    add!()

Function to add to the heap.
"""
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

function test_rmheap(n)
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
function merge!(array, array1::Array{T, 1}, array2::Array{T, 1}) where T
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
    return nothing
end

"""
    mergesort(array)
    
Mergesort algorithm with insertion sort at lowest level, O(nlogn).
"""
function mergesort(array)
    return mergesort(array, 1, length(array))
end

function mergesort(array, lo, hi)
    if hi - lo <= 60
        return insertionsort(array, lo + 1, hi)[lo:hi]
    else
        mid = lo + (hi - lo) ÷ 2
        array1 = mergesort(array, lo, mid)
        array2 = mergesort(array, mid + 1, hi)

        array_ = Array{Int}(undef, length(array1) + length(array2))
        merge!(array_, array1, array2)
        return array_
    end
end

function test_mergesort(n)
    a = rand((0:n), n)
    println("Merge sort of $n random items:")
    @time mergesort(a)

    a = rand((0:n), n)
    println("Built in sort of $n random items:")
    @time sort(a)
end

function test_insertionsort(n)
    a = rand((0:n), n)
    println("Merge sort of $n random items:")
    @time insertionsort(a)

    a = rand((0:n), n)
    println("Built in sort of $n random items:")
    @time sort(a)
end

end

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