# Maps

Map - "a function that maps a value from a domain to a value in the codomain"

Dictionary - a collection of terms and their associated definitions

Symbolic Tables - this term is most frequently used in the context of compilers/interpreters/assemblers. Used to map identifiers to values, function definitions, addresses, etc.

For our purposes, we'll assume these terms are synonymous

We'll be talking about key-value pairs

* Key - term
* Value - definition

## ADT Map

The Map abstract data type's core operations include:

* Search(key) => value
* Insert(key, value) <- adds a key-value pair to the map
* Remove(key)

Additional operations that are commonly supported by Map include:

* Size() => unsigned int <- number of key-value pairs in the map
* Select(int i) => returns: value, key value pair <- requires that there be an ordering of the elements in the map

## Simple, List-based implementation strategies

### Unordered list

#### Chain

* Search: start at the beginning and traverse the list until
  * We find a match for key => return corresponding value, or
  * Run out of items => signal that the search failed
* Insert: append the [k-v]
* Select: sort and then traverse the sorted collection until reach the i-th item and return it

#### Array

* Search: start at the beginning and traverse the list until
  * We find a match for key => return corresponding value, or
  * Run out of items => signal that the search failed
* Insert: append the [k-v]
* Select: sort and then traverse the sorted collection until reach the i-th item and return it

### Ordered list

Note: an ordered list implementation is a kind of priority queue - where priority is determined by the ordering technique

#### Chain

* Search: start at the beginning and traverse the list until
  * We find a match for key => return corresponding value, or
  * We encounter a key larger than the one we're looking for => signal search failed
  * Run out of items => signal that the search failed
* Insert: start at beginning, traverse to correct position, and insert the [k-v]
* Select: traverse the sorted collection until reach the i-th item and return it

#### Array

* Search: implemented as a linear search [same as with chain] O(n)
* Search: implemented as a binary search O(lgn)

```c++
Start at the middle
Find matching key => return value, or
If key is "less than" value at current point in the search, search right half
If "greater than", search left half
(the half is empty) run out of items => signal search failed
```

* Insert: start at rear, shifting items one position right until we’ve moved the item in the position where this one is supposed to go and insert the [k-v] in that freed up slot
* Select: return item in slot I

### Key-indexed array

Requires that there be:

* A method to translate keys to numbers (which are used as indices)
* Each key translates to a unique number
* That the number of slots in the array is tractable

Aside: Consider the problem of determining how many times each character of the alphabetic characters (['a' - 'z'] and ['A' - 'Z']) appears in a string (or file, etc.)

Assuming we are given a C-style string s…

```c++
char *s;
int letter[26]; //holds count of each letter seen in the string
for( int i = 0; i != 26; ++i)
    letter[i] = 0; //count = 0
while (*s){
    if( (*s - 'a') >= 0 && (*s - 'a') <= 25 ) //lowercase letter
        ++letter[*s - 'a'];
    else if( (*s  - 'A') >= 0 && (*s - 'A') <= 25 ) //uppercase letter
        ++letter[*s-'A'];
    ++s;
}
```

Observation: The array letter is being used as a key-indexed array-based map! Unlike many maps, whose values are relatively static, this one is constantly changing as we traverse the input

* Search:
  * Convert key to index
  * If slot contains a value, return it
  * Else signal search failure
* Insert:
  * Convert key to an index
  * Store value at indexed slot in the array
* Select:
  * Starting at the beginning, traverse the array
  * On encountering the i-th occupied slot, return its value

Other common implementation strategies

* Search trees
* Hash-maps (a specialized form of key-indexed array)
