# Iterators

## Sequentially Accessing List elements

![](../images/iterator.svg)

Each item: O(n)

Therefore, to access everything sequentially is O(N^2)

```c++
for(int i = 0; i != list.size(); ++i)
  std::cout << list.item_at(i);
```

Goal: Abstract the mechanics of iteration => iterators

There are many conventions used for implementing iterators

* GoF Style - as described in "Design Patterns: Elements of Reusable Software"
  * Java uses a modified form of this
* C++ uses a convention based on pointer traversal of arrays

```c++
int a[] = {1, 2, 3, 4, 5}
int const * curr = a;
int const * const end = a+5;
```

![](../images/cpp_iterator.svg)

```c++
while(curr != end)
  std::cout << *curr++;
operator++(){
  here = here->next;
}
```

Done iterating when curr points to the same place as end. Iterators will be a nested class of their corresponding class. Both iterators and const iterators are needed.

Note, the const aren't required, but stylistically are good

* Left const used if not modifying - because we don't want to accidently modify the array's contents
* Right const used because we should never change what the end pointer points to

Factories - methods that make things, let us keep constructors private

* Static - belonging to the class as a whole
* Explicit (vs implicit)

## Sequentially Accessing List elements with iterators*

*assumes they are intelligently written

Each item: O(1)

Therefore, to access everything is O(n)

```c++ 
for(int I : list)
  std::cout << I;
```

Q: If the target of an iterator has been mutated since the iterator was created, what is the policy?

A: The iterators are considered invalid and it would be an error to use them
