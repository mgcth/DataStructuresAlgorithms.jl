import DAT038.selectionsort,
       DAT038.insertionsort,
       DAT038.mergesort

# Unit test functions
function unit_test_selectionsort_empty()
    a = Vector{Float64}(undef, 0)
    res = selectionsort(a) .== a
    
    return all(res)
end

function unit_test_selectionsort_one()
    res = []

    a = [10.0]
    append!(res, selectionsort(a) .== a)

    a = [10]
    append!(res, selectionsort(a) .== a)
    
    return all(res)
end

function unit_test_selectionsort_many()
    # known example list
    a = [10.0, 1.0, 10.0, 3.0, 5.0, 6.0]
    as = [1.0, 3.0, 5.0, 6.0, 10.0, 10.0]
    res = selectionsort(a) .== as
    
    return all(res)
end

function unit_test_selectionsort_real()
    n = 10^3
    # random example list
    a = rand((0:n), n)
    as = sort(a)
    res = selectionsort(a) .== as
    
    return all(res)
end

function unit_test_selectionsort_string()
    # known example list
    a = "A search has no name."
    as = sort(a) # use built in for answer
    res = selectionsort(a, "A") .== as
    
    return all(res)
end

function unit_test_selectionsort_benchmark()
    n = 10^4
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in selection sort for n = $n: ")
    @time res = selectionsort(a) 
    res = res .== as

    return all(res)
end

function unit_test_insertionsort_empty()
    a = Vector{Float64}(undef, 0)
    res = insertionsort(a) .== a
    
    return all(res)
end

function unit_test_insertionsort_one()
    res = []

    a = [10.0]
    append!(res, insertionsort(a) .== a)

    a = [10]
    append!(res, insertionsort(a) .== a)
    
    return all(res)
end

function unit_test_insertionsort_many()
    # known example list
    a = [10.0, 1.0, 10.0, 3.0, 5.0, 6.0]
    as = [1.0, 3.0, 5.0, 6.0, 10.0, 10.0]
    res = insertionsort(a) .== as
    
    return all(res)
end

function unit_test_insertionsort_real()
    n = 10^3
    # random example list
    a = rand((0:n), n)
    as = sort(a)
    res = insertionsort(a) .== as
    
    return all(res)
end

function unit_test_insertionsort_string()
    # known example list
    a = "A search has no name."
    as = sort(a) # use built in for answer
    res = insertionsort(a, "A") .== as
    
    return all(res)
end

function unit_test_insertionsort_benchmark()
    n = 10^4
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in insertion sort for n = $n: ")
    @time res = insertionsort(a) 
    res = res .== as

    return all(res)
end

function unit_test_mergesort_empty()
    a = Vector{Float64}(undef, 0)
    res = mergesort(a) .== a
    
    return all(res)
end

function unit_test_mergesort_one()
    res = []

    a = [10.0]
    append!(res, mergesort(a) .== a)

    a = [10]
    append!(res, mergesort(a) .== a)
    
    return all(res)
end

function unit_test_mergesort_many()
    # known example list
    a = [10.0, 1.0, 10.0, 3.0, 5.0, 6.0]
    as = [1.0, 3.0, 5.0, 6.0, 10.0, 10.0]
    res = mergesort(a) .== as
    
    return all(res)
end

function unit_test_mergesort_real()
    n = 10^4
    # random example list
    a = rand((0:n), n)
    as = sort(a)
    res = mergesort(a) .== as
    
    return all(res)
end

function unit_test_mergesort_string()
    # known example list
    a = "A search has no name."
    as = sort(a) # use built in for answer
    res = mergesort(a, "A") .== as
    
    return all(res)
end

function unit_test_mergesort_benchmark()
    n = 10^5
    a = rand((0:n), n)
    as = sort(a)

    println("Test performance in merge sort for n = $n: ")
    @time res = mergesort(a) 
    res = res .== as

    return all(res)
end
    
# Run the unit tests
@testset "Selection sort" begin
    @test unit_test_selectionsort_empty()
    @test unit_test_selectionsort_one()
    @test unit_test_selectionsort_many()
    @test unit_test_selectionsort_real()
    # @test unit_test_selectionsort_string()
    @test unit_test_selectionsort_benchmark()
end

@testset "Insertion sort" begin
    @test unit_test_insertionsort_empty()
    @test unit_test_insertionsort_one()
    @test unit_test_insertionsort_many()
    @test unit_test_insertionsort_real()
    # @test unit_test_insertionsort_string()
    @test unit_test_insertionsort_benchmark()
end

@testset "Merge sort" begin
    @test unit_test_mergesort_empty()
    @test unit_test_mergesort_one()
    @test unit_test_mergesort_many()
    @test unit_test_mergesort_real()
    # @test unit_test_mergesort_string()
    @test unit_test_mergesort_benchmark()
end