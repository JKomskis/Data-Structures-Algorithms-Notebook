# Premature Optimization and Memory Allocation Strategies

> "Premature optimization is the root of all evil."
> 
> -Donald Knuth?

Allocating memory - i.e. asking the OS for memory so that the program can use it - is a relatively expensive operation. One solution, when you know you will be allocating lots of little blocks of memory, is to pre-allocate a block of memory, and let you program worry about divvying it up.

For example, allocating a block of memory large enough to hold 100 nodes, we'll maintain a collection of unused/recyclable nodes in a pool

```c++
make_new_node() {
    if a free node exists in the pool
        remove from pool and initialize it and return it
    otherwise
        allocate a new node
}

destroy_node() {
    de-initialize if necessary
    add to pool
    //optional
    //if pool is "too big"
    //de-allocate some of the contents
}
```

Every modern C++ compiler is going to use a fairly sophisticated memory allocator (and may actually give you several to choose from) - or let you write your own; but there are times where pre-allocating a block of memory will make a lot of sense