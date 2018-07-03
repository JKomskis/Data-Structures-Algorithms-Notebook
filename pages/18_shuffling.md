# Shuffling

Goal: given a set of values, mix them up, so that the ordering is randomized. Think about a deck of cards

## Fisher-Yates Shuffle

A.K.A. Knuth Shuffle

Is pseudocode for shuffling contents of an array

```c++
i <- (n-1) to 1 by 1
    r = random number [0,i]
    Swap a[r] and a[i]
```

Careful: it's easily implemented incorrectly

```c++
Size := array's size
T := array's element type
for(int i = 0; i < size; ++i)
    int r = nrandn(size); //returns [0, size-1]
    T temp = array[i];
    array[i] = array[r];
    array[r] = temp;
}
```

When executed, this code will:
* Loop through each "card" in the "deck"
* Swaps the current "card" with one chosen at random

The output is biased, Proof:

Let the deck contain 3 cards. Therefore, there are 3! = 6 combinations. The flawed implementation loop 3 times, and can pick any of the three cards to swap with the current card; hence it has 33 = 27 possible outcomes, most of which are duplicates. Since 27/6 has a remainder, some of the outcomes are more likely than others (by pigeon hole principle)

| Flawed implementation | Correct Implementation                           |
| --------------------- | ------------------------------------------------ |
| Rand(3)               | Rand(3) <= pick one of the three remaining cards |
| Rand(3)               | Rand(2) <=pick one of the two remaining cards    |
| Rand(3)               | Rand(1) <= swap last card with itself            |
