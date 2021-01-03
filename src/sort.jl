const INSERTION_VALUE = 60

"""
    selectionsort!(a)

A selection sort algorithm. Time complexity O(n^2).
"""
function selectionsort!(a::AbstractVector{T}) where T <: Number
    for i in 1:length(a)
        min = a[i]
        k = i
        for j in i+1:length(a)
            if a[j] < min
                min = a[j]
                k = j
            end
        end
        swap!(a, i, k)
    end

    return a
end

"""
    insertionsort!(a, lo = 2, hi = length(a))

Insertion sort with linear search. Time complexity O(n^2), best case O(n).
Fast for small arrays.
"""
function insertionsort!(a::AbstractVector{T}, lo::Int = 2, hi::Int = length(a)) where T
    i = lo
    while i <= hi
        j = i
        while j > lo - 1 && a[j - 1] > a[j]
            swap!(a, j, j - 1)
            j -= 1
        end
        i += 1
    end

    return a
end

"""
    mergesort(a)
    
Mergesort algorithm with insertion sort at lowest level. Time complexity O(n log n).
"""
function mergesort(a::AbstractVector{T}) where T
    return mergesort(a, 1, length(a))
end

"""
    mergesort(a, lo, hi)

Recursive mergesort function. Something should be done about all the allocations.
"""
function mergesort(a::AbstractVector{T}, lo::Int, hi::Int) where T
    if hi - lo <= INSERTION_VALUE
        return insertionsort!(a, lo + 1, hi)[lo:hi]
    else
        mid = lo + (hi - lo) ÷ 2
        a1 = mergesort(a, lo, mid)
        a2 = mergesort(a, mid + 1, hi)

        a_ = Array{T}(undef, length(a1) + length(a2))
        merge!(a_, a1, a2)
        return a_
    end
end

"""
    merge(a1, a2)

Merge two arrays.
"""
function merge!(a::AbstractVector{T}, a1::AbstractVector{T}, a2::AbstractVector{T}) where T
    i = 1; j = 1; k = 1
    while j <= length(a1) && k <= length(a2)
        if a1[j] < a2[k]
            a[i] = a1[j]
            j += 1
        else
            a[i] = a2[k]
            k += 1
        end

        i += 1
    end
    a[i:end] = [a1[j:end]; a2[k:end]]
    
    return nothing
end

"""
    swap(a, i, j)

Swap to element i and j in array a.
"""
function swap!(a::AbstractVector, i::Int, j::Int)
    tmp = a[j]
    a[j] = a[i]
    a[i] = tmp
    return nothing
end

"""
    quicksort!()

Basic quicksort algorithm. Time complexity O(nlogn), worst case with bad pivor O(n^2).
"""
quicksort!(a::AbstractVector) = quicksort!(a, 1, length(a))

function quicksort!(a::AbstractVector, lo::Int, hi::Int)
    if lo >= hi return a end

    if hi - lo <= INSERTION_VALUE
        return insertionsort!(a, lo + 1, hi)
    else
        pivot = partition(a, lo, hi)
        quicksort!(a, lo, pivot - 1)
        quicksort!(a, pivot + 1, hi)
    end
end

function partition(a, lo, hi)
    pivot = pivot_mo3(a, lo, hi) # median of three
    swap!(a, lo, hi)
    lo0 = lo
    lo += 1

    while true
        while lo <= hi && a[lo] < pivot
            lo += 1
        end
        while hi >= lo && a[hi] > pivot
            hi -= 1
        end
        if lo > hi
            break
        end

        swap!(a, lo, hi)
        lo += 1
        hi -= 1
    end
    swap!(a, lo0, hi)

    return hi
end

"""
    pivot_mo3(a, lo, hi)

Use median of three elements as pivot element, i.e. middle element of three.
"""
function pivot_mo3(a, lo, hi)
    mid = lo + (hi - lo) ÷ 2
    if a[mid] < a[lo]
        swap!(a, lo, mid)
    end
    if a[hi] < a[lo]
        swap!(a, lo, hi)
    end
    if a[mid] < a[hi]
        swap!(a, mid, hi)
    end
    pivot = a[hi]
end