# Hash Table

Based off of key-indexed array

Very fast insert and search

Potentially may waste a lot of space

Goal: get most of the performance of a key-indexed array, without have to maintain a slot for each possible key

## Hashing

Hashing function - generates a hash (index in context of key-indexed array) from a key

* Domain: set of all possible keys
* Codomain: hashes

Different keys may have the same hash, uniqueness not guaranteed

One (not so good) simple example:

`Hash(x) = x % array size`

Keys: 57, 229, 462, 941, 8, 421

| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | 941 | 462 |     |     |     |     | 57  |     | 229 |

hash(421) = 421 % 10 = 1

A collision occurs when 2 or more keys produce the same hash

Conclusion: good hashing requires

* A good hash function to uniformly distribute items in the array
* A way to handle collisions

### Hashing with buckets

One way to handle collisions

Store a linked list in each entry of the hash table

* Insert: O(1)
* Search O(1+bucket size)
* Remove O(1+bucket size)

### Open Addressing

Backing array stores actual items

`h(k,i) = ( f(k) + p(i) ) % M`

* k - key
* i - probe attempt number (starting at 0)
* f(k) - hashing function
* p(i) - probe function
* m - size of backing array

#### Open addressing with linear probing

| 0   | 1   | 2   | 3   | 4   | 5   |
| --- | --- | --- | --- | --- | --- |
|     | 941 | 462 |     |     |     |

inserting 411:

| 0   | 1   | 2   | 3   | 4   | 5   |
| --- | --- | --- | --- | --- | --- |
|     | 941 | 462 | 411 |     |     |

411 tries to insert at 1, then 2, then get inserted at 3

Cons of linear probing

Con: what happens when an entry is removed? Need to remove and reinsert all elements after the removed element

| 0   | 1   | 2           | 3       | 4   | 5   |
| --- | --- | ----------- | ------- | --- | --- |
|     | 941 | ~~462~~ 411 | ~~411~~ |     |     |

Probe function

The probe function is linear, i.e. it's of the form: p(i) = βi + y

Recall h(k,i) = ( f(k) + p(i) ) % M

A good probe function must satisfy 2 properties:

* P(0) = 0 The first time we compute h(k,i) we should get f(k)
* The set of probe results should contain every integer between [0, M-1]
  * Ensures every slot can be probed
  * For this to happen β and M must be relatively prime (their GCD is 1)
    * If M is prime, β can be anything
    * If we can't guarantee M is prime, then β must be either 1 or prime

Primary clustering - can lead to adjacent clusters being merged into a mega cluster

#### Quadratic Probing

P(i) = βi2 + yi + σ

Common choices are β = 1, y = 0, and σ = 0

Con: when 2 keys, k1 and k2 both produce same result for h(k, 0) (f(k1) == f(k2)) then their probe sequences will be the same

Primary vs secondary clustering

| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | ... | 16  | 17  | 18  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | A   | AB  | BC  | AC  | B   | C   |     | A   | B   | C   |     | A   | B   | C   |

Different keys contending for different spots

#### Open addressing with Rehashing

h(k,i) = ( f(k) * ig(k) ) % M

* g(k) must never return 0 and be relatively prime to M

How to ensure

* make M a power of 2 and ensure g(k) returns an odd number
* Make M prime and ensure g(k) returns a positive integer less than M

A good hashing function

* Avoids collisions
* Outputs for a set of keys to be uniformly distributed ideally
* Cheap to compute
* Deterministic
* If K<sub>1</sub>==K<sub>2</sub> then h(K<sub>1</sub>)==h(K<sub>2</sub>)
