module DAT038

using Random

export linearsearch, binarysearch
export selectionsort, insertionsort, mergesort
export SLinkedList, DLinkedList, addlast!, addfirst!, add!, removelast!, removefirst!, remove!, peeklast, peekfirst
export Queue, enqueue!, dequeue!, peek, size, length, peekfirst, peeklast
export RMHeap, BNode, add!, remove!, meld!, MinPQ, add!
export BST, BSTNode, printsort, isbst, maximum_node, minx, maxx#, get!, put!
export eltype, iterate

import Base.push!, Base.pop!, Base.isempty, Base.peek, Base.show
import Base.getindex, Base.resize!, Base.setindex!, Base.:(==)
import Base.iterate, Base.eltype, Base.length, Base.size, Base.get!, Base.put!
import Base.delete!, Base.collect

include("dynamicarray.jl")
include("stack.jl")
include("list.jl")
include("queue.jl")
include("sort.jl")
include("search.jl")
include("search.jl")
include("heap.jl")
include("tree.jl")
#include("graph.jl")


end # module
