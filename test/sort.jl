# Unit test functions
function unit_test_selectionsort_empty()
    a = Vector{Float64}(undef, 0)
    @test selectionsort(a) == a
    
    return nothing
end

function unit_test_selectionsort_one()
    a = [10.0]
    @test selectionsort(a) == a

    a = [10]
    @test selectionsort(a) == a
    
    return nothing
end

function unit_test_selectionsort_many()
    # known example list
    a = [10.0, 1.0, 10.0, 3.0, 5.0, 6.0]
    as = [1.0, 3.0, 5.0, 6.0, 10.0, 10.0]
    @test selectionsort(a) == as
    
    return nothing
end

function unit_test_selectionsort_real()
    n = 10^3
    # random example list
    a = rand((0:n), n)
    as = sort(a)
    @test selectionsort(a) == as
    
    return nothing
end

function unit_test_selectionsort_string()
    # known example list
    a = "A search has no name."
    as = sort(a) # use built in for answer
    @test selectionsort(a, "A") == as
    
    return nothing
end

function unit_test_insertionsort_empty()
    a = Vector{Float64}(undef, 0)
    @test insertionsort(a) == a
    
    return nothing
end

function unit_test_insertionsort_one()
    a = [10.0]
    @test insertionsort(a) == a

    a = [10]
    @test insertionsort(a) == a
    
    return nothing
end

function unit_test_insertionsort_many()
    # known example list
    a = [10.0, 1.0, 10.0, 3.0, 5.0, 6.0]
    as = [1.0, 3.0, 5.0, 6.0, 10.0, 10.0]
    @test insertionsort(a) == as
    
    return nothing
end

function unit_test_insertionsort_real()
    n = 10^3
    # random example list
    a = rand((0:n), n)
    as = sort(a)
    @test insertionsort(a) == as
    
    return nothing
end

function unit_test_insertionsort_string()
    # known example list
    a = "A search has no name."
    as = sort(a) # use built in for answer
    @test insertionsort(a, "A") == as
    
    return nothing
end

function unit_test_mergesort_empty()
    a = Vector{Float64}(undef, 0)
    @test mergesort(a) == a
    
    return nothing
end

function unit_test_mergesort_one()
    a = [10.0]
    @test mergesort(a) == a

    a = [10]
    @test mergesort(a) == a
    
    return nothing
end

function unit_test_mergesort_many()
    # known example list
    a = [10.0, 1.0, 10.0, 3.0, 5.0, 6.0]
    as = [1.0, 3.0, 5.0, 6.0, 10.0, 10.0]
    @test mergesort(a) == as
    
    return nothing
end

function unit_test_mergesort_real()
    n = 10^4
    # random example list
    a = rand((0:n), n)
    as = sort(a)
    @test mergesort(a) == as
    
    return nothing
end

function unit_test_mergesort_string()
    # known example list
    a = "A search has no name."
    as = sort(a) # use built in for answer
    @test mergesort(a, "A") == as
    
    return nothing
end
    
# Run the unit tests
@testset "Selection sort" begin
    unit_test_selectionsort_empty()
    unit_test_selectionsort_one()
    unit_test_selectionsort_many()
    unit_test_selectionsort_real()
    # unit_test_selectionsort_string()
end

@testset "Insertion sort" begin
    unit_test_insertionsort_empty()
    unit_test_insertionsort_one()
    unit_test_insertionsort_many()
    unit_test_insertionsort_real()
    # unit_test_insertionsort_string()
end

@testset "Merge sort " begin
    unit_test_mergesort_empty()
    unit_test_mergesort_one()
    unit_test_mergesort_many()
    unit_test_mergesort_real()
    # unit_test_mergesort_string()
end