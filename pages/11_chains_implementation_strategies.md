# Chains: Impelementation Strategies

## Centralized Control

In the context of a linked-list, this means that the control is centralized in the list implementation, not in the nodes.

```c++
class SLL {
    struct Node{...}
    Node *head
    public:
        size_t length();
};

size_t SLL::length() {
    size_t length = 0;
    Node *curr = head;
    while(curr) {
        ++len;
        curr = curr->next;
    }
    return len;
}
```

## Decentralized Control

In the context of a linked-list, this means that the control is decentralized (distributed) across the nodes in the list

```c++
    struct Node {
        size_t length();
    }
    size_t SLL::length() {
        return (head ? head->length() : 0);
    }
    size_t SLL::Node::length() {
        return (next ? next->length() + 1 : 1);
    }
```

## "Dummy Nodes"

![](../images/node_interface.svg)

Some people will write chains using two subtypes of Node

*   (regular, data and link containing) Node
*   DummyNode (no data)

Both support the same set of ops; the difference is in how they get implemented

![](../images/singly_linked_chain_dummy_node.svg)

```c++
    size_t SLL::Node::length() {
        return next->length();
    }
    size_t SLL::DummyNode::length() {
        return 0;
    }
```

The reason they do this is to be consistent with a principle of OO Programming that an object shouldn't need to check its state to determine what to do.

Overkill in this scenario. With a centralized solution, the DummyNode doesn't even need to implement an operation except is_dummy()

`while(curr != is_dummy())`