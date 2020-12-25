"""
    BNKeyType

Keys can hold value of type T or nothing.
"""
BSTNKeyType = Union{T, Nothing} where T

"""
    BSTNode

Binary node.
"""
mutable struct BSTNode{S,T}
    key::BSTNKeyType{S}
    value::BNKeyType{T}
    left::BSTNode{S,T}
    right::BSTNode{S,T}
    BSTNode{S,T}() where {S,T} = (x = new(); x)
    BSTNode{S,T}(k::BNKeyType{S}, v::BNKeyType{T}) where {S,T} = (x = new(); x.key = k; x.value = v; x)
    BSTNode{S,T}(k::BNKeyType{T}, v::BNKeyType{T}, l::BSTNode{S,T}, r::BSTNode{S,T}) where {S,T} = new(k, v, l, r)
end

"""
    BST

Binary search tree.
"""
mutable struct BST{S,T}
    root::BSTNode{S,T}
    BST{S,T}() where {S,T} = x = new(BSTNode{S,T}())
end

"""
    get!(bst, key)
    get!(node, key)

Get item from tree given key.
"""
get!(bst::BST{S,T}, key::S) where {S,T} = get!(bst.root, key)
get!(bst::BST{S,T}, key::S, parent) where {S,T} = get!(bst.root, key, parent)
function get!(node::BSTNode{S,T}, key::S) where {S,T}
    if node.key == nothing
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

Put item into tree.
"""
put!(bst::BST{S,T}, key::S, value::T) where {S,T} = bst.root = put!(bst.root, key, value)
function put!(node::BSTNode{S,T}, key::S, value::T) where {S,T}
    if node.key == nothing
        return BSTNode{S,T}(key, value)
    elseif key < node.key
        if !isdefined(node, :left) node.left = BSTNode{S,T}() end
        node.left = put!(node.left, key, value)
    elseif key > node.key
        if !isdefined(node, :right) node.right = BSTNode{S,T}() end
        node.right = put!(node.right, key, value)
    else
        node.value = value
    end

    return node
end

"""
    remove(bst, key)
    remove(node, key)

Remove node from tree.
"""
remove(bst::BST{S,T}, key::S) where {S,T} = remove(bst.root, key)
function remove(node::BSTNode{S,T}, key::S) where {S,T}

end

"""
    printsort(bst)

Print binary search tree in order.
"""
printsort(bst::BST) = printsort(bst.root)
function printsort(node::BSTNode)
    if node.key == nothing return nothing end

    if isdefined(node, :left) printsort(node.left) end
    print(" $(node.key) ")
    if isdefined(node, :right) printsort(node.right) end
end

"""
    iterate(l, n)

Iterate over a linked list.
"""
function iterate(bst::Union{BST{S,T}, BSTNode{S,T}}, r = bst.root) where {S,T}
    r = 0
    if isdefined(r, :left) return r = (r.key, r.left) end
    if isdefined(r, :right) return r = (r.key, r.right) end
    r = nothing
end

function inorder()

end

"""
    eltype(type)

Type of elements generated by iteration over a linked list.
"""
eltype(::BST{S,T}) where {S,T} = T

#minimum(bst) = minimum(bst.root)
#minimum(node) = 1
#maximum(bst)