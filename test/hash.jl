# Unit test functions
function unit_test_compress()
    for i in 0:4
        @test compress(i, 1) == 1
    end

    for i in 0:5
        @test compress(i, 2) == i % 2 + 1
    end

    for i in 0:30
        @test compress(i, 10) == i % 10 + 1
    end
    
    return nothing
end

function unit_test_hash_number()
    m = SCHash{Int, Float64}()
    for i in -40:40
        @test hash(m, i) == Int(ceil(abs(i))) % m.tablesize + 1
    end

    m = SCHash{Float64, Float64}()
    for i in -40:40
        @test hash(m, Float64(i)) == Int(ceil(abs(i))) % m.tablesize + 1
    end

    m = SCHash{Complex{Float64}, Float64}()
    for i in -40:40
        a = Float64(i) + Float64(i)*im
        @test hash(m, a) == Int(ceil(abs(a))) % m.tablesize + 1
    end
    
    return nothing
end

function unit_test_hash_string()
    m = SCHash{String, Float64}()
    for i in ["abc", "com", "truss", "buss", "mycele", "new"]
        h = 0
        for c in i
            h  = 37h + UInt8(c)
        end
        @test hash(m, i) == h % m.tablesize + 1
    end
    
    return nothing
end

function unit_test_schash_empty()
    m = SCHash{Int, Float64}()
    @test m.nkeys == 0
    @test m.tablesize == 10
    
    return nothing
end

function unit_test_schash_put()
    m = SCHash{Int, Float64}()
    put!(m, 1, 1.0)
    @test m.table[hash(m, 1)][1] == Pair(1, 1.0)
    put!(m, 2, 2.0)
    @test m.table[hash(m, 2)][1] == Pair(2, 2.0)
    put!(m, 3, 3.0)
    @test m.table[hash(m, 3)][1] == Pair(3, 3.0)
    put!(m, 11, 4.0)
    @test m.table[hash(m, 11)][2] == Pair(11, 4.0)
    put!(m, 21, 5.0)
    @test m.table[hash(m, 11)][3] == Pair(21, 5.0)

    
    
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
    @test binarysearch(a, 0.0) == 0
    @test binarysearch(a, 2.0) == 0
    @test binarysearch(a, NaN) == 0
    @test binarysearch(a, Inf) == 0
    
    return nothing
end

function unit_test_binarysearch_one()
    a = [10.0]
    @test binarysearch(a, 0.0) == 0
    @test binarysearch(a, 10.0) == 1
    @test binarysearch(a, NaN) == 0
    @test binarysearch(a, Inf) == 0

    a = [10]
    @test binarysearch(a, 0) == 0
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
    @test binarysearch(a, NaN) == 0
    @test binarysearch(a, Inf) == 0
    
    return nothing
end
    
# Run the unit tests
@testset "Hash and compress           " begin
    unit_test_compress()
    unit_test_hash_number()
    unit_test_hash_string()
end

@testset "Separate chaining hash table" begin
    unit_test_schash_empty()
    unit_test_schash_put()
    #unit_test_schash_get()
    #unit_test_schash_delete()
    #unit_test_schash_resize()
end

@testset "Open addressing hash table  " begin
    #unit_test_binarysearch_empty()
    #unit_test_binarysearch_one()
    #unit_test_binarysearch_many()
    #unit_test_binarysearch_string()
end