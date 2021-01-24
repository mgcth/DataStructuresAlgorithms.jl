# Unit test functions
function unit_test_slinkedlist_empty()
    l = SLinkedList{Float64}()
    @test l.head.value === nothing
    @test l.tail.value === nothing
    @test length(l) == 0

    return nothing
end


function unit_test_slinkedlist_addlast()
    l = SLinkedList{Float64}()
    val1 = 1.0
    addlast!(l, val1)
    @test l.head.value == val1
    @test l.tail.value == val1
    @test length(l) == 1

    val2 = 2.0
    addlast!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.tail.value == val2
    @test length(l) == 2

    return nothing
end


function unit_test_slinkedlist_addfirst()
    l = SLinkedList{Float64}()
    val1 = 1.0
    addfirst!(l, val1)
    @test l.head.value == val1
    @test l.tail.value == val1
    @test length(l) == 1

    val2 = 2.0
    addfirst!(l, val2)
    @test l.head.value == val2
    @test l.head.next.value == val1
    @test l.tail.value == val1
    @test length(l) == 2

    return nothing
end


function unit_test_slinkedlist_add()
    l = SLinkedList{Float64}()
    val1 = 1.0
    add!(l, val1, 0)
    @test l.head.value == val1
    @test l.tail.value == val1
    @test length(l) == 1
    # 1

    val2 = 2.0
    add!(l, val2, 0)
    @test l.head.value == val2
    @test l.head.next.value == val1
    @test l.tail.value == val1
    @test length(l) == 2
    # 2 -> 1

    val3 = 3.0
    add!(l, val3, 5)
    @test l.head.value == val2
    @test l.head.next.value == val1
    @test l.head.next.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 3
    # 2 -> 1 -> 3

    val4 = 4.0
    add!(l, val4, 2)
    @test l.head.value == val2
    @test l.head.next.value == val4
    @test l.head.next.next.value == val1
    @test l.head.next.next.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 4
    # 2 -> 4 -> 1 -> 3

    val5 = 5.0
    add!(l, val5, 3)
    @test l.head.value == val2
    @test l.head.next.value == val4
    @test l.head.next.next.value == val5
    @test l.head.next.next.next.value == val1
    @test l.head.next.next.next.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 5
    # 2 -> 4 -> 5 -> 1 -> 3

    return nothing
end


function unit_test_slinkedlist_add_interface()
    l = SLinkedList{Float64}()
    val1 = 1.0
    add!(l, val1, 0)
    @test l.head.value == val1
    @test l.tail.value == val1
    @test length(l) == 1
    # 1

    val2 = 2.0
    add!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.tail.value == val2
    @test length(l) == 2
    # 1 -> 2
end


function unit_test_slinkedlist_addlastfirst()
    l = SLinkedList{Float64}()
    val1 = 1.0
    addfirst!(l, val1)
    @test l.head.value == val1
    @test l.tail.value == val1
    @test length(l) == 1

    val2 = 2.0
    addlast!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.tail.value == val2
    @test length(l) == 2

    val3 = 3.0
    addfirst!(l, val3)
    @test l.head.value == val3
    @test l.head.next.value == val1
    @test l.head.next.next.value == val2
    @test l.tail.value == val2
    @test length(l) == 3

    return nothing
end


function unit_test_slinkedlist_removelast()
    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 3
    @test removelast!(l) == val3
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.tail.value == val2
    @test length(l) == 2
    @test removelast!(l) == val2
    @test l.head.value == val1
    @test l.tail.value == val1
    @test length(l) == 1
    @test removelast!(l) == val1
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_slinkedlist_removefirst()
    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 3
    @test removefirst!(l) == val1
    @test l.head.value == val2
    @test l.head.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 2
    @test removefirst!(l) == val2
    @test l.head.value == val3
    @test l.tail.value == val3
    @test length(l) == 1
    @test removefirst!(l) == val3
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_slinkedlist_remove()
    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 3
    @test remove!(l, 2) == val2
    @test l.head.value == val1
    @test l.head.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 2
    @test remove!(l, 0) == val1
    @test l.head.value == val3
    @test l.tail.value == val3
    @test length(l) == 1
    @test remove!(l, 2) == val3
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_slinkedlist_remove_interface()
    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    addlast!(l, val1)
    addlast!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.tail.value == val2
    @test length(l) == 2
    @test remove!(l) == val1
    @test l.head.value == val2
    @test l.tail.value == val2
    @test length(l) == 1
    @test remove!(l) == val2
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_slinkedlist_removelastfirst()
    l = SLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.value == val3
    @test l.tail.value == val3
    @test length(l) == 3
    @test removelast!(l) == val3
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.tail.value == val2
    @test length(l) == 2
    @test removefirst!(l) == val1
    @test l.head.value == val2
    @test l.tail.value == val2
    @test length(l) == 1
    @test removelast!(l) == val2
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_slinkedlist_peekfirst()
    val1 = 1.0
    val2 = 2.0
    l = SLinkedList{Float64}()
    addlast!(l, val1)
    @test peekfirst(l) == val1
    addlast!(l, val2)
    @test peekfirst(l) == val1

    return nothing
end


function unit_test_slinkedlist_peeklast()
    val1 = 1.0
    val2 = 2.0
    l = SLinkedList{Float64}()
    addlast!(l, val1)
    @test peeklast(l) == val1
    addlast!(l, val2)
    @test peeklast(l) == val2

    return nothing
end


function unit_test_dlinkedlist_empty()
    l = DLinkedList{Float64}()
    @test l.head.value === nothing
    @test l.tail.value === nothing
    @test length(l) == 0

    return nothing
end


function unit_test_dlinkedlist_addlast()
    l = DLinkedList{Float64}()
    val1 = 1.0
    addlast!(l, val1)
    @test l.head.value == val1
    @test l.head.next.prev.value == val1
    @test l.tail.value == val1
    @test l.tail.next.prev.value == val1
    @test length(l) == 1

    val2 = 2.0
    addlast!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.prev.value == val2
    @test l.head.next.prev.value == val1
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    @test length(l) == 2

    return nothing
end


function unit_test_dlinkedlist_addfirst()
    l = DLinkedList{Float64}()
    val1 = 1.0
    addfirst!(l, val1)
    @test l.head.value == val1
    @test l.head.next.prev.value == val1
    @test l.tail.value == val1
    @test l.tail.next.prev.value == val1

    val2 = 2.0
    addfirst!(l, val2)
    @test l.head.value == val2
    @test l.head.next.value == val1
    @test l.head.next.next.prev.value == val1
    @test l.head.next.prev.value == val2
    @test l.tail.value == val1
    @test l.tail.next.prev.value == val1

    return nothing
end


function unit_test_dlinkedlist_add()
    l = DLinkedList{Float64}()
    val1 = 1.0
    add!(l, val1, 0)
    @test l.head.value == val1
    @test l.head.next.prev.value == val1
    @test l.tail.value == val1
    @test l.tail.next.prev.value == val1
    # 1

    val2 = 2.0
    add!(l, val2, 0)
    @test l.head.value == val2
    @test l.head.next.value == val1
    @test l.head.next.next.prev.value == val1
    @test l.head.next.prev.value == val2
    @test l.tail.value == val1
    @test l.tail.next.prev.value == val1
    # 2 <-> 1

    val3 = 3.0
    add!(l, val3, 5)
    @test l.head.value == val2
    @test l.head.next.value == val1
    @test l.head.next.next.value == val3
    @test l.head.next.next.next.prev.value == val3
    @test l.head.next.next.prev.value == val1
    @test l.head.next.prev.value == val2
    @test l.tail.value == val3
    @test l.tail.next.prev.value == val3
    # 2 <-> 1 <-> 3

    val4 = 4.0
    add!(l, val4, 2)
    @test l.head.value == val2
    @test l.head.next.value == val4
    @test l.head.next.next.value == val1
    @test l.head.next.next.next.value == val3
    @test l.head.next.next.next.next.prev.value == val3
    @test l.head.next.next.next.prev.value == val1
    @test l.head.next.next.prev.value == val4
    @test l.head.next.prev.value == val2
    @test l.tail.value == val3
    @test l.tail.next.prev.value == val3
    # 2 <-> 4 <-> 1 <-> 3

    val5 = 5.0
    add!(l, val5, 3)
    @test l.head.value == val2
    @test l.head.next.value == val4
    @test l.head.next.next.value == val5
    @test l.head.next.next.next.value == val1
    @test l.head.next.next.next.next.value == val3
    @test l.head.next.next.next.next.next.prev.value == val3
    @test l.head.next.next.next.next.prev.value == val1
    @test l.head.next.next.next.prev.value == val5
    @test l.head.next.next.prev.value == val4
    @test l.head.next.prev.value == val2
    @test l.tail.value == val3
    @test l.tail.next.prev.value == val3
    # 2 <-> 4 <-> 5 <-> 1 <-> 3

    return nothing
end


function unit_test_dlinkedlist_add_interface()
    l = DLinkedList{Float64}()
    val1 = 1.0
    add!(l, val1, 0)
    @test l.head.value == val1
    @test l.head.next.prev.value == val1
    @test l.tail.value == val1
    @test l.tail.next.prev.value == val1
    # 1

    val2 = 2.0
    add!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.prev.value == val2
    @test l.head.next.prev.value == val1
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    # 1 <-> 2

    return nothing
end


function unit_test_dlinkedlist_addlastfirst()
    l = DLinkedList{Float64}()
    val1 = 1.0
    addlast!(l, val1)
    @test l.head.value == val1
    @test l.tail.value == val1
    @test l.head.next.prev.value == val1
    @test l.tail.next.prev.value == val1
    @test length(l) == 1

    val2 = 2.0
    addfirst!(l, val2)
    @test l.head.value == val2
    @test l.head.next.value == val1
    @test l.head.next.next.prev.value == val1
    @test l.head.next.prev.value == val2
    @test l.tail.value == val1
    @test l.tail.next.prev.value == val1
    @test length(l) == 2

    val3 = 3.0
    addlast!(l, val3)
    @test l.head.value == val2
    @test l.head.next.value == val1
    @test l.head.next.next.value == val3
    @test l.head.next.next.next.prev.value == val3
    @test l.head.next.next.prev.value == val1
    @test l.head.next.prev.value == val2
    @test l.tail.value == val3
    @test l.tail.next.prev.value == val3
    @test length(l) == 3

    return nothing
end


function unit_test_dlinkedlist_removelast()
    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    addlast!(l, val1)
    addlast!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.prev.value == val2
    @test l.head.next.prev.value == val1
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    @test length(l) == 2
    @test removelast!(l) == val2
    @test l.head.value == val1
    @test l.head.next.prev.value == val1
    @test l.tail.value == val1
    @test l.tail.next.prev.value == val1
    @test length(l) == 1
    @test removelast!(l) == val1
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_dlinkedlist_removefirst()
    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    addlast!(l, val1)
    addlast!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.prev.value == val2
    @test l.head.next.prev.value == val1
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    @test length(l) == 2
    @test removefirst!(l) == val1
    @test l.head.value == val2
    @test l.head.next.prev.value == val2
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    @test length(l) == 1
    @test removefirst!(l) == val2
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_dlinkedlist_remove()
    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.value == val3
    @test l.head.next.next.next.prev.value == val3
    @test l.head.next.next.prev.value == val2
    @test l.head.next.prev.value == val1
    @test l.tail.value == val3
    @test l.tail.next.prev.value == val3
    @test length(l) == 3
    @test remove!(l, 2) == val2
    @test l.head.value == val1
    @test l.head.next.value == val3
    @test l.head.next.next.prev.value == val3
    @test l.head.next.prev.value == val1
    @test l.tail.value == val3
    @test l.tail.next.prev.value == val3
    @test length(l) == 2
    @test remove!(l, 0) == val1
    @test l.head.value == val3
    @test l.head.next.prev.value == val3
    @test l.tail.value == val3
    @test l.tail.next.prev.value == val3
    @test length(l) == 1
    @test remove!(l, 2) == val3
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_dlinkedlist_remove_interface()
    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    addlast!(l, val1)
    addlast!(l, val2)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.prev.value == val2
    @test l.head.next.prev.value == val1
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    @test length(l) == 2
    @test remove!(l) == val1
    @test l.head.value == val2
    @test l.head.next.prev.value == val2
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    @test length(l) == 1
    @test remove!(l) == val2
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_dlinkedlist_removelastfirst()
    l = DLinkedList{Float64}()
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    addlast!(l, val1)
    addlast!(l, val2)
    addlast!(l, val3)
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.value == val3
    @test l.head.next.next.next.prev.value == val3
    @test l.head.next.next.prev.value == val2
    @test l.head.next.prev.value == val1
    @test length(l) == 3
    @test removelast!(l) == val3
    @test l.head.value == val1
    @test l.head.next.value == val2
    @test l.head.next.next.prev.value == val2
    @test l.head.next.prev.value == val1
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    @test length(l) == 2
    @test removefirst!(l) == val1
    @test l.head.value == val2
    @test l.head.next.prev.value == val2
    @test l.tail.value == val2
    @test l.tail.next.prev.value == val2
    @test length(l) == 1
    @test removelast!(l) == val2
    @test l.head == l.tail
    @test length(l) == 0

    return nothing
end


function unit_test_dlinkedlist_peekfirst()
    val1 = 1.0
    val2 = 2.0
    l = DLinkedList{Float64}()
    addlast!(l, val1)
    @test peekfirst(l) == val1
    addlast!(l, val2)
    @test peekfirst(l) == val1

    return nothing
end


function unit_test_dlinkedlist_peeklast()
    val1 = 1.0
    val2 = 2.0
    l = DLinkedList{Float64}()
    addlast!(l, val1)
    @test peeklast(l) == val1
    addlast!(l, val2)
    @test peeklast(l) == val2

    return nothing
end


function unit_test_linkedlist_length()
    val1 = 1.0
    val2 = 2.0
    l = SLinkedList{Float64}()
    addlast!(l, val1)
    @test length(l) == 1
    addlast!(l, val2)
    @test length(l) == 2

    d = DLinkedList{Float64}()
    addlast!(d, val1)
    @test length(d) == 1
    addlast!(d, val2)
    @test length(d) == 2
end


function unit_test_linkedlist_size()
    val1 = 1.0
    val2 = 2.0
    l = SLinkedList{Float64}()
    addlast!(l, val1)
    @test size(l) == 1
    addlast!(l, val2)
    @test size(l) == 2

    d = DLinkedList{Float64}()
    addlast!(d, val1)
    @test size(d) == 1
    addlast!(d, val2)
    @test size(d) == 2
end


function unit_test_linkedlist_equality()
    val1 = 1.0
    val2 = 2.0
    l1 = SLinkedList{Float64}()
    addlast!(l1, val1)
    addlast!(l1, val2)
    l2 = SLinkedList{Float64}()
    addlast!(l2, val1)
    addlast!(l2, val2)
    @test l1 == l2

    d1 = DLinkedList{Float64}()
    addlast!(d1, val1)
    addlast!(d1, val2)
    d2 = DLinkedList{Float64}()
    addlast!(d2, val1)
    addlast!(d2, val2)
    @test d1 == d2
end


function unit_test_linkedlist_eltype()

end


function unit_test_linkedlist_iterate()
    n = 100
    c = rand((1:n), n)
    l = SLinkedList{Int64}()
    for val in c
        addlast!(l, val)
    end
    for (i, v) in enumerate(l)
        @test v == c[i]
    end

    d = DLinkedList{Int64}()
    for val in c
        addlast!(d, val)
    end
    for (i, v) in enumerate(d)
        @test v == c[i]
    end

    return nothing
end


function unit_test_linkedlist_collect()
    n = 100
    c = rand((1:n), n)
    l = SLinkedList{Int64}()
    for val in c
        addlast!(l, val)
    end
    @test c == collect(l)

    d = DLinkedList{Int64}()
    for val in c
        addlast!(d, val)
    end
    @test c == collect(d)

    return nothing
end

# Run the unit tests
@testset "Singly linked list   " begin
    unit_test_slinkedlist_empty()
    unit_test_slinkedlist_addlast()
    unit_test_slinkedlist_addfirst()
    unit_test_slinkedlist_add()
    unit_test_slinkedlist_add_interface()
    unit_test_slinkedlist_addlastfirst()
    unit_test_slinkedlist_removelast()
    unit_test_slinkedlist_removefirst()
    unit_test_slinkedlist_remove()
    unit_test_slinkedlist_remove_interface()
    unit_test_slinkedlist_removelastfirst()
    unit_test_slinkedlist_peekfirst()
    unit_test_slinkedlist_peeklast()
end

@testset "Doubly linked list   " begin
    unit_test_dlinkedlist_empty()
    unit_test_dlinkedlist_addlast()
    unit_test_dlinkedlist_addfirst()
    unit_test_dlinkedlist_add()
    unit_test_dlinkedlist_add_interface()
    unit_test_dlinkedlist_addlastfirst()
    unit_test_dlinkedlist_removelast()
    unit_test_dlinkedlist_removefirst()
    unit_test_dlinkedlist_remove()
    unit_test_dlinkedlist_remove_interface()
    unit_test_dlinkedlist_removelastfirst()
    unit_test_dlinkedlist_peekfirst()
    unit_test_dlinkedlist_peeklast()
end

@testset "Linked list interface" begin
    unit_test_linkedlist_length()
    unit_test_linkedlist_size()
    unit_test_linkedlist_equality()
    unit_test_linkedlist_eltype()
    unit_test_linkedlist_iterate()
    unit_test_linkedlist_collect()
end