# Unit test functions
function unit_test_slinkedlist_empty()
    res = []
    
    l = SLinkedList{Float64}()
    push!(res, l.head.value == nothing)
    push!(res, l.tail.value == nothing)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_slinkedlist_addlast()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    addlast!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, length(l) == 1)

    val2 = 2.0
    addlast!(l, val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, length(l) == 2)

    return all(res)
end

function unit_test_slinkedlist_addfirst()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    addfirst!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, length(l) == 1)

    val2 = 2.0
    addfirst!(l, val2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, length(l) == 2)

    return all(res)
end

function unit_test_slinkedlist_add()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    add!(l, val1, 0)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, length(l) == 1)
    # 1

    val2 = 2.0
    add!(l, val2, 0)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, length(l) == 2)
    # 2 -> 1

    val3 = 3.0
    add!(l, val3, 5)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 3)
    # 2 -> 1 -> 3

    val4 = 4.0
    add!(l, val4, 2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val4)
    push!(res, l.head.next.next.value == val1)
    push!(res, l.head.next.next.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 4)
    # 2 -> 4 -> 1 -> 3

    val5 = 5.0
    add!(l, val5, 3)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val4)
    push!(res, l.head.next.next.value == val5)
    push!(res, l.head.next.next.next.value == val1)
    push!(res, l.head.next.next.next.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 5)
    # 2 -> 4 -> 5 -> 1 -> 3

    return all(res)
end

function unit_test_slinkedlist_addlastfirst()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    addfirst!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, length(l) == 1)

    val2 = 2.0
    addlast!(l, val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, length(l) == 2)

    val3 = 3.0
    addfirst!(l, val3)
    push!(res, l.head.value == val3)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, length(l) == 3)

    return all(res)
end

function unit_test_slinkedlist_removelast()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 3)
    push!(res, removelast!(l) == val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, length(l) == 2)
    push!(res, removelast!(l) == val2)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, length(l) == 1)
    push!(res, removelast!(l) == val1)
    push!(res, l.head == l.tail)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_slinkedlist_removefirst()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 3)
    push!(res, removefirst!(l) == val1)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 2)
    push!(res, removefirst!(l) == val2)
    push!(res, l.head.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 1)
    push!(res, removefirst!(l) == val3)
    push!(res, l.head == l.tail)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_slinkedlist_remove()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 3)
    push!(res, remove!(l, 2) == val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 2)
    push!(res, remove!(l, 0) == val1)
    push!(res, l.head.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 1)
    push!(res, remove!(l, 2) == val3)
    push!(res, l.head == l.tail)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_slinkedlist_removelastfirst()
    res = []

    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, length(l) == 3)
    push!(res, removelast!(l) == val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, length(l) == 2)
    push!(res, removefirst!(l) == val1)
    push!(res, l.head.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, length(l) == 1)
    push!(res, removelast!(l) == val2)
    push!(res, l.head == l.tail)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_slinkedlist_peekfirst()
    res = []

    val1 = 1.0
    val2 = 2.0
    l = SLinkedList{Float64}()
    addlast!(l, val1)
    push!(res, peekfirst(l) == val1)
    addlast!(l, val2)
    push!(res, peekfirst(l) == val1)

    return all(res)
end

function unit_test_slinkedlist_peeklast()
    res = []

    val1 = 1.0
    val2 = 2.0
    l = SLinkedList{Float64}()
    addlast!(l, val1)
    push!(res, peeklast(l) == val1)
    addlast!(l, val2)
    push!(res, peeklast(l) == val2)

    return all(res)
end

function unit_test_dlinkedlist_empty()
    res = []

    l = DLinkedList{Float64}()
    push!(res, l.head.value == nothing)
    push!(res, l.tail.value == nothing)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_dlinkedlist_addlast()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    addlast!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, l.tail.next.prev.value == val1)
    push!(res, length(l) == 1)

    val2 = 2.0
    addlast!(l, val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.prev.value == val2)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val2)
    push!(res, l.tail.next.prev.value == val2)
    push!(res, length(l) == 2)

    return all(res)
end

function unit_test_dlinkedlist_addfirst()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    addfirst!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, l.tail.next.prev.value == val1)

    val2 = 2.0
    addfirst!(l, val2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.prev.value == val1)
    push!(res, l.head.next.prev.value == val2)
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
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, l.tail.next.prev.value == val1)
    # 1

    val2 = 2.0
    add!(l, val2, 0)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.prev.value == val1)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.tail.value == val1)
    push!(res, l.tail.next.prev.value == val1)
    # 2 -> 1

    val3 = 3.0
    add!(l, val3, 5)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.head.next.next.next.prev.value == val3)
    push!(res, l.head.next.next.prev.value == val1)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.tail.value == val3)
    push!(res, l.tail.next.prev.value == val3)
    # 2 -> 1 -> 3

    val4 = 4.0
    add!(l, val4, 2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val4)
    push!(res, l.head.next.next.value == val1)
    push!(res, l.head.next.next.next.value == val3)
    push!(res, l.head.next.next.next.next.prev.value == val3)
    push!(res, l.head.next.next.next.prev.value == val1)
    push!(res, l.head.next.next.prev.value == val4)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.tail.value == val3)
    push!(res, l.tail.next.prev.value == val3)
    # 2 -> 4 -> 1 -> 3

    val5 = 5.0
    add!(l, val5, 3)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val4)
    push!(res, l.head.next.next.value == val5)
    push!(res, l.head.next.next.next.value == val1)
    push!(res, l.head.next.next.next.next.value == val3)
    push!(res, l.head.next.next.next.next.next.prev.value == val3)
    push!(res, l.head.next.next.next.next.prev.value == val1)
    push!(res, l.head.next.next.next.prev.value == val5)
    push!(res, l.head.next.next.prev.value == val4)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.tail.value == val3)
    push!(res, l.tail.next.prev.value == val3)
    # 2 -> 4 -> 5 -> 1 -> 3

    return all(res)
end

function unit_test_dlinkedlist_addlastfirst()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    addlast!(l, val1)
    push!(res, l.head.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.next.prev.value == val1)
    push!(res, length(l) == 1)

    val2 = 2.0
    addfirst!(l, val2)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.prev.value == val1)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.tail.value == val1)
    push!(res, l.tail.next.prev.value == val1)
    push!(res, length(l) == 2)

    val3 = 3.0
    addlast!(l, val3)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.value == val1)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.head.next.next.next.prev.value == val3)
    push!(res, l.head.next.next.prev.value == val1)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.tail.value == val3)
    push!(res, l.tail.next.prev.value == val3)
    push!(res, length(l) == 3)

    return all(res)
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
    push!(res, l.head.next.next.prev.value == val2)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val2)
    push!(res, l.tail.next.prev.value == val2)
    push!(res, length(l) == 2)
    push!(res, removelast!(l) == val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val1)
    push!(res, l.tail.next.prev.value == val1)
    push!(res, length(l) == 1)
    push!(res, removelast!(l) == val1)
    push!(res, l.head == l.tail)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_dlinkedlist_removefirst()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    addlast!(l, val1)
    addlast!(l, val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.prev.value == val2)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val2)
    push!(res, l.tail.next.prev.value == val2)
    push!(res, length(l) == 2)
    push!(res, removefirst!(l) == val1)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, l.tail.next.prev.value == val2)
    push!(res, length(l) == 1)
    push!(res, removefirst!(l) == val2)
    push!(res, l.head == l.tail)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_dlinkedlist_remove()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.head.next.next.next.prev.value == val3)
    push!(res, l.head.next.next.prev.value == val2)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val3)
    push!(res, l.tail.next.prev.value == val3)
    push!(res, length(l) == 3)
    push!(res, remove!(l, 2) == val2)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val3)
    push!(res, l.head.next.next.prev.value == val3)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val3)
    push!(res, l.tail.next.prev.value == val3)
    push!(res, length(l) == 2)
    push!(res, remove!(l, 0) == val1)
    push!(res, l.head.value == val3)
    push!(res, l.head.next.prev.value == val3)
    push!(res, l.tail.value == val3)
    push!(res, l.tail.next.prev.value == val3)
    push!(res, length(l) == 1)
    push!(res, remove!(l, 2) == val3)
    push!(res, l.head == l.tail)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_dlinkedlist_removelastfirst()
    res = []

    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.value == val3)
    push!(res, l.head.next.next.next.prev.value == val3)
    push!(res, l.head.next.next.prev.value == val2)
    push!(res, l.head.next.prev.value == val1)
    push!(res, length(l) == 3)
    push!(res, removelast!(l) == val3)
    push!(res, l.head.value == val1)
    push!(res, l.head.next.value == val2)
    push!(res, l.head.next.next.prev.value == val2)
    push!(res, l.head.next.prev.value == val1)
    push!(res, l.tail.value == val2)
    push!(res, l.tail.next.prev.value == val2)
    push!(res, length(l) == 2)
    push!(res, removefirst!(l) == val1)
    push!(res, l.head.value == val2)
    push!(res, l.head.next.prev.value == val2)
    push!(res, l.tail.value == val2)
    push!(res, l.tail.next.prev.value == val2)
    push!(res, length(l) == 1)
    push!(res, removelast!(l) == val2)
    push!(res, l.head == l.tail)
    push!(res, length(l) == 0)

    return all(res)
end

function unit_test_dlinkedlist_peekfirst()
    res = []

    val1 = 1.0
    val2 = 2.0
    l = DLinkedList{Float64}()
    addlast!(l, val1)
    push!(res, peekfirst(l) == val1)
    addlast!(l, val2)
    push!(res, peekfirst(l) == val1)

    return all(res)
end

function unit_test_dlinkedlist_peeklast()
    res = []

    val1 = 1.0
    val2 = 2.0
    l = DLinkedList{Float64}()
    addlast!(l, val1)
    push!(res, peeklast(l) == val1)
    addlast!(l, val2)
    push!(res, peeklast(l) == val2)

    return all(res)
end

function unit_test_linkedlist_iterate()
    res = []

    n = 100
    c = rand((1:n), n)
    l = SLinkedList{Int64}()
    
    for val in c
        addlast!(l, val)
    end

    for (i, v) in enumerate(l)
        push!(res, v == c[i])
    end

    return all(res)
end

function unit_test_linkedlist_collect()
    res = []

    n = 100
    c = rand((1:n), n)
    l = SLinkedList{Int64}()
    
    for val in c
        addlast!(l, val)
    end

    res = c .== collect(l)

    return all(res)
end

# Run the unit tests
@testset "Singly linked list   " begin
    @test unit_test_slinkedlist_empty()
    @test unit_test_slinkedlist_addlast()
    @test unit_test_slinkedlist_addfirst()
    @test unit_test_slinkedlist_add()
    @test unit_test_slinkedlist_addlastfirst()
    @test unit_test_slinkedlist_removelast()
    @test unit_test_slinkedlist_removefirst()
    @test unit_test_slinkedlist_remove()
    @test unit_test_slinkedlist_removelastfirst()
    @test unit_test_slinkedlist_peekfirst()
    @test unit_test_slinkedlist_peeklast()
end

@testset "Doubly linked list   " begin
    @test unit_test_dlinkedlist_empty()
    @test unit_test_dlinkedlist_addlast()
    @test unit_test_dlinkedlist_addfirst()
    @test unit_test_dlinkedlist_add()
    @test unit_test_dlinkedlist_addlastfirst()
    @test unit_test_dlinkedlist_removelast()
    @test unit_test_dlinkedlist_removefirst()
    @test unit_test_dlinkedlist_remove()
    @test unit_test_dlinkedlist_removelastfirst()
    @test unit_test_dlinkedlist_peekfirst()
    @test unit_test_dlinkedlist_peeklast()
end

@testset "Linked list interface" begin
    @test unit_test_linkedlist_iterate()
    @test unit_test_linkedlist_collect()
end