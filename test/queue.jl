# Unit test functions
function unit_test_queue()
    q = Queue(DLinkedList{Float64}())
    res = true

    return res
end

function unit_test_queue_isempty()
    q = Queue(DLinkedList{Float64}())
    res = isempty(q)

    return res
end

function unit_test_queue_enqueue()
    res = []
    q = Queue(DLinkedList{Float64}())
    
    val1 = 1.0
    val2 = 2.0
    enqueue!(q, val1)
    enqueue!(q, val2)
    push!(res, q.data.head.value == val1)
    push!(res, q.data.head.next.value == val2)
    push!(res, length(q) == 2)

    return all(res)
end

function unit_test_queue_dequeue()
    res = []
    q = Queue(DLinkedList{Float64}())
    
    val1 = 1.0
    val2 = 2.0
    enqueue!(q, val1)
    enqueue!(q, val2)
    push!(res, length(q) == 2)
    push!(res, q.data.head.value == val1)
    push!(res, q.data.head.next.value == val2)
    push!(res, dequeue!(q) == val1)
    push!(res, dequeue!(q) == val2)
    push!(res, length(q) == 0)

    return all(res)
end

function unit_test_queue_enqueuedequeue()
    res = []
    q = Queue(DLinkedList{Float64}())
    
    val1 = 1.0
    val2 = 2.0
    val3 = 3.0
    val4 = 4.0
    enqueue!(q, val1)
    enqueue!(q, val2)
    push!(res, length(q) == 2)
    push!(res, q.data.head.value == val1)
    push!(res, q.data.head.next.value == val2)
    push!(res, dequeue!(q) == val1)
    enqueue!(q, val3)
    push!(res, dequeue!(q) == val2)
    enqueue!(q, val4)
    push!(res, dequeue!(q) == val3)
    push!(res, dequeue!(q) == val4)
    push!(res, length(q) == 0)

    return all(res)
end

function unit_test_queue_peek()
    res = []
    q = Queue(DLinkedList{Float64}())
    
    val1 = 1.0
    val2 = 2.0
    enqueue!(q, val1)
    enqueue!(q, val2)
    push!(res, peek(q) == val1)
    push!(res, peek(q) == val1)
    push!(res, length(q) == 2)

    return all(res)
end

function unit_test_queue_length()
    res = []

    q = Queue(DLinkedList{Float64}())
    val = 1.0
    enqueue!(q, val)
    push!(res, size(q) == 1)
    push!(res, length(q) == 1)

    return all(res)
end

# Run the unit tests
@testset "Queue" begin
    @test unit_test_queue()
    @test unit_test_queue_isempty()
    @test unit_test_queue_enqueue()
    @test unit_test_queue_dequeue()
    @test unit_test_queue_enqueuedequeue()
    @test unit_test_queue_peek()
    @test unit_test_queue_length()
end