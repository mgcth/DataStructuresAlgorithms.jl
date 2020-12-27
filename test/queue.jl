# Unit test functions
function unit_test_queue()
    q = Queue(DLinkedList{Float64}())
    @test true

    return nothing
end

function unit_test_queue_isempty()
    q = Queue(DLinkedList{Float64}())
    res = isempty(q)

    return nothing
end

function unit_test_queue_enqueue()
    q = Queue(DLinkedList{Float64}())
    
    val1 = 1.0
    val2 = 2.0
    enqueue!(q, val1)
    enqueue!(q, val2)
    @test q.data.head.value == val1
    @test q.data.head.next.value == val2
    @test length(q) == 2

    return nothing
end

function unit_test_queue_dequeue()
    q = Queue(DLinkedList{Float64}())
    
    val1 = 1.0
    val2 = 2.0
    enqueue!(q, val1)
    enqueue!(q, val2)
    @test length(q) == 2
    @test q.data.head.value == val1
    @test q.data.head.next.value == val2
    @test dequeue!(q) == val1
    @test dequeue!(q) == val2
    @test length(q) == 0

    return nothing
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
    @test length(q) == 2
    @test q.data.head.value == val1
    @test q.data.head.next.value == val2
    @test dequeue!(q) == val1
    enqueue!(q, val3)
    @test dequeue!(q) == val2
    enqueue!(q, val4)
    @test dequeue!(q) == val3
    @test dequeue!(q) == val4
    @test length(q) == 0

    return nothing
end

function unit_test_queue_peek()
    res = []
    q = Queue(DLinkedList{Float64}())
    
    val1 = 1.0
    val2 = 2.0
    enqueue!(q, val1)
    enqueue!(q, val2)
    @test peek(q) == val1
    @test peek(q) == val1
    @test length(q) == 2

    return nothing
end

function unit_test_queue_length()
    res = []

    q = Queue(DLinkedList{Float64}())
    val = 1.0
    enqueue!(q, val)
    @test size(q) == 1
    @test length(q) == 1

    return nothing
end

# Run the unit tests
@testset "Queue" begin
    unit_test_queue()
    unit_test_queue_isempty()
    unit_test_queue_enqueue()
    unit_test_queue_dequeue()
    unit_test_queue_enqueuedequeue()
    unit_test_queue_peek()
    unit_test_queue_length()
end