using DAT038

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

function benchmark_stack()
    n = 10^6
    res = []

    println("Add $n elements to the stack: ")
    s = Stack(Vector{Float64}(undef, 0))
    @time for i in 1:n
        push!(s, Float64(i))
    end
    push!(res, size(s) == n)

    println("Remove $n elements from the stack: ")
    @time for i in 1:n
        pop!(s)
    end
    push!(res, isempty(s))

    return all(res)
end

function benchmark_queue()
    n = 10^6
    res = []

    println("Add $n elements to the queue: ")
    s = Stack(Vector{Float64}(undef, 0))
    @time for i in 1:n
        enqueue!(s, Float64(i))
    end
    enqueue!(s, Float64(i))
    push!(res, size(s) == n + 1)

    println("Remove $n elements from the queue: ")
    dequeue!(s)
    @time for i in 1:n
        dequeue!(s)
    end
    push!(res, isempty(s))

    return all(res)
end

function benchmark_bst()
    res = []
    
    n = 10^6
    c = shuffle(1:n)
    t = BST{Int64, Int64}()

    @time for i in c
        put!(t, i, 2i)
    end

    @time for i in 1:n
        get!(t, i)
    end

    @time for i in 1:n
        delete!(t, i)
    end

    return true
end

function benchmark_linearsearch()
    n = 10^7 - 1
    a = rand((0:n), n)
    push!(a, n+1)

    println("Test performance in linear search for n = $(n+1): ")
    el = findfirst(x->x == a[end], a)
    @time res = linearsearch(a, a[end]) == el
    
    return all(res)
end

function benchmark_binarysearch()
    n = 10^7-1
    a = sort(rand((0:n), n))
    push!(a, n+1)

    println("Test performance in binary search for n = $(n+1): ")
    @time res = binarysearch(a, a[end]) == a[end]

    return all(res)
end

function benchmark_selectionsort()
    n = 10^4
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in selection sort for n = $n: ")
    @time res = selectionsort(a) 
    res = res .== as

    return all(res)
end

function benchmark_insertionsort()
    n = 10^4
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in insertion sort for n = $n: ")
    @time res = insertionsort(a) 
    res = res .== as

    return all(res)
end

function benchmark_mergesort()
    n = 10^5
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in merge sort for n = $n: ")
    @time res = mergesort(a) 
    res = res .== as

    return all(res)
end

function benchmark_dynamicarray()
    d = DynamicArray{Float64}()
    n = 10^7

    println("Test adding to dynamic array for n = $n: ")
    @time for i in 1:n
        push!(d, Float64(i))
    end

    println("Test removing from dynamic array for n = $n: ")
    @time for i in 1:n
        pop!(d)
    end

    return true
end

function runbenchmark()
    benchmark_slinkedlist()
    benchmark_dlinkedlist()
    benchmark_queue()
    benchmark_stack()
    function_benchmark_bst()
    benchmark_linearsearch()
    benchmark_binarysearch()
    benchmark_selectionsort()
    benchmark_insertionsort()
    benchmark_mergesort()
    benchmark_dynamicarray()
end