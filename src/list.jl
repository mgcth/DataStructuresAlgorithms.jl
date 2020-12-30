"""
    LinkedList

Linked list abstract supertype.
"""
abstract type LinkedList{T} end

"""
    LLNode

Linked list node supertype.
"""
abstract type LLNode{T} end

"""
    NValueType

Node value type.
"""
NValueType = Union{T, Nothing} where T

"""
    SLLNode

Singly linked list node. Holds pointer to next node and some value.
"""
mutable struct SLLNode{T} <: LLNode{T}
    next::SLLNode{T}
    value::NValueType{T}
    SLLNode{T}() where T = (x = new(); x.next = x; x.value = nothing; x)
    SLLNode{T}(y::T) where T = (x = new(); x.next = x; x.value = y; x)
    SLLNode{T}(n::SLLNode{T}, y::T) where T = new(n, y)
end

"""
    DLLNode

Double linked list node. Holds pointers to previous and next nodes and some value.
"""
mutable struct DLLNode{T} <: LLNode{T}
    prev::DLLNode{T}
    next::DLLNode{T}
    value::NValueType{T}
    DLLNode{T}() where T = (x = new(); x.prev = x; x.next = x; x.value = nothing; x)
    DLLNode{T}(y::T) where T = (x = new(); x.prev = x; x.next = x; x.value = y; x)
    DLLNode{T}(p::DLLNode{T}, n::DLLNode{T}, y::T) where T = new(p, n, y)
end

"""
    SLinkedList

A singly linked list implementation.
"""
mutable struct SLinkedList{T} <: LinkedList{T}
    head::SLLNode{T}
    tail::SLLNode{T}
    size::Int
    #SLinkedList{T}() where T = (x = new(); x.size = 0; x)
    SLinkedList{T}() where T = (x = SLLNode{T}(); new(x, x, 0))
end

"""
    DLinkedList

A double linked list implementation.
"""
mutable struct DLinkedList{T} <: LinkedList{T}
    head::DLLNode{T}
    tail::DLLNode{T}
    size::Int
    #DLinkedList{T}() where T = (x = new(); x.size = 0; x)
    DLinkedList{T}() where T = (x = DLLNode{T}(); new(x, x, 0))
end

"""
    addlast!(l, x)

Add node to last position in linked list. Time complexity O(1).
"""
function addlast!(l::SLinkedList{T}, x::T) where T
    l.tail.next.value = x
    l.tail = l.tail.next
    l.tail.next = SLLNode{T}()
    l.size += 1

    return nothing
end

function addlast!(l::DLinkedList{T}, x::T) where T
    l.tail.next.value = x
    l.tail = l.tail.next
    l.tail.next = DLLNode{T}()
    l.tail.next.prev = l.tail
    l.size += 1

    return nothing
end

"""
    addfirst!(l, x)

Add node to first position in linked list. Time complexity O(1).
"""
function addfirst!(l::SLinkedList{T}, x::T) where T
    n = l.head
    l.head = SLLNode{T}(x)
    l.head.next = n
    if l.size == 0 # do this only if called first on empty list
        l.tail = l.head
    end
    l.size += 1

    return nothing
end

function addfirst!(l::DLinkedList{T}, x::T) where T
    n = l.head
    l.head = DLLNode{T}(x)
    l.head.next = n
    l.head.next.prev = l.head
    if l.size == 0 # do this only if called first on empty list
        l.tail = l.head
    end
    l.size += 1

    return nothing
end

"""
    add!(l, x, pos = 0)

Add node to linked list at some position. Time complexity O(n).
"""
function add!(l::SLinkedList, x::T, pos::Int = l.size) where T
    if pos <= 1
        addfirst!(l, x)
    elseif pos > l.size
        addlast!(l, x)
    else
        n = l.head
        i = 1
        while i < pos
            n = n.next
            i += 1
        end
        n.next = SLLNode{T}(n.next, n.value) 
        n.value = x
        l.size += 1
    end
    
    return nothing
end

function add!(l::DLinkedList, x::T, pos::Int = l.size) where T
    if pos <= 1
        addfirst!(l, x)
    elseif pos > l.size
        addlast!(l, x)
    else
        n = l.head
        i = 1
        while i < pos
            n = n.next
            i += 1
        end
        n.next = DLLNode{T}(n, n.next, n.value)
        n.value = x
        n.next.next.prev = n.next
        l.size += 1
    end
    
    return nothing
end

"""
    removelast!(l)

Remove last node from linked list. Time complexity for singly linked list O(n) and for doubly linked list O(1).
"""
function removelast!(l::SLinkedList{T}) where T
    x = l.tail.value
    n = l.head

    i = 1
    while i < l.size - 1
        n = n.next
        i += 1
    end
    empty = l.tail.next

    if l.size == 1
        # all this necessary?
        l.head = empty
        l.head.next = l.head
        l.tail = empty
        l.tail.next = l.tail
    else
        l.tail = n
        l.tail.next = empty
    end
    l.size -= 1

    return x
end

function removelast!(l::DLinkedList{T}) where T
    x = l.tail.value
    empty = l.tail.next

    if l.size == 1
        # all this necessary?
        l.head = empty
        l.head.prev = l.head
        l.head.next = l.head
        l.tail = empty
        l.tail.prev = l.tail
        l.tail.next = l.tail
    else
        l.tail = l.tail.prev
        l.tail.next = empty
        l.tail.next.prev = l.tail
    end
    l.size -= 1

    return x
end

"""
    removefirst!(l)

Remove last node from linked list. Time complexity O(1).
"""
function removefirst!(l::SLinkedList{T}) where T
    x = l.head.value
    l.head = l.head.next
    if l.size == 1
        l.tail = l.head
    end
    l.size -= 1

    return x
end

function removefirst!(l::DLinkedList{T}) where T
    x = l.head.value
    l.head = l.head.next
    l.head.prev = l.head
    if l.size == 1
        l.tail = l.head
    end
    l.size -= 1

    return x
end

"""
    remove!(l)

Remove last node from linked list. Time complexity O(n).
"""
function remove!(l::SLinkedList{T}, pos::Int) where T
    x = 0

    if pos <= 1
        x = removefirst!(l)
    elseif pos > l.size
        x = removelast!(l)
    else
        n = l.head

        i = 1
        while i < l.size-2
            n = n.next
            i += 1
        end
        x = n.next.value
        n.next = n.next.next

        l.size -= 1
    end
    
    return x
end

function remove!(l::DLinkedList{T}, pos::Int) where T
    x = 0

    if pos <= 1
        x = removefirst!(l)
    elseif pos > l.size
        x = removelast!(l)
    else
        n = l.head

        i = 1
        while i < l.size - 1
            n = n.next
            i += 1
        end
        x = n.value
        n.prev.next = n.next
        n.next.prev = n.prev

        l.size -= 1
    end
    
    return x
end

"""
    peekfirst(l)

Lookup first element in list.
"""
peekfirst(l::LinkedList) = l.head.value

"""
    peeklast(l)

Lookup last element in list.
"""
peeklast(l::LinkedList) = l.tail.value

# Below are some interfaces
"""
    length(l)
    size(l)

Get length of linked list.
"""
length(l::LinkedList) = l.size
size(l::LinkedList) = length(l)

"""
    :(==)

Test list equality.
"""
(==)(x::LinkedList, y::LinkedList) = (x.head == y.head) && (x.tail == y.tail) && (x.size == y.size)

"""
    show(l)

Display linked list types.
"""
function show(io::IO, l::SLinkedList{T}) where T
    println(io, "$(typeof(l))")
    print(io, " Head: ")
    
    n = l.head
    while n != n.next
        print(io, " $(n.value)  -> ")
        n = n.next
    end
    println(io, " $(n.value)")
    println(io, " Tail:  $(l.tail.value)")
    print(io, " Size:  $(l.size)")
end

function show(io::IO, l::DLinkedList{T}) where T
    println(io, "$(typeof(l))")
    print(io, " Head: ")

    n = l.head
    while n != n.next
        print(io, " $(n.value)  <-> ")
        n = n.next
    end
    println(io, " $(n.value)")
    println(io, " Tail:  $(l.tail.value)")
    print(io, " Size:  $(l.size)")
end

"""
    iterate(l, n)

Iterate over a linked list.
"""
iterate(l::LinkedList, n = l.head) = n == n.next ? nothing : (n.value, n.next)

"""
    eltype(type)

Type of elements generated by iteration over a linked list.
"""
eltype(::LinkedList{T}) where T = T