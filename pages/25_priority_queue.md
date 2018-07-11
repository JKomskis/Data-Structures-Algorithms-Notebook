# Priority Queue

An ADT in which the thing with the highest priority* is the first removed; should there be 2 or more things with the same highest priority, then the one in the queue the longest comes out first.

*for a min PQ (minimum priority queue) the thing with the smallest priority has the highest priority. For a max PQ (maximum priority queue) the thing with the highest priority has the highest priority

At a minimum, the ADT must support the operations

* Enqueue(item, priority) <= see note
* Item dequeue()
* Bool is_empty()

Note: in many applications, the priority can be derived from (or is embedded in) the item itself; in those cases it is not necessary to pass an explicit priority

Some additional common operations:

* Construct a PQ from a set of n items
* Merge PQs
* Change the priority of a specified item
* Remove a specified item

## Implementation

### Simple implementation #1

We'll see more efficient ways later

Idea, use a list (array-backed, or linked-list) to hold the PQs data

```c++
enQ(item){list.push_back(item);}
deQ {
    #1 traverse entire list to determine which has > priority
    #2 return this.remove(position of > priority item);
}
```

Analysis:

* enQ is Θ(1)
* deQ is O(n+n) => O(n)
