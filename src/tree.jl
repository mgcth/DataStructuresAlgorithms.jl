"""
    BSTNode

Binary node.
"""
mutable struct BSTNode{S,T}
    key::Union{S, Nothing}
    value::Union{T, Nothing}
    left::Union{BSTNode{S,T}, Nothing}
    right::Union{BSTNode{S,T}, Nothing}
    size::Int
    BSTNode{S,T}() where {S,T} = new(nothing, nothing, nothing, nothing, 0)
    BSTNode{S,T}(k::S, v::T) where {S,T} = new(k, v, nothing, nothing, 0)
    BSTNode{S,T}(k::S, v::T, size::Int) where {S,T} = new(k, v, nothing, nothing, size)
    BSTNode{S,T}(k::S, v::T, l::BSTNode{S,T}) where {S,T} = new(k, v, l, nothing, 0)
    BSTNode{S,T}(k::S, v::T, l::BSTNode{S,T}, r::BSTNode{S,T}) where {S,T} = new(k, v, l, r, 0)
end

"""
    BST

Binary search tree. Does not support duplicate keys.
"""
mutable struct BST{S,T}
    root::Union{BSTNode{S,T}, Nothing}
    size::Int
    BST{S,T}() where {S,T} = x = new(BSTNode{S,T}(), 0)
end

"""
    get!(bst, key)
    get!(node, key)

Get item from tree given key. Time complexity O(logn), worst O(n).
"""
get!(bst::BST{S,T}, key::S) where {S,T} = get!(bst.root, key)
get!(bst::BST{S,T}, key::S, parent) where {S,T} = get!(bst.root, key, parent)
function get!(node::BSTNode{S,T}, key::S) where {S,T}
    if node.key === nothing
        return nothing
    elseif key < node.key
        return get!(node.left, key)
    elseif key > node.key
        return get!(node.right, key)
    else
        return node.value
    end
end

"""
    put!(bst, key, value)
    put!(node, key, value)

Put item into tree. Time complexity O(logn), worst O(n).
"""
function put!(bst::BST{S,T}, key::S, value::T) where {S,T}
    bst.root = put!(bst.root, key, value)
    bst.size = size(bst.root)
    return nothing
end

function put!(node::Union{BSTNode{S,T}, Nothing}, key::S, value::T) where {S,T}
    if node === nothing || node.key === nothing
        return BSTNode{S,T}(key, value, 1)
    elseif key < node.key
        node.left = put!(node.left, key, value)
    elseif key > node.key
        node.right = put!(node.right, key, value)
    else
        node.value = value
    end

    node.size = (node.left !== nothing ? size(node.left) : 0) +
                (node.right !== nothing ? size(node.right) : 0) +
                1
    return node
end

"""
    delete!(bst, key)
    delete!(node, parent, key)

Remove node from tree. Time complexity O(logn), worst O(n).

Implements two versions. First is based on lecutre slides (my implementation) with one traversal to find maximum node. The other is the Hibbard deletion which makes two traversals to find and delete maximum node. The Hibbard is much slower.
"""
function delete!(bst::BST{S,T}, key::S) where {S,T}
    delete!(bst.root, bst.root, key)
    #bst.root = delete!(bst.root, key) # Hibbard deletion
    bst.size = bst.root === nothing ? 0 : size(bst.root)
    return nothing
end

# imlemented as outlined as non-code in slides following several rules/cases,
# not the best implementation and not sure about size
# Hibbard deletion should be better
function delete!(node::Union{BSTNode{S,T}, Nothing}, parent::Union{BSTNode{S,T}, Nothing}, key::S) where {S,T}
    if node === nothing return nothing end

    # check this first, if last very extremely slow due to many recursion calls
    if node.key < key
        delete!(node.right, node, key)
    elseif node.key > key
        delete!(node.left, node, key)
    else
        if node.left === nothing && node.right === nothing
            setparent!(parent, node)
        elseif node.left === nothing
            setparent!(parent, node, node.right)
        elseif node.right === nothing
            setparent!(parent, node, node.left)
        else
            n, p = maximum_node(node.left, node)
            
            #if n.left === nothing
            #    node.key = n.key
            #    node.value = n.value
            #else
                node.key = n.key
                node.value = n.value
            #end
            setparent!(p, n)
        end
    end
    
    node.size = (node.left !== nothing ? size(node.left) : 0) +
                (node.right !== nothing ? size(node.right) : 0) +
                1

    return nothing
end

function setparent!(p, n, v = nothing)
    if p.left == n
        p.left = v
    elseif p.right == n
        p.right = v
    else
        p = v
    end
    return nothing
end

# Hibbard deletion, from sedgewick and wayne algorithms
function delete!(
    node::Union{BSTNode{S,T}, Nothing},
    key::S
) where {S,T}
    if node === nothing return nothing end
    
    if key < node.key
        node.left = delete!(node.left, key)
    elseif key > node.key
        node.right = delete!(node.right, key)
    else
        if node.right === nothing return node.left end
        if node.left === nothing return node.right end
        t = node
        
        node = maxx(t.left) # 1st traversal
        node.left = deletemax!(t.left) # 2nd traversal
        node.right = t.right
    end
    
    node.size = (node.left !== nothing ? size(node.left) : 0) +
                (node.right !== nothing ? size(node.right) : 0) +
                1
    return node
end

"""
    deletemax!(n::BSTNode)

Help function for Hibbard deletion.
"""
function deletemax!(node::BSTNode)
    if node.right === nothing return node.left end
    node.right = deletemax!(node.right)
    node.size = (node.left !== nothing ? size(node.left) : 0) +
                (node.right !== nothing ? size(node.right) : 0) +
                1
    return node
end

"""
    maximum_node(node, parent)

Find maximum node and its parent.
"""
function maximum_node(node::BSTNode, parent::BSTNode)
    if node.right !== nothing
        node.size -= 1
        node, parent = maximum_node(node.right, node)
    end

    return node, parent
end

"""
    printsort(bst)

Print binary search tree in order.
"""
printsort(bst::BST) = printsort(bst.root)
function printsort(node::BSTNode)
    if node.key === nothing return nothing end

    if node.left !== nothing printsort(node.left) end
    print(" $(node.key) ")
    if node.right !== nothing printsort(node.right) end
end

# """
#     iterate(l, n)

# Iterate over a linked list.
# """
# function iterate(bst::Union{BST{S,T}, BSTNode{S,T}}, r = bst.root) where {S,T}
#     @show r.key
#     if isdefined(r, :left)
#         return r = (r.key, r.left)
#     end
#     if isdefined(r, :right)
#         return r = (r.key, r.right)
#     end
#     #r = nothing
# end

# Could we use iterate to get this?
"""
    collect(bst, l)
    collect(bst, l)

Return a list of BST keys in order.
"""
function collect(bst::BST)
    l = Vector{eltype(bst)}(undef, 0)
    collect(bst.root, l)
    l
end

function collect(node::BSTNode, l)
    if node.key === nothing return nothing end

    if node.left !== nothing collect(node.left, l) end
    push!(l, node.key)
    if node.right !== nothing collect(node.right, l) end
end

"""
    eltype(type)

Type of key elements.
"""
eltype(::BST{S,T}) where {S,T} = S

"""
    length(bst)
    size(bst)
    size(node)

Size of BST or node.
"""
length(bst::BST) = bst.size
size(bst::BST) = length(bst)
size(n::BSTNode) = n.size

"""
    minx(bst)
    minx(node)

Find minimum node.
"""
minx(bst::BST) = minx(bst.root)
function minx(node::BSTNode) 
    if node.left === nothing
        return node
    end

    return minx(node.left)
end

"""
    maxx(bst)

Find maximum node.
"""
maxx(bst::BST) = maxx(bst.root)
function maxx(node::BSTNode)
    if node.right === nothing
        return node
    end

    return maxx(node.right)
end

"""
    isbst(node)

Check if tree is a BST, i.e. if the invariant holds.
"""
isbst(bst::BST) = isbst(bst.root)
function isbst(node::Union{BSTNode, Nothing})
    if node === nothing return true end

    if node.left !== nothing
        if node.left.key < node.key
            isbst(node.left)
        else
            return false
        end
    end
    if node.right !== nothing
        if node.right.key > node.key
            isbst(node.right)
        else
            return false
        end
    end

    return true
end