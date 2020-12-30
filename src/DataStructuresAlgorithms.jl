module DataStructuresAlgorithms

using Random

export Stack, DynamicArray
export linearsearch, binarysearch
export selectionsort!, insertionsort!, mergesort, quicksort!
export SLinkedList, DLinkedList, addlast!, addfirst!, add!, removelast!, removefirst!, remove!, peeklast, peekfirst
export Queue, enqueue!, dequeue!, peek, peekfirst, peeklast
export RMHeap, BNode, add!, remove!, meld!, MinPQ, add!, isheap, greater, getmin
export BST, BSTNode, printsort, isbst, maximum_node
export SCHash, SCLHash, OAHash, compress


import Base.push!, Base.pop!, Base.isempty, Base.peek, Base.show
import Base.getindex, Base.resize!, Base.setindex!, Base.:(==)
import Base.iterate, Base.eltype, Base.length, Base.size, Base.get!, Base.put!
import Base.delete!, Base.collect, Base.minimum, Base.maximum, Base.get, Base.hash

include("dynamicarray.jl")
include("stack.jl")
include("list.jl")
include("queue.jl")
include("sort.jl")
include("search.jl")
include("search.jl")
include("heap.jl")
include("tree.jl")
include("hash.jl")

end # module
