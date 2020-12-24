BNodeType = Union{T, Nothing} where T

"""
    BNode

Binary node type.
"""
mutable struct BNode{T}
    key::BNodeType{T}
    left::BNode{T}
    right::BNode{T}
    BNode{T}() where T = (x = new(); x)
    BNode{T}(key) where T = (x = new(); x.key = key; x)
    BNode{T}(key, left, right) where T = new(key, left, right)
end

"""
    RMHeap

Randomised meldable heaps type.
"""
mutable struct RMHeap{T}
    root::BNode{T}
    RMHeap{T}() where T = new(BNode{T}())
end

getmin(item::RMHeap) = item.root

"""
    add!(rmheap, x)

Add to the heap.
"""
function add!(rmheap::RMHeap{T}, x::T) where T
    rmheap.root = meld(rmheap.root, BNode{T}(x))
    return nothing
end

"""
    remove(rmheap)

Remove minimum element from the heap.
"""
function remove(rmheap::RMHeap{T}) where T
    x = rmheap.root.key
    if !isdefined(rmheap, :left)
        rmheap = rmheap.root.right
        return x
    end
    if !isdefined(rmheap, :right)
        rmheap = rmheap.root.left
        return x
    end
    meld!(rmheap.root.left, rmheap.root.right)
    return x
end

"""
    meld!(rmheap, other)

Meld two heaps.
"""
function meld!(rmheap::RMHeap{T}, other::RMHeap{T}) where T
    rmheap.root = meld(rmheap.root, other.root)
    other.root = BNode{T}()
    return nothing
end

"""
    meld(node1, node2)

Meld two nodes.
"""
function meld(node1::BNode{T}, node2::BNode{T}) where T
    if ==(node1.key, nothing) return node2 end
    if ==(node2.key, nothing) return node1 end

    if node1.key > node2.key
        tmp = node1
        node1 = node2
        node2 = tmp
    end

    if rand((0, 1)) == 1
        if !isdefined(node1, :left) node1.left = BNode{T}() end
        node1.left = meld(node1.left, node2)
    else
        if !isdefined(node1, :right) node1.right = BNode{T}() end
        node1.right = meld(node1.right, node2)
    end

    return node1
end

function test_rmheap(n)
    r = RMHeap{Float64}()

    @time for i = 1:n
        add!(r, convert(Float64, i))
    end

    @time remove(r)

    # @time for i = 1:n
    #     remove(r)
    # end
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

function test_minpq(n)
    r = MinPQ{Int}()

    @time for i = 1:n
        add!(r, i)
    end

    @time add!(r, 1)
end