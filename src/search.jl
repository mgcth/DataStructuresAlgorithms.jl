"""
    linearsearch(a, item)

Linear search in array, find first occurance. Time complexity O(n).
"""
function linearsearch(a::Union{AbstractVector{T}, T}, item::T)::Int where T
    if length(a) == 0 return 0 end

    for i in 1:length(a)
        if a[i] == first(item)
            return i
        end
    end

    return 0
end

"""
    binarysearch(a, item)

Binary search in array, find any occurance. Time complexity O(logn).
"""
function binarysearch(a::Union{AbstractVector{T}, T}, item::T)::Int where T
    lo::Int = 1
    hi::Int = length(a)
    if hi == 0 return 0 end

    mid::Int = 0
    item = first(item)
    while lo <= hi
        mid = lo + (hi - lo) ÷ 2

        if item < a[mid]
            hi = mid - 1
        elseif item > a[mid]
            lo = mid + 1
        else
            break
        end
    end

    return item == a[mid] ? mid : zero(typeof(item))
end