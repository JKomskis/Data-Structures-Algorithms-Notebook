# Sorting

## Terms

* Internal - data are all memory resident
* External - data are not all memory resident (e.g. stored in files)
* Stable - when items can have duplicate keys, a stable sort maintains the same relative order after the items are sorted
  * <Smith, John>, <Smith, Jane>, <Booboo, Honey>
  * -> <Booboo, Honey>, <Smith, John>, <Smith, Jane>
* Unstable - there is not guarantee that items having duplicate keys maintain the same relative order after the items are sorted
* Indirect sort - move indices/pointers to items being sorted instead of the actual items (useful when moving indices/pointers is cheaper than moving the actual items)

## Some common O(n2) algorithms

### Bubble Sort

```c++
From left->right
Compare the current element with the next element
Iff the next comes before curr, swap them
```

![](../images/bubble_sort.svg)

### Selection Sort

```c++
From left->right
Find the "smallest" element in the unsorted part [right side]
If smaller than the left-most item in the unsorted part, swap them
Advance marker indicating where the unsorted part begins
```

![](../images/selection_sort.svg)

### Insertion Sort

```c++
From left->right
Insert the left most item in the unsorted part in the correct sorted position in the sorted part
```

![](../images/insertion_sort.svg)

### Quick Sort

On average, it has good runtime complexity O(nlogn), but its worst case performance is O(n<sup>2</sup>)

Simple recursive version

```c++
quick(array, left, right)
if right >= left //by definition, (sub)arrays of size 1 or less are already sorted)
    mid = partition(array, left, right)
    quick(array, left, mid-1)
    quick(array, mid+1, right)
```

#### Partitioning

Idea: choose a pivot (item) and partition the array into 2 parts

* Items <= pivot
* Items >= pivot

##### Choosing a pivot: take 1 - deterministic

Choose the rightmost item in the (sub)array

* Best case: the array gets partitioned into two equal sized parts
* Worst case: the array gets partitioned into (|array-1|) and (1) sized parts

![](../images/quick_sort.svg)

##### Choosing a pivot: take 2 - median

Choose the median of the right-most, middle, and left-most item in the (sub)array

Worst case still possible, but far less likely

##### Choosing a pivot: take 3 - random

Choose an item at random from the (sub)array

Worst-case is still possible, but far far less likely

##### Choosing a pivot: take 4 - random median

Choose three items at random from the (sub)array and take the median

Worst-case is still possible, but far far far less likely, but it's not really that much better than take 3 to make it worth doing

#### Three-way partitioning, recursive version

![](../images/three_way_partitioning.svg)

Idea: in the case where duplicate keys are allowed, the pivot item may be replicated

```c++
quick(array, left, right){
    if(right > left)
        mid1, mid2 = partition(array, left, right)
    quick(array, left, mid1)
    quick(array, mid2, right)
}
```

### Radix sorting

Idea: steal an idea from the physical world - sorting data on cards. Imagine a stack of cards with holes along the top. One can pull out cards by running a wire through the hole and pulling out the cards. A card can be excluded by punching out the area between the hole and the top of the card.

Our discussion will assume radix is 2 (base 2), thus the way the holes are punched can be interpreted as a binary number

Radix sorting is a weird beastie because it doesn’t compare values to each other. Instead, it filters by bit position bit values

![](../images/radix_sort.svg)

### Merge Sort

![](../images/merge_sort.svg)

* O(nlgn) always
* Extra array O(2n)
* Inplace: O(n)
