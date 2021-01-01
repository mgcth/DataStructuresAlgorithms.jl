# Data structures and algorithms - DAT038

Implementation of some data structures and algorithms from the Chalmers course DAT038 in Julia as en exercise and for fun. Implemented from instructions and invariants mostly and not pseudocode. Therefore, code might not be the most efficient, general or clean. Not all algorithms are present. Some interfaces are implemented for some data structures.

Work ongoing, currently at heaps which are not fully working. Red-black and AVL trees and graphs (BFS, DFS, UCS, A*) left.

## Implemented data structures and algorithms and time complexities
*Search:*
* Linear search O(n)
* Binary search O(logn)

*Sort:*
* Selection sort O(n^2)
* Insertion sort O(n^2), best case O(n)
* Merge sort O(nlogn)
* Quicksort O(nlogn), worst case O(n^2)

*List:*
* Singly linked list
* Doubly linked list

*Tree:*
* Binary search tree
* Red-black tree (missing)
* AVL tree (missing)

*Heap:*
* Binary heap
* Randomised meldable heap

*Hash: (work in progress)*
* Separate chaining - based on dynamic array
* Separate chaining - based on doubly linked list
* Open addressing

*Graph:*
* Depth-first search (DFS) (missing)
* Breadth-first search (BFS) (missing)
* Uniform cost search (UCS) (missing)
* Astar (A*) (missing)

*Other:*
* Dynamic array, push and pop amortised O(1)
* Stack - based on dynamic arrays
* Queue - based on doubly linked list