# Unit test functions
function unit_test_linearsearch_empty()
    a = Vector{Float64}(undef, 0)
    @test linearsearch(a, 0.0) == 0
    @test linearsearch(a, 2.0) == 0
    @test linearsearch(a, NaN) == 0
    @test linearsearch(a, Inf) == 0
    
    return nothing
end

function unit_test_linearsearch_one()
    a = [10.0]
    @test linearsearch(a, 0.0) == 0
    @test linearsearch(a, 10.0) == 1
    @test linearsearch(a, NaN) == 0
    @test linearsearch(a, Inf) == 0

    a = [10]
    @test linearsearch(a, 0) == 0
    @test linearsearch(a, 10) == 1
    
    return nothing
end

function unit_test_linearsearch_many()
    # known example list
    a = [10.0, 1.0, 10.0, 3.0, 5.0, 6.0]
    @test linearsearch(a, 10.0) == 1
    @test linearsearch(a, 1.0) == 2
    @test linearsearch(a, 3.0) == 4
    @test linearsearch(a, 5.0) == 5
    @test linearsearch(a, 6.0) == 6
    @test linearsearch(a, NaN) == 0
    @test linearsearch(a, Inf) == 0
    
    return nothing
end

function unit_test_linearsearch_string()
    # known example list
    a = "A search has no name."
    @test linearsearch(a, "A") == 1
    @test linearsearch(a, " ") == 2
    @test linearsearch(a, "n") == 14
    
    return nothing
end

function unit_test_binarysearch_empty()
    a = Vector{Float64}(undef, 0)
    @test binarysearch(a, 0.0) === nothing
    @test binarysearch(a, 2.0) === nothing
    @test binarysearch(a, NaN) === nothing
    @test binarysearch(a, Inf) === nothing
    
    return nothing
end

function unit_test_binarysearch_one()
    a = [10.0]
    @test binarysearch(a, 0.0) === nothing
    @test binarysearch(a, 10.0) == 1
    @test binarysearch(a, NaN) === nothing
    @test binarysearch(a, Inf) === nothing

    a = [10]
    @test binarysearch(a, 0) === nothing
    @test binarysearch(a, 10) == 1
    
    return nothing
end

function unit_test_binarysearch_many()
    # known example list
    a = [1.0, 3.0, 5.0, 6.0, 10.0, 10.0]
    @test binarysearch(a, 10.0) == 5
    @test binarysearch(a, 1.0) == 1
    @test binarysearch(a, 3.0) == 2
    @test binarysearch(a, 5.0) == 3
    @test binarysearch(a, 6.0) == 4
    @test binarysearch(a, NaN) === nothing
    @test binarysearch(a, Inf) === nothing
    
    return nothing
end

function unit_test_binarysearch_string()
    # known example list
    a = "abcdefgh"
    @test binarysearch(a, "a") == 1
    @test binarysearch(a, "b") == 2
    @test binarysearch(a, "c") == 3
    @test binarysearch(a, "d") == 4
    @test binarysearch(a, "e") == 5
    @test binarysearch(a, "f") == 6
    @test binarysearch(a, "g") == 7
    @test binarysearch(a, "h") == 8
    @test binarysearch(a, " ") === nothing
    @test binarysearch(a, "i") === nothing
    @test binarysearch(a, "0") === nothing
    
    return nothing
end
    
# Run the unit tests
@testset "Linear search " begin
    unit_test_linearsearch_empty()
    unit_test_linearsearch_one()
    unit_test_linearsearch_many()
    unit_test_linearsearch_string()
end

@testset "Binary search " begin
    unit_test_binarysearch_empty()
    unit_test_binarysearch_one()
    unit_test_binarysearch_many()
    unit_test_binarysearch_string()
end