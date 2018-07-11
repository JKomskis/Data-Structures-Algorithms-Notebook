# The Knapsack Problem Family

The general idea, you are a thief, you have a knapsack with a limited capacity (weight or volume or both). Your goal on leaving the scene of a crime is to maximize the value of your knapsack's contents

The items available to steal are characterized by

* A constraint (e.g. weight, volume, etc.)
* A value

Some common variations

## Fractional knapsack

Each item is infinitely divisible; you may take all, some, or none of a particular item

* Unbounded: for each item type there is an infinite amount available
* Bounded: for each item type there is a finite amount available

## Discrete knapsack

Each item is a discrete unit, you may take the whole thing or leave it behind

* Unbounded: for each item type there is an infinite amount available
* Bounded: for each item type there is a finite amount available
* 0-1: for each item type, there is exactly 1 available

## Fractional Knapsack Problem Example

Sack capacity = 5lbs

| Coffee type | Quantity available | Value of that quantity | Density |
| ----------- | ------------------ | ---------------------- | ------- |
| Colombia    | 3 lbs              | $15                    | $5      |
| Celebes     | 2 lbs              | $22                    | $11     |
| Harrar      | 3 lbs              | $36                    | $12     |
| Yemen Mocha | 1 lb               | $15                    | $15     |

How to fill your bag to get the most valuable 5 lbs of coffee?

```c++
First, compute the density (value per unit)
Next: sort the densities by decreasing value
    While(sack not full)
        Take as much of the most valuable coffee as will fit in our bag
```

| Coffee type | Quantity available | Amount taken | $/lb | Value taken |
| ----------- | ------------------ | ------------ | ---- | ----------- |
| Colombia    | 3 lbs              | 0            | $5   | 0           |
| Celebes     | 2 lbs              | 1            | $11  | $11         |
| Harrar      | 3 lbs              | 3            | $12  | $36         |
| Yemen Mocha | 1 lb               | 1            | $15  | $15         |

Sack's total value: $62

This is an example of a greedy algorithm

Observation in regards to the knapsack problem family:

They are examples of a class of problem known as optimization problems. We are trying to find a best solution (there may be more than 1)

While a greedy algorithm works just fine for solving the fractional knapsack problem, consider…

| Item | Weight | Value of the item | Density |
| ---- | ------ | ----------------- | ------- |
| A    | 3      | 17                | 5.666   |
| B    | 6      | 35                | 5.833   |
| C    | 8      | 48                | 6       |
| D    | 10     | 50                | 5       |
| E    | 2      | 3                 | 1.5     |

Fill our sack (it has a capacity of 10)

Greedy: choose item(s) with the greatest value

* D=50

Greedy: choose the item(s) with the greatest density

* C & E => 51

Optimal Solution:

* A & B => 52 <-a greedy approach is not optimal for this version of the knapsack problem

## Discrete, unbounded substructure

Solution structure

It turns out this problem's solution has optimal substructures - that is, an overall optimal solution can be found from the optimal solution of the subproblems

Assume there are n items, each with a weight and value

Then the value of a knapsack with a capacity of size can be found by selecting one of (n+1) options

Let's assume there are three item types, each with weights equal to their value (1, 2, and 3)

For a knapsack of size 4:

```c++
Sack(4) = max[ sack(3)
                Sack(4-1=3)+1 <= the most valuable size 3 sack + I take item 1
                Sack(4-2=2)+2 <= the most valuable size 2 sack + I take item 2
                Sack(4-3=1)+3] <= the most valuable size 1 stack + I take item 3
```

Which expands to

```c++
Sack(3) = max[ sack(2)
                Sack(3-1=2)+1
                Sack(3-2=1)+2
                Sack(3-3=0)+3]

Sack(4-1=3)+1 same as Sack(3)

Sack(4-2=2)+2 = max[ sack(1)
                    Sack(2-1=1)+1
                    Sack(2-2=0)+2]

Sack(4-3=1)+3 = max[ sack(0)
                    Sack(1-1=0)+1]
```

Which expands even further! We get a huge call tree and the same darn problem keeps getting solved over and over

We've already shown the problem meets all the requirements for a DP solution. The next step is to define…

Recursive Solution

```c++
Sack(size) = [ 0, size == 0
            [ max [ sack(size-1)
            [       sack(size-w1) + v1
            [       sack(size-w2) + v2
            [       …
            [       sack(size-wn) + vn
            [     ], otherwise
```

Example

Sack capacity: 14

| Item | Type   | Weight | Value |
| ---- | ------ | ------ | ----- |
| 1    | Apple  | 3      | 2     |
| 2    | Banana | 5      | 3     |
| 3    | Cherry | 7      | 5     |

| Size: | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12  | 13  | 14  |
| ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Take: |     |     |     | A   |     | B   | A   | C   |     | A   | A*  |     | A   | A   | C   |
| Val:  | 0   | 0   | 0   | 2   | 2   | 3   | 4   | 5   | 5   | 6   | 7   | 7   | 8   | 9   | 10  |

*we could have chosen to take cherries with a sack of size 10 instead of another apple

```c++
Sack(8-3=5) => 3 + (apple value = 2) = 5
Sack(8-5=3) => 2 + (banana value = 3) = 5
Sack(8-7=1) => 0 + (cherry value = 5) = 5
Sack(8-1=7) => 5 --------------------------->5

Sack(9-3=6) => 4 + (apple value = 2) = 6
Sack(9-5=4) => 2 + (banana value = 3) = 5
Sack(9-7=2) => 0 + (cherry value = 5) = 5
Sack(9-1=8) => 5 --------------------------->5

Sack(10-3=7) => 5 + (apple value = 2) = 7
Sack(10-5=5) => 3 + (banana value = 3) = 6
Sack(10-7=3) => 2 + (cherry value = 5) = 7
Sack(10-1=9) => 6 --------------------------->6

Sack(11-3=8) => 5 + (apple value = 2) = 7
Sack(11-5=6) => 4 + (banana value = 3) = 7
Sack(11-7=4) => 2 + (cherry value = 5) = 7
Sack(11-1=10) => 7 --------------------------->7

Sack(12-3=9) => 6 + (apple value = 2) = 8
Sack(12-5=7) => 5 + (banana value = 3) = 8
Sack(12-7=5) => 3 + (cherry value = 5) = 8
Sack(12-1=11) => 7 --------------------------->7

Sack(13-3=10) => 7 + (apple value = 2) = 9
Sack(13-5=8) => 5 + (banana value = 3) = 8
Sack(13-7=6) => 4 + (cherry value = 5) = 9
Sack(13-1=12) => 8 --------------------------->8

Sack(14-3=11) => 7 + (apple value = 2) = 9
Sack(14-5=9) => 6 + (banana value = 3) = 9
Sack(14-7=7) => 5 + (cherry value = 5) = 10
Sack(14-1=13) => 9 --------------------------->9
```

The take array is only needed if we need to determine what to put in the sack to optimize its value

Starting with the maximum sized sack, work backwards

Pseudocode for the DP solution

```c++
for each sack size from 1 to capacity
    max = sack_val[size-1]
    for each item type I
        x = item_value[i] + sack_value[size - item_weight[i]]
        if(x > max)
            max = x
            take[size] = 1
```

Knapsack 0-1

Multiple unique items - i.e. one instance of each item

Recursive Solution

```c++
Size(item, size) = [ 0, size == 0
                   [ 0, item == 0
                   [ max [ sack(item-1, size)
                   [       sack(item-1, size-w1) + v1
                   [       sack(item-1, size-w2) + v2
                   [       …
                   [       sack(item-1, size-wn) + vn
                   [     ], otherwise
```

Example

Sack capacity = 10

| Item | Type   | Value | Weight |
| ---- | ------ | ----- | ------ |
| 1    | Apple  | 3     | 14     |
| 2    | Banana | 6     | 30     |
| 3    | Cherry | 4     | 17     |
| 4    | Durian | 2     | 9      |

| Size: | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
| ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| λ:    | 0   | 0   | 0   | 0   | 0   | 0   | 0   | 0   | 0   | 0   | 0   |
| A:    | 0   | 0   | 0   | 14  | 14  | 14  | 14  | 14  | 14  | 14  | 14  |
| B:    | 0   | 0   | 0   | 14  | 14  | 14  | 30  | 30  | 30  | 44  | 44  |
| C:    | 0   | 0   | 0   | 14  | 17  | 17  | 30  | 31  | 31  | 44  | 47  |
| D:    | 0   | 0   | 9   | 14  | 17  | 23  | 30  | 31  | 39  | 44  | 47  |

The value of the max size when we can choose between all the items is in the lower-righthand corner

To determine an optimal set of contents, we start in the lower-righthand corner

An optimal solution to this problem is to take the durian and 
the cherry

Note: this uses a 2D array. Do we need a 2D array if we don't need to know which items are in an optimal set? Exercise for the motivated student

Something to think about

What if there were a finite quantity of each item type - e.g.
* 3 kittens
* 2 puppies
* 1 hamster

This isn't an unbounded knapsack problem, nor is it a 0-1 knapsack problem. What is it?

It's a bounded knapsack problem

How could we efficiently implement a sol.? Can't use the unbounded technique (it won't work)

Most resources say, "just convert a bounded KP to a 0-1 KP" and solve using the 0-1 technique

* Kitten1
* Kitten2
* Kitten3
* Puppy1
* Puppy2
* Hamster1

Con: it increases the size of the problem space => can make the problem intractable (to compute)

Idea: modify the 0-1 technique to handle a finite number of instances for each item
