# Unit test functions
function unit_test_rmheap_empty()
    r = RMHeap{Int}()
    @test r.N == 0

    return nothing
end

function unit_test_rmheap_empty_isheap()
    r = RMHeap{Int}()
    @test isheap(r)

    return nothing
end

function unit_test_rmheap_add()
    r = RMHeap{Int}()
    val1 = 1
    val2 = 2
    val3 = 3
    val4 = 4
    val5 = 5
    add!(r, val1)
    add!(r, val2)
    @test r.root.key == val1
    @test r.root.right.key == val2
    
    return nothing
end

function unit_test_rmheap_remove()
    n = 10^4
    r = RMHeap{Int}()

    @time for i = 1:n
        add!(r, i)
    end

    remove!(r)

    return true
end

function unit_test_minpq_size()
    r = RMHeap{Int}()
    @test size(r) == 0
    val1 = 5
    val2 = 4
    add!(r, val1)
    @test size(r) == 1
    add!(r, val2)
    @test size(r) == 2

    remove!(r)
    @test size(r) == 1

    remove!(r)
    @test size(r) == 0

    return nothing
end

function unit_test_minpq_getmin()
    r = RMHeap{Int}()
    val1 = 5
    val2 = 4
    val3 = 3
    val4 = 2
    val5 = 1
    add!(r, val1)
    add!(r, val2)
    add!(r, val3)
    add!(r, val4)
    add!(r, val5)

    @test getmin(r) == 1

    return nothing
end

function unit_test_minpq_isempty()
    r = RMHeap{Int}()
    @test isempty(r)
    val1 = 5
    add!(r, val1)
    @test isempty(r) == false

    return nothing
end

function unit_test_rmheap_example()
    n = 10^3
    r = RMHeap{Int}()
    
    for i in shuffle(1:n)
        add!(r, i)
        @test isheap(r)
    end

    for i in 1:n
        @test getmin(r) == i
        @test remove!(r) == i
        @test isheap(r)
    end
    @test isempty(r)

    return nothing
end

function unit_test_rmheap_empty_isheap()
    r = RMHeap{Int}()
    @test isheap(r)

    return nothing
end

function unit_test_minpq_empty()
    r = MinPQ{Int}()
    @test r.N == 0

    return nothing
end

function unit_test_minpq_empty_isheap()
    r = MinPQ{Int}()
    @test isheap(r)

    return nothing
end

function unit_test_minpq_add()
    r = MinPQ{Int}()
    val1 = 1
    val2 = 2
    val3 = 3
    val4 = 4
    val5 = 5
    add!(r, val5)
    @test isheap(r)
    add!(r, val4)
    @test isheap(r)
    add!(r, val3)
    @test isheap(r)
    add!(r, val2)
    @test isheap(r)
    add!(r, val1)
    @test isheap(r)
    @test r.root[1] == val1
    @test r.root[2] == val2
    @test r.root[3] == val4
    @test r.root[4] == val5
    @test r.root[5] == val3

    return nothing
end

function unit_test_minpq_greater()
    r = MinPQ{Int}()
    val1 = 1
    val2 = 2
    val3 = 3
    val4 = 4
    val5 = 5
    add!(r, val5)
    add!(r, val4)
    add!(r, val3)
    add!(r, val2)
    add!(r, val1)
    @test greater(r, 2, 1)
    @test greater(r, 1, 2) == false

    return nothing
end

function unit_test_minpq_remove()
    r = MinPQ{Int}()
    val1 = 1
    val2 = 2
    val3 = 3
    val4 = 4
    val5 = 5
    add!(r, val5)
    add!(r, val4)
    add!(r, val3)
    add!(r, val2)
    add!(r, val1)

    @test remove!(r) == val1
    @test isheap(r)
    @test r.root[1] == val2
    @test r.root[2] == val3
    @test r.root[3] == val4
    @test r.root[4] == val5

    @test remove!(r) == val2
    @test isheap(r)
    @test r.root[1] == val3
    @test r.root[2] == val5
    @test r.root[3] == val4

    @test remove!(r) == val3
    @test isheap(r)
    @test r.root[1] == val4
    @test r.root[2] == val5

    @test remove!(r) == val4
    @test isheap(r)
    @test r.root[1] == val5

    @test remove!(r) == val5
    @test isheap(r)

    @test remove!(r) === nothing
    @test isempty(r)
    @test isheap(r)

    return nothing
end

function unit_test_minpq_size()
    r = MinPQ{Int}()
    @test size(r) == 0
    val1 = 5
    val2 = 4
    add!(r, val1)
    @test size(r) == 1
    add!(r, val2)
    @test size(r) == 2

    remove!(r)
    @test size(r) == 1

    remove!(r)
    @test size(r) == 0

    return nothing
end

function unit_test_minpq_getmin()
    r = MinPQ{Int}()
    val1 = 5
    val2 = 4
    val3 = 3
    val4 = 2
    val5 = 1
    add!(r, val1)
    add!(r, val2)
    add!(r, val3)
    add!(r, val4)
    add!(r, val5)

    @test getmin(r) == 1

    return nothing
end

function unit_test_minpq_isempty()
    r = MinPQ{Int}()
    @test isempty(r)
    val1 = 5
    add!(r, val1)
    @test isempty(r) == false

    return nothing
end

function unit_test_minpq_example()
    n = 10^3
    r = MinPQ{Int}()
    
    for i in shuffle(1:n)
        add!(r, i)
        @test isheap(r)
    end

    for i in 1:n
        @test getmin(r) == i
        @test remove!(r) == i
        @test isheap(r)
    end
    @test isempty(r)

    return nothing
end

# Run the unit tests
@testset "Randomised meldable heaps" begin
    unit_test_rmheap_empty()
    unit_test_rmheap_empty_isheap()
    #unit_test_minpq_add() # bit harder, random
    #unit_test_minpq_remove() # bit harder, random
end

@testset "Minimum priority queue   " begin
    #unit_test_minpq_sink()
    #unit_test_minpq_swim()
end