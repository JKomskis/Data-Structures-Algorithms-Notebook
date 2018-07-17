# Chains and Linked Lists (Cont.)

How to represent a List?

List:
*   Cat
*   Rat
*   Bat

## As an array

If we have an upper bound on the |List|, we can allocate memory up-front. Otherwise, when we run out of space, we must allocate a new, larger array, copy the elements over, and delete the original array.

![](../images/array_based_list.svg)

## Using a chain (singly- or doubly- linked, linear or circular)

Every time we insert a new element, allocate a new Node and link it in

*   More efficient at inserting
*   Grow and shrink as needed

![](../images/chain_based_list.svg)

Usw.
| Technique             | Insert (randon)                      | Remove(random)                         | Random Access        |
| --------------------- | ------------------------------------ | -------------------------------------- | -------------------- |
| Array-based List      | O(n)                                 | O(n)                                   | O(1)                 |
|                       | Move elements to free up a slot O(n) | Move elements to occupy free slot O(n) | Direct Indexing O(1) |
| How is position found | Direct Indexing O(1)                 | Direct Indexing O(1)                   | Direct Indexing O(1) |
|                       |                                      |                                        |                      |
| Chain-based List      | O(n)                                 | O(n)                                   | O(n)                 |
|                       | Linking in new node O(1)             | Unlinking node O(1)                    | Traverse chain O(n)  |
| How is position found | Traverse chain O(n)                  | Traverse chain O(n)                    | Traverse chain O(n)  |

## What if we used an array of nodes?

![](../images/array_of_nodes_list.svg)

We can:

*   maintain the active list of data
*   maintain the free ist (Nodes that aren't being used)

Depending on the platform, a pointer may require far more memory than our application needs; in that case, rather than the next field being a pointer, we can make it an appropriately-sized integer type.

![](../images/array_of_nodes_list_indices.svg)

Notice that this style of chain preallocates the nodes it needs (and from the perspective of the memory management, it'll be more efficient that allocating/deallocating individual nodes). From a spatial perspective, it may waste a lot of memory (more nodes allocated than will ever be used, or the percentage of the time that a node is used is "low").

Parallel arrays:

![](../images/array_of_nodes_list_indices_parallel_arrays.svg)

If more nodes are needed, then allocate a new array, copy data over, make everything else part of the free list. Put the data at the front of the new array.

One potential disadvantage the array-based chain has is the requirement that you can allocate enough contiguous memory to hold the array. When parallel arrays used, we would need smaller contiguous chunks of memory.

Tail Pointer/Index

*   Active List:
    *   Yes: when append will be a common operation
    *   No: when append is rare
    *   Tail pointer beneficial when we do a lot of appending
*   Free List:
    *   Yes: never - can insert a newly freed Node at the head O(1)
    *   No: always
    *   Not needed for free list because we can just operate on the head

Expectation

*   You can draw labeled box-and-pointer diagrams, showing each step of
    *   Traversal
    *   Insertion (at arbitrary point, head, tail)
    *   Deletion (at arbitrary point, head, tail)
*   and implement based on them
