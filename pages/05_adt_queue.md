# ADT: Queue

A queue is a container whose elements are accessed in FIFO (First_in, First-Out) order

*   The head of the queue has the property that it is the least recently added item in the queue
*   The tail of the queue has the property that it is the most recently added item in the queue
*   The canonical queue can only remove at the head

At a minimum, it must support:

*   void enqueue(E element) - add element to the tail of the queue
*   E dequeue() removes and returns the front-most queue element

Common extra operations:

*   bool is_empty() returns true iff the queue contains no elements
*   void clear() removes and discards all elements

Note: while the idea of length is not part of the core abstraction, there are many contexts - e.g. queuing simulations, where length is important

## Implementing

### Array-based

#### Linear

![](..\images\linear_queue.svg)

#### Ring

![](..\images\ring_queue.svg)

*   Queue == empty when head == tail
*   Therefore, when head != tail, head indexes a valid item, the frontmost item
*   Max |Queue| == |array| - 1, one element is kept vacant so the head and tail don't overlp when full

### Type Hierarchy

Allows us to program to an interface, not an implementation

![](..\images\queue_interface.svg)