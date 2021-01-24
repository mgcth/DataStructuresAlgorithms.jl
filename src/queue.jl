"""
    Queue

A simple queue interface based on a doubly linked list.
"""
struct Queue{T <: DLinkedList}
    data::T
end


"""
    enqueue!(q::Queue{DLinkedList{T}}, x::T)

Enqueue element (last in) the queue. Time complexity O(1).
"""
function enqueue!(q::Queue{DLinkedList{T}}, x::T) where T
    addlast!(q.data, x)
    return nothing
end


"""
    dequeue!(q::Queue)

Remove first element from the queue. Time complexity O(1).
"""
dequeue!(q::Queue) = removefirst!(q.data)


"""
    peek(q::Queue)

Lookup first queue element, don't remove.
"""
peek(q::Queue) = peekfirst(q.data)


"""
    length(q::Queue)

Get size of queue.
"""
length(q::Queue) = length(q.data)


"""
    size(q::Queue)

Get size of queue.
"""
size(q::Queue) = length(q)


"""
    isempty(q::Queue)

Check if queue is empty.
"""
isempty(q::Queue) = length(q) == 0