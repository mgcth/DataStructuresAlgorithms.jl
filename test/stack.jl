import DAT038.Stack,
       DAT038.push!,
       DAT038.pop!,
       DAT038.peek,
       DAT038.size,
       DAT038.isempty

# Unit test functions
function unit_test_stack()
    s = Stack(Vector{Float64}(undef, 0))
    res = true

    return res
end

function unit_test_stack_isempty()
    s = Stack(Vector{Float64}(undef, 0))
    res = isempty(s)

    return res
end

function unit_test_stack_push()
    s = Stack(Vector{Float64}(undef, 0))
    val = 1.0
    push!(s, val)
    res = s.data[1] == val

    return res
end

function unit_test_stack_pop()
    res = []
    s = Stack(Vector{Float64}(undef, 0))
    val = 1.0
    push!(s, val)
    push!(res, pop!(s) == val)
    push!(res, isempty(s))

    return all(res)
end

function unit_test_stack_peek()
    s = Stack(Vector{Float64}(undef, 0))
    val = 1.0
    push!(s, val)
    res = peek(s) == val

    return res
end

function unit_test_stack_size()
    res = []

    s = Stack(Vector{Float64}(undef, 0))
    val = 1.0
    push!(s, val)
    push!(res, size(s) == 1)
    push!(res, length(s) == 1)

    return all(res)
end

# Run the unit tests
@testset "Stack" begin
    @test unit_test_stack()
    @test unit_test_stack_isempty()
    @test unit_test_stack_push()
    @test unit_test_stack_pop()
    @test unit_test_stack_peek()
    @test unit_test_stack_size()
end