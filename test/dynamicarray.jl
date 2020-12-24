import DAT038.DynamicArray,
       DAT038.size,
       DAT038.isempty,
       DAT038.push!,
       DAT038.pop!,
       DAT038.getindex!,
       DAT038.setindex!,
       DAT038.resize!

# Unit test functions
function unit_test_dynamicarray_empty()
    d = DynamicArray{Float64}()
    res = d.capacity == 0

    return res
end

function unit_test_dynamicarray_size()
    d = DynamicArray{Float64}()
    res = size(d) == 0
    
    return res
end

function unit_test_dynamicarray_isempty()
    d = DynamicArray{Float64}()
    res = isempty(d)
    
    return res
end

function unit_test_dynamicarray_push()
    d = DynamicArray{Float64}()
    val = 1.0
    push!(d, val)
    res = d[1] == val
    
    return res
end

function unit_test_dynamicarray_pop()
    d = DynamicArray{Float64}()
    val = 1.0
    push!(d, val)
    res = pop!(d) == val
    
    return res
end

function unit_test_dynamicarray_getindex()
    d = DynamicArray{Float64}()
    val = 2.0
    push!(d, val)
    res = d[1] == val
    
    return res
end

function unit_test_dynamicarray_setindex()
    d = DynamicArray{Float64}()
    val1 = 2.0
    val2 = 3.0
    push!(d, val1)
    d[1] = val2
    res = d[1] == val2
    
    return res
end

function unit_test_dynamicarray_resize()
    d = DynamicArray{Float64}()
    capacity = 8
    resize!(d, capacity)
    res = d.capacity == capacity
    
    return res
end

function unit_test_dynamicarray_speed()
    d = DynamicArray{Float64}()
    n = 10^7

    println("Test adding to dynamic array for n = $n: ")
    @time for i in 1:n
        push!(d, Float64(i))
    end

    println("Test removing from dynamic array for n = $n: ")
    @time for i in 1:n
        pop!(d)
    end

    return true
end
    
# Run the unit tests
@testset "Dynamic array" begin
    @test unit_test_dynamicarray_empty()
    @test unit_test_dynamicarray_size()
    @test unit_test_dynamicarray_isempty()
    @test unit_test_dynamicarray_push()
    @test unit_test_dynamicarray_pop()
    @test unit_test_dynamicarray_getindex()
    @test unit_test_dynamicarray_setindex()
    @test unit_test_dynamicarray_resize()
    @test unit_test_dynamicarray_speed()
end