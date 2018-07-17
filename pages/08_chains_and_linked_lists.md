# Chains and Linked-Lists

## Chains

Chains of Nodes (singly-linked)

![](../images/singly_linked_chain.svg)

Chains are data structures

*   They have no behaviors or operations associated with them
*   A node contains a piece of data and a pointer to the next node

```c++
struct Node {
    int data;
    Node *next;
}
```

Chains of Nodes (doubly-linked)

![](../images/doubly_linked_chain.svg)

Chains can be arranged in a

*   linear structure
*   circular structure (dotted lines)

## Linked Lists

Linked-lists live on the boundary of being an ADT and a data structure. There is no standard set of operations, but they frequently support operations similar in intent, if not in name to:

*   Insertion
    *   push_front(item)
    *   push_back(item)
    *   insert_at(item, position)
*   Removal
    *   pop_front()
    *   pop_back()
    *   remove_at(position)
*   Inspection
    *   peek_front()
    *   peek_Back()
    *   peek_at(position)
*   Misc others
    *   length()
    *   clear()
    *   is_empty()

There are commonly many other operations that are part of a List ADT

A linked list is an object which implements the ADT List using a chain.

| Type                         | push_head     | push_tail     | insert_at |
| ---------------------------- | ------------- | ------------- | --------- |
| SLL, head, linear            | O(1)          | O(n)          | O(n)      |
| SLL, head and tail, linear   | O(1)          | O(1)          | O(n)      |
| SLL, head, circular          | O(1) w/ trick | O(1) w/ trick | O(n)      |
| SLL, tail, circular          | O(1) w/ trick | O(1) w/ trick | O(n)      |
| SLL, head and tail, circular | O(1)          | O(1)          | O(n)      |
| DLL, head, linear            | O(1)          | O(n)          | O(n)      |
| DLL, tail, linear            | O(n)          | O(1)          | O(n)      |
| DLL, head and tail, linear   | O(1)          | O(1)          | O(n)      |
| DLL, head or tail, circular  | O(1)          | O(1)          | O(n)      |
| DLL, head and tail, circular | O(1)          | O(1)          | O(n)      |

In general, don't use a DLL unless you really need the bidirectional traversal it affords, because the cost of an extra pointer and added complexity of linking and unlinking nodes.

The disadvantage of having both a head and a tail is that you have to ensure that both are always pointing at the correct thing (extra program complexity)