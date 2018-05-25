# ADT: Stack
A stack is a container whose elements are accessed in LIFO order (Last-In, First-Out).

*   The top of the stack has the property that it is the most recently added item in the stack
*   The canonical stack can remove only the top-most element

A a minimum, it must support:

*   void push(E element) - adds the element to the top of the stack
*   E pop() - removes and returns the top-most stack element

Common extra operations:

*   bool is_empty() - returns true iff the stack contains no elements
*   void clear() - removes and discards all elements
*   E peek() - returns, but does not remove, the value of the top-most element
