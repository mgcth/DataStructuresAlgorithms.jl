# Unit test functions
function test_bst_empty()
    t = BST{Int64, Int64}()
    @test isbst(t)

    return nothing
end

# should test isbst also

function test_bst_put()
    t = BST{Int64, Int64}()
    put!(t, 5, 1)
    @test isbst(t)
    put!(t, 7, 2)
    @test isbst(t)
    put!(t, 2, 3)
    @test isbst(t)
    @test t.root.key == 5
    @test t.root.right.key == 7
    @test t.root.left.key == 2

    return nothing
end

function test_bst_get()
    res = []
    
    t = BST{Int64, Int64}()

    put!(t, 5, 1)
    @test isbst(t)
    put!(t, 7, 2)
    @test isbst(t)
    put!(t, 2, 3)
    @test isbst(t)
    @test get!(t, 5) == 1
    @test get!(t, 7) == 2
    @test get!(t, 2) == 3

    return nothing
end

function test_bst_putget()
    n = 10^3
    c = rand((1:n), n)
    t = BST{Int64, Int64}()
    @test isbst(t)

    for i in c
        put!(t, i, 2i)
        @test isbst(t)
    end

    for i in sort(c)
        @test get!(t, i) == 2i
    end

    return nothing
end

function test_bst_delete()    
    c = [5, 3, 4, 8, 7, 9]#, 50, 40, 30, 10, 20, 42, 43, 44, 60, 65, 66, 57, 56, 58, 64]
    n = length(c)

    for i in 0:n-1
        t = newt(c)
        for j in i:n+i
            delete!(t, c[mod(j, n)+1])
            @test isbst(t)
        end
    end

    return nothing
end

function newt(c)
    t = BST{Int64, Int64}()

    for i in c
        put!(t, i, 2i)
    end

    return t
end

function test_bst_maximum()
    n = 10^3
    c = rand((1:n), n)
    t = BST{Int64, Int64}()
    @test isbst(t)

    for i in c
        put!(t, i, 2i)
        @test isbst(t)
    end

    @test (maxx(t).key, maxx(t).value) == (maximum(c), 2maximum(c))

    return nothing
end

function test_bst_minimum()
    n = 10^3
    c = rand((1:n), n)
    t = BST{Int64, Int64}()
    @test isbst(t)

    for i in c
        put!(t, i, 2i)
        @test isbst(t)
    end

    @test (minx(t).key, minx(t).value) == (minimum(c), 2minimum(c))

    return nothing
end

function test_bst_maximum_node()
    n = 10^3
    c = rand((1:n), n)
    t = BST{Int64, Int64}()
    @test isbst(t)

    for i in c
        put!(t, i, 2i)
        @test isbst(t)
    end

    @test maximum_node(t.root, t.root)[1].key == maximum(c)

    return nothing
end

function test_bst_maximum_collect()
    n = 10^3
    c = shuffle(1:n)
    t = BST{Int64, Int64}()
    @test isbst(t)

    for i in c
        put!(t, i, 2i)
        @test isbst(t)
    end

    @test collect(t) == sort(c)

    return nothing
end

function test_bst_size()
    n = 6
    c = [5, 3, 4, 8, 7, 9]

    for i in 1:n
        t = newt(c)
        cn = setdiff(c, c[i])
        @test size(t) == n

        delete!(t, c[i])
        @test size(t) == n - 1
        @test isbst(t)
    end

    t = newt(c)
    delete!(t, 5)
    @test size(t.root.left) == 1
    @test size(t.root.right) == 3
    @test size(t.root.right.left) == 1
    @test size(t.root.right.right) == 1

    return nothing
end

# Run the unit tests
@testset "Binary search tree" begin
    test_bst_empty()
    test_bst_put()
    test_bst_get()
    test_bst_putget()
    test_bst_delete()
    test_bst_maximum()
    test_bst_minimum()
    test_bst_maximum_node()
    test_bst_maximum_collect()
    test_bst_size()
end