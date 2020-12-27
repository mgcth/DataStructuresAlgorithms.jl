# Unit test functions
function unit_test_stack()
    s = Stack(Vector{Float64}(undef, 0))
    @test true

    return nothing
end

function unit_test_stack_isempty()
    s = Stack(Vector{Float64}(undef, 0))
    @test isempty(s)

    return nothing
end

function unit_test_stack_push()
    s = Stack(Vector{Float64}(undef, 0))
    val = 1.0
    push!(s, val)
    @test s.data[1] == val

    return nothing
end

function unit_test_stack_pop()
    s = Stack(Vector{Float64}(undef, 0))
    val = 1.0
    push!(s, val)
    @test pop!(s) == val
    @test isempty(s)

    return nothing
end

function unit_test_stack_peek()
    s = Stack(Vector{Float64}(undef, 0))
    val = 1.0
    push!(s, val)
    @test peek(s) == val

    return nothing
end

function unit_test_stack_size()
    s = Stack(Vector{Float64}(undef, 0))
    val = 1.0
    push!(s, val)
    @test size(s) == 1
    @test length(s) == 1

    return nothing
end

# Run the unit tests
@testset "Stack" begin
    unit_test_stack()
    unit_test_stack_isempty()
    unit_test_stack_push()
    unit_test_stack_pop()
    unit_test_stack_peek()
    unit_test_stack_size()
end