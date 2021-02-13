# Unit test functions
function unit_test_dynamicarray_empty()
    d = DynamicArray{Float64}()
    @test d.capacity == 0

    return nothing
end


function unit_test_dynamicarray_size()
    d = DynamicArray{Float64}()
    @test size(d) == 0
    
    return nothing
end


function unit_test_dynamicarray_isempty()
    d = DynamicArray{Float64}()
    @test isempty(d)
    
    return nothing
end


function unit_test_dynamicarray_push()
    d = DynamicArray{Float64}()
    val = 1.0
    push!(d, val)
    @test d[1] == val
    
    return nothing
end


function unit_test_dynamicarray_pop()
    d = DynamicArray{Float64}()
    val = 1.0
    push!(d, val)
    @test pop!(d) == val
    
    return nothing
end


function unit_test_dynamicarray_getindex()
    d = DynamicArray{Float64}()
    val = 2.0
    push!(d, val)
    @test d[1] == val
    
    return nothing
end


function unit_test_dynamicarray_setindex()
    d = DynamicArray{Float64}()
    val1 = 2.0
    val2 = 3.0
    push!(d, val1)
    d[1] = val2
    @test d[1] == val2
    
    return nothing
end


function unit_test_dynamicarray_resize()
    d = DynamicArray{Float64}()
    capacity = 8
    resize!(d, capacity)
    @test d.capacity == capacity
    
    return nothing
end


function unit_test_dynamicarray_out_of_bounds()
    d = DynamicArray{Float64}()
    val = 2.0
    push!(d, val)
    @test_throws BoundsError d[2]
    
    return nothing
end
 

# Run the unit tests
@testset "Dynamic array" begin
    unit_test_dynamicarray_empty()
    unit_test_dynamicarray_size()
    unit_test_dynamicarray_isempty()
    unit_test_dynamicarray_push()
    unit_test_dynamicarray_pop()
    unit_test_dynamicarray_getindex()
    unit_test_dynamicarray_setindex()
    unit_test_dynamicarray_resize()
    unit_test_dynamicarray_out_of_bounds()
end