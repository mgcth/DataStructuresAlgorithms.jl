using DAT038

function benchmark_slinkedlist_benchmark()
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

function benchmark_dlinkedlist_benchmark()
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

function benchmark_stack_benchmark()
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

function benchmark_queue_benchmark()
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

function runbenchmark()
benchmark_slinkedlist_benchmark()
    benchmark_dlinkedlist_benchmark()
    benchmark_queue_benchmark()
    benchmark_stack_benchmark()
end