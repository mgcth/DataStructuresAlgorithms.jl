# Unit test functions
function test_bst()
    res = []
    
    n = 10^5
    c = rand((1:n), n)
    t = BST{Int64, Int64}()

    @time for i in c
        put!(t, i, 2i)
    end

    @time for i in 1:n
        push!(res, get!(t, c[i]) == 2c[i])
    end

    return all(res)
end

# Run the unit tests
@testset "Minimum priority queue   " begin
    @test test_bst()
end