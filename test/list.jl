import DAT038.SLinkedList,
       DAT038.addlast!,
       DAT038.addfirst!,
       DAT038.add!,
       DAT038.removelast!,
       DAT038.removefirst!,
       DAT038.remove!,
       DAT038.DLinkedList

# Unit test functions
function unit_test_slinkedlist_empty()
    l = SLinkedList{Float64}()
    res = l == l

    return res
end

function unit_test_slinkedlist_addlast()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    addlast!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)

    val2 = 2.0
    addlast!(l, val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.tail.value == val2)

    return all(res)
end

function unit_test_slinkedlist_addfirst()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    addfirst!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)

    val2 = 2.0
    addfirst!(l, val2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.tail.value == val1)

    return all(res)
end

function unit_test_slinkedlist_add()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    add!(l, val1, 0)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    # 1

    val2 = 2.0
    add!(l, val2, 0)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.tail.value == val1)
    # 2 -> 1

    val3 = 3.0
    add!(l, val3, 5)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.tail.value == val3)
    # 2 -> 1 -> 3

    val4 = 4.0
    add!(l, val4, 2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val4)
    push!(res, l.head.next.next.value == val1)
    push!(res, l.head.next.next.next.value == val3)
    push!(res, l.tail.value == val3)
    # 2 -> 4 -> 1 -> 3

    val5 = 5.0
    add!(l, val5, 3)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val4)
    push!(res, l.head.next.next.value == val5)
    push!(res, l.head.next.next.next.value == val1)
    push!(res, l.head.next.next.next.next.value == val3)
    push!(res, l.tail.value == val3)
    # 2 -> 4 -> 5 -> 1 -> 3

    return all(res)
end

function unit_test_slinkedlist_removelast()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    addlast!(l, val1)
    addlast!(l, val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, removelast!(l) == val2)
    push!(res, l.head.value == val1)
    push!(res, removelast!(l) == val1)
    push!(res, l.head == l.tail)

    return all(res)
end

function unit_test_slinkedlist_addlastfirst()
    l = SLinkedList{Float64}()
    res = true

    return res
end

function unit_test_slinkedlist_benchmark()
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

function unit_test_dlinkedlist_empty()
    l = DLinkedList{Float64}()
    res = l == l

    return res
end

function unit_test_dlinkedlist_addlast()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    addlast!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.next.prev.value == val1)

    val2 = 2.0
    addlast!(l, val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.head.next.next.prev.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, l.tail.next.prev.value == val2)

    return all(res)
end

function unit_test_dlinkedlist_addfirst()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    addfirst!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.next.prev.value == val1)

    val2 = 2.0
    addfirst!(l, val2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.head.next.next.prev.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, l.tail.next.prev.value == val1)

    return all(res)
end

function unit_test_dlinkedlist_add()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    add!(l, val1, 0)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    # 1

    val2 = 2.0
    add!(l, val2, 0)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.tail.value == val1)
    # 2 -> 1

    val3 = 3.0
    add!(l, val3, 5)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.tail.value == val3)
    # 2 -> 1 -> 3

    val4 = 4.0
    add!(l, val4, 2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val4)
    push!(res, l.head.next.next.value == val1)
    push!(res, l.head.next.next.next.value == val3)
    push!(res, l.tail.value == val3)
    # 2 -> 4 -> 1 -> 3

    val5 = 5.0
    add!(l, val5, 3)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val4)
    push!(res, l.head.next.next.value == val5)
    push!(res, l.head.next.next.next.value == val1)
    push!(res, l.head.next.next.next.next.value == val3)
    push!(res, l.tail.value == val3)
    # 2 -> 4 -> 5 -> 1 -> 3

    return all(res)
end

function unit_test_dlinkedlist_addlastfirst()
    l = DLinkedList{Float64}()
    res = true

    return res
end

function unit_test_dlinkedlist_removelast()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    addlast!(l, val1)
    addlast!(l, val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, removelast!(l) == val2)
    push!(res, l.head.value == val1)
    push!(res, removelast!(l) == val1)
    push!(res, l.head == l.tail)
    # missing test on prev

    return all(res)
end

function unit_test_dlinkedlist_benchmark()
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

# Run the unit tests
@testset "Singly linked list" begin
    @test unit_test_slinkedlist_empty()
    @test unit_test_slinkedlist_addlast()
    @test unit_test_slinkedlist_addfirst()
    @test unit_test_slinkedlist_add()
    @test unit_test_slinkedlist_addlastfirst()
    @test unit_test_slinkedlist_removelast()
    @test unit_test_slinkedlist_benchmark()
    #@test unit_test_selectionsort_many()
    # @test unit_test_selectionsort_string()
    #@test unit_test_selectionsort_benchmark()
end

@testset "Doubly linked list" begin
    @test unit_test_dlinkedlist_empty()
    @test unit_test_dlinkedlist_addlast()
    @test unit_test_dlinkedlist_addfirst()
    @test unit_test_dlinkedlist_add()
    @test unit_test_dlinkedlist_addlastfirst()
    @test unit_test_dlinkedlist_removelast()
    @test unit_test_dlinkedlist_benchmark()
end