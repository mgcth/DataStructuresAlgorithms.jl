module DAT038

using Random

export linearsearch, binarysearch
export selectionsort, insertionsort, mergesort
export SLinkedList, DLinkedList

import Base.push!, Base.pop!, Base.isempty, Base.peek, Base.show
import Base.getindex, Base.resize!, Base.setindex!

include("stack.jl")
include("list.jl")
include("sort.jl")
include("search.jl")
include("search.jl")
include("heap.jl")
include("graph.jl")
include("dynamicarray.jl")

end # module
