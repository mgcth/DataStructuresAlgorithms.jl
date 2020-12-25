# Unit test functions
function test_rmheap()
    n = 10^4
    r = RMHeap{Float64}()

    @time for i = 1:n
        add!(r, convert(Float64, i))
    end

    @time remove!(r)

    # @time for i = 1:n
    #     remove(r)
    # end
    return true
end

function test_minpq()
    n = 10^4
    r = MinPQ{Int}()

    @time for i = 1:n
        add!(r, i)
    end

    @time add!(r, 1)
    return true
end

# Run the unit tests
@testset "Minimum priority queue   " begin
    @test test_rmheap()
end

@testset "Randomised meldable heaps" begin
    @test test_minpq()
end