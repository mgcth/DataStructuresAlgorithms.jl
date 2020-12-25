import DAT038.linearsearch,
       DAT038.binarysearch

# Unit test functions
function unit_test_linearsearch_empty()
    res = []

    a = Vector{Float64}(undef, 0)
    push!(res, linearsearch(a, 0.0) == 0)
    push!(res, linearsearch(a, 2.0) == 0)
    push!(res, linearsearch(a, NaN) == 0)
    push!(res, linearsearch(a, Inf) == 0)
    
    return res
end

function unit_test_linearsearch_one()
    res = []

    a = [10.0]
    push!(res, linearsearch(a, 0.0) == 0)
    push!(res, linearsearch(a, 10.0) == 1)
    push!(res, linearsearch(a, NaN) == 0)
    push!(res, linearsearch(a, Inf) == 0)

    a = [10]
    push!(res, linearsearch(a, 0) == 0)
    push!(res, linearsearch(a, 10) == 1)
    
    return res
end

function unit_test_linearsearch_many()
    res = []

    # known example list
    a = [10.0, 1.0, 10.0, 3.0, 5.0, 6.0]
    push!(res, linearsearch(a, 10.0) == 1)
    push!(res, linearsearch(a, 1.0) == 2)
    push!(res, linearsearch(a, 3.0) == 4)
    push!(res, linearsearch(a, 5.0) == 5)
    push!(res, linearsearch(a, 6.0) == 6)
    push!(res, linearsearch(a, NaN) == 0)
    push!(res, linearsearch(a, Inf) == 0)
    
    return res
end

function unit_test_linearsearch_string()
    res = []

    # known example list
    a = "A search has no name."
    push!(res, linearsearch(a, "A") == 1)
    push!(res, linearsearch(a, " ") == 2)
    push!(res, linearsearch(a, "n") == 14)
    
    return all(res)
end

function unit_test_linearsearch_benchmark()
    n = 10^7 - 1
    a = rand((0:n), n)
    push!(a, n+1)

    println("Test performance in linear search for n = $(n+1): ")
    el = findfirst(x->x == a[end], a)
    @time res = linearsearch(a, a[end]) == el
    
    return all(res)
end

function unit_test_binarysearch_empty()
    res = []

    a = Vector{Float64}(undef, 0)
    push!(res, binarysearch(a, 0.0) == 0)
    push!(res, binarysearch(a, 2.0) == 0)
    push!(res, binarysearch(a, NaN) == 0)
    push!(res, binarysearch(a, Inf) == 0)
    
    return all(res)
end

function unit_test_binarysearch_one()
    res = []

    a = [10.0]
    push!(res, binarysearch(a, 0.0) == 0)
    push!(res, binarysearch(a, 10.0) == 1)
    push!(res, binarysearch(a, NaN) == 0)
    push!(res, binarysearch(a, Inf) == 0)

    a = [10]
    push!(res, binarysearch(a, 0) == 0)
    push!(res, binarysearch(a, 10) == 1)
    
    return all(res)
end

function unit_test_binarysearch_many()
    res = []

    # known example list
    a = [1.0, 3.0, 5.0, 6.0, 10.0, 10.0]
    push!(res, binarysearch(a, 10.0) == 5)
    push!(res, binarysearch(a, 1.0) == 1)
    push!(res, binarysearch(a, 3.0) == 2)
    push!(res, binarysearch(a, 5.0) == 3)
    push!(res, binarysearch(a, 6.0) == 4)
    push!(res, binarysearch(a, NaN) == 0)
    push!(res, binarysearch(a, Inf) == 0)
    
    return all(res)
end

function unit_test_binarysearch_string()
    res = []

    # known example list
    a = "abcdefgh"
    push!(res, binarysearch(a, "a") == 1)
    push!(res, binarysearch(a, "b") == 2)
    push!(res, binarysearch(a, "c") == 3)
    push!(res, binarysearch(a, "d") == 4)
    push!(res, binarysearch(a, "e") == 5)
    push!(res, binarysearch(a, "f") == 6)
    push!(res, binarysearch(a, "g") == 7)
    push!(res, binarysearch(a, "h") == 8)
    push!(res, binarysearch(a, " ") == 0)
    push!(res, binarysearch(a, "i") == 0)
    push!(res, binarysearch(a, "0") == 0)
    
    return all(res)
end

function unit_test_binarysearch_benchmark()
    n = 10^7-1
    a = sort(rand((0:n), n))
    push!(a, n+1)

    println("Test performance in binary search for n = $(n+1): ")
    @time res = binarysearch(a, a[end]) == a[end]

    return all(res)
end
    
# Run the unit tests
@testset "Linear search" begin
    @test unit_test_linearsearch_empty()
    @test unit_test_linearsearch_one()
    @test unit_test_linearsearch_many()
    @test unit_test_linearsearch_string()
    @test unit_test_linearsearch_benchmark()
end

@testset "Binary search" begin
    @test unit_test_binarysearch_empty()
    @test unit_test_binarysearch_one()
    @test unit_test_binarysearch_many()
    @test unit_test_binarysearch_string()
    @test unit_test_binarysearch_benchmark()
end