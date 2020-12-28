# Unit test functions
function test_rmheap()
    n = 10^4
    r = RMHeap{Int}()

    @time for i = 1:n
        add!(r, i)
    end

    remove!(r)

    return true
end

function test_minpq()
    n = 10^4
    r = MinPQ{Int}()

    for i = 1:n
        add!(r, i)
    end

    add!(r, 1)
    return true
end

# Run the unit tests
@testset "Minimum priority queue   " begin
    @test test_rmheap()
end

@testset "Randomised meldable heaps" begin
    @test test_minpq()
end