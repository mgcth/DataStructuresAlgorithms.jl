using DataStructuresAlgorithms
using Random

function benchmark_slinkedlist()
    n = 10^4
    l = SLinkedList{Int64}()
    
    println("SLL time to addlast for $n nodes: ")
    @time for i in 1:n
        addlast!(l, i)
    end
    @time addlast!(l, 1)

    println("SLL time to removelast for $n nodes: ")
    @time removelast!(l)
    @time for i in 1:n
        removelast!(l)
    end

    return true
end

function benchmark_dlinkedlist()
    n = 10^4
    l = DLinkedList{Int64}()
    
    println("DLL time to addlast for $n nodes: ")
    @time for i in 1:n
        addlast!(l, i)
    end
    @time addlast!(l, 1)

    println("DLL time to removelast for $n nodes: ")
    @time removelast!(l)
    @time for i in 1:n
        removelast!(l)
    end

    return true
end

function benchmark_stack()
    n = 10^6

    println("Add $n elements to the stack: ")
    s = Stack(Vector{Float64}(undef, 0))
    @time for i in 1:n
        push!(s, Float64(i))
    end

    println("Remove all $n elements from the stack: ")
    @time for i in 1:n
        pop!(s)
    end

    return nothing
end

function benchmark_queue()
    n = 10^6

    println("Add $n elements to the queue: ")
    q = Queue(DLinkedList{Float64}())
    @time for i in 1:n
        enqueue!(q, Float64(i))
    end
    enqueue!(q, Float64(1))

    println("Remove all $n elements from the queue: ")
    dequeue!(q)
    @time for i in 1:n
        dequeue!(q)
    end

    return nothing
end

function benchmark_bst()
    
    n = 10^6
    c = shuffle(1:n)
    t = BST{Int64, Int64}()

    println("Put $n items in binary search tree (random order): ")
    @time for i in c
        put!(t, i, 2i)
    end

    println("Get all $n items in binary search tree (random order): ")
    @time for i in 1:n
        get!(t, i)
    end

    println("Delete all $n items in binary search tree (random order): ")
    @time for i in 1:n
        delete!(t, i)
    end

    return nothing
end

function benchmark_linearsearch()
    n = 10^7 - 1
    a = rand((0:n), n)
    push!(a, n+1)

    println("Test performance in linear search for n = $(n+1): ")
    el = findfirst(x->x == a[end], a)
    @time res = linearsearch(a, a[end]) == el
    
    return nothing
end

function benchmark_binarysearch()
    n = 10^7-1
    a = sort(rand((0:n), n))
    push!(a, n+1)

    println("Test performance in binary search for n = $(n+1): ")
    @time res = binarysearch(a, a[end]) == a[end]

    return nothing
end

function benchmark_selectionsort()
    n = 10^4
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in selection sort for n = $n: ")
    @time res = selectionsort!(a) 
    res = res .== as

    return nothing
end

function benchmark_insertionsort()
    n = 10^4
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in insertion sort for n = $n: ")
    @time res = insertionsort!(a) 
    res = res .== as

    return nothing
end

function benchmark_mergesort(n = 10^5)
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in merge sort for n = $n: ")
    @time res = mergesort(a) 
    res = res .== as

    return nothing
end

function benchmark_quicksort(n = 10^5)
    n = 10^5
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in quicksort with median-of-three for n = $n: ")
    @time res = quicksort!(a) 
    res = res .== as

    return nothing
end

function benchmark_dynamicarray()
    d = DynamicArray{Float64}()
    n = 10^7

    println("Time to add $n items to dynamic array: ")
    @time for i in 1:n
        push!(d, Float64(i))
    end

    println("Time to remove $n items from dynamic array: ")
    @time for i in 1:n
        pop!(d)
    end

    return nothing
end

function benchmark_rmheap()
    n = 10^4
    r = RMHeap{Int}()

    println("Adding $n items to randomised meldable heap: ")
    @time for i = 1:n
        add!(r, i)
    end
    println("Adding 1 item to randomised meldable heap with $n items: ")
    @time add!(r, 1)

    println("Removing 1 item from randomised meldable heap with $(n+1) items: ")
    @time remove!(r)
    println("Removing all $n items from randomised meldable heap: ")
    @time for i = 1:n
        remove!(r)
    end

    return nothing
end

function benchmark_minpq()
    n = 10^4
    r = MinPQ{Int}()

    println("Adding $n items to binary heap: ")
    for i = 1:n
        add!(r, i)
    end
    println("Adding 1 item to binary heap with $n items: ")
    @time add!(r, 1)

    println("Removing 1 item from binary heap with $(n+1) items: ")
    @time remove!(r)
    println("Removing all $n items from binary heap: ")
    @time for i = 1:n
        remove!(r)
    end

    return nothing
end

function runbenchmark()
    benchmark_slinkedlist()
    benchmark_dlinkedlist()
    benchmark_queue()
    benchmark_stack()
    benchmark_bst()
    benchmark_linearsearch()
    benchmark_binarysearch()
    benchmark_selectionsort()
    benchmark_insertionsort()
    benchmark_mergesort()
    benchmark_quicksort()
    benchmark_dynamicarray()
    benchmark_rmheap()
    benchmark_minpq()
    benchmark_rmheap()
    benchmark_minpq()
end