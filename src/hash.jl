"""
    SCHash

Separate chaining hash table, using dynamic arrays.
"""
mutable struct SCHash{K, V}
    table::Vector{Vector{Pair{K, V}}}
    nkeys::Int # number of items
    tablesize::Int # table size 
    function SCHash{K, V}(m::Int = 10) where {K, V}
        table = Vector{Vector{Pair{K, V}}}(undef, m)
        for i in 1:m
            table[i] = []
        end
        new(table, 0, m)
    end
end

"""
    SCLHash

Separate chaining hash table, using linked list.
"""
mutable struct SCLHash{K, V}
    table::Vector{DLinkedList{Pair{K, V}}}
    nkeys::Int
    tablesize::Int
    function SCLHash{K, V}(m::Int = 10) where {K, V}
        table = Vector{DLinkedList{Pair{K, V}}}(undef, m)
        for i in 1:m
            table[i] = DLinkedList{Pair{K, V}}()
        end
        new(table, 0, m)
    end
end

"""
    hash(map, key)

Hash function for key, implement for allowed key types, for now Numbers and Strings.
"""
function hash(map::Union{SCHash, SCLHash}, key::K) where K <: Number
    return compress(Int(ceil(abs(key))), map.tablesize)
end

function hash(map::Union{SCHash, SCLHash}, key::K) where K <: AbstractString
    h = 0
    for c in key
        h  = 37h + UInt8(c)
    end
    return compress(h, map.tablesize)
end

"""
    compress(h, tablesize)

Compress the hash, quite simple.
"""
function compress(h::Int, tablesize::Int)
    return h % tablesize + 1
end

"""
    get(map, key)

Get value from key.
"""
function get(map::SCHash, key::K) where K
    if map.nkeys == 0 return nothing end

    bucket = map.table[hash(map, key)]
    for (i, v) in enumerate(bucket)
        if key == v[1]
            return v[2]
        end
    end

    return nothing
end

function get(map::SCLHash, key::K) where K
    if map.nkeys == 0 return nothing end

    bucket = map.table[hash(map, key)]
    n = bucket.head
    while n != n.next
        if key == n.value[1]
            return n.value[2]
        end
    end

    return nothing
end

"""
    put(map, key, value)

Add value to hash table with key.
"""
function put!(map::SCHash, key::K, value::V) where {K, V}
    bucket = map.table[hash(map, key)]
    for (i, v) in enumerate(bucket)
        if key == v[1]
            bucket[i] = Pair(key, value)
            return nothing
        end
    end
    push!(bucket, Pair(key, value))
    map.nkeys += 1

    #if map.nkeys > 8 * map.tablesize resize(map) end

    return nothing
end

function put!(map::SCLHash, key::K, value::V) where {K, V}
    bucket = map.table[hash(map, key)]
    n = bucket.head
    while n != n.next
        if key == n.value[1]
            n.value = Pair(key, value)
            return nothing
        end
        n = n.next
    end
    addlast!(bucket, Pair(key, value))
    map.nkeys += 1
    map.tablesize = length(map.table)

    return nothing
end

"""
    delete!(map, key)

Delete kay value pair from map.
"""
function delete!(map::SCHash, key::K)  where K
    bucket = map.table[hash(map, key)]
    for (i, v) in enumerate(bucket)
        if key == v[1]
            bucket[i][2] = value
            return nothing
        end
    end

    return nothing
end

function delete!(map::SCLHash, key::K)  where K
    h = hash(map, key)
    bucket = map.table[h]
    n = bucket.head
    while n != n.next
        if key == n.value[1]
            n.prev.next = n.next
            n.next.prev = n.prev
            return nothing
        end
    end

    return nothing
end

"""
    resize(map, factor)

Resize the map. Resizing should be to a close prime (not implemented).
"""
function resize(map::SCHash{K, V}, factor) where {K,V}
    oldtable = map.table
    map.table = Vector{Vector{Pair{K, V}}}(undef, factor * map.tablesize)
    for bucket in oldtable
        for i in bucket
            put!(map, i)
        end
    end
end

function resize(map::SCLHash{K, V}, factor) where {K,V}
    oldtable = map.table
    map.table = Vector{DLinkedList{Pair{K, V}}}(undef, factor * map.tablesize)
    for bucket in oldtable
        n = bucket.head
        while n != n.next
            put!(map, n.value)
            n = n.next
        end
    end
end

"""
    OAHash

Open addressing hash table.
"""
struct OAHash
    table
end

