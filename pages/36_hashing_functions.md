# Hashing Functions

![](../images/hashing_function.svg)

What are hash functions used for?

* Verifying integrity of files
* Security
* Error detection and authentication
* One-to-one mappings
* Blockchain (AKA bitcoin and cryptocurrencies)

Good hash function - any small change in input causes huge change in hash

## Characteristics of a good hashing function

* Avoids collisions
* Want output of keys to be uniformly distributed
* Easy/cheap to compute
* Deterministic
* Utilize all the information in whatever is being hashed

## A very terrible hash function

`H(k) = k % 10`

Ignores everything but decimal value

## Another terrible function

`H(k) = sum(chars in k)`

H(cat) == H(act)

Lots of collisions

## Division Method (better)

`H(k) = k % M`

* M - usually a very big prime number

Avoids as many collisions as the aforementioned hash

## A note about hashing algorithms

There are 1000s of different hashing algorithms, each behave differently and have different pros and cons

## Middle Square Method

`H(K) = M/W(K2 % W)`

* W - computer's word size
* M - array size

Essentially takes the input, squares it, then performs a bunch of shifts to extract the middle values

## Multiplication vs Division Hashing

Previously we saw division hashing where you do k % something. Multiplication method relies on multiplying by some well known irrational number

## Knuth Multiplicative Hash function:

Upper half overflows and is ignores, lower half is shifted right

## Fibonacci Hashing

Multiplication hashing where A = 1/φ = 0.6180339…

`H = (k * ((sqrt(5)-1)/2 * 2w)) >> (w-p)`

* Where lg(size of array) = p

## Rabin-Karp Substring Search Problem

Given a string "ABCDEF" determine if a particular substring is present in the string  
E.g. "DEF"

Requires some sort of mapping between values

Example of a rolling hash

```c++
Start with a prime number, ex P = 3
Hash = old hash - value(old char)
Hash = hash / prime
New hash = hash + prime^(index of substring-1) * value(char)

DEF ->hash-> 120
ABE = 1 + (2*31) + (5*32) = 52, so 52 is the hash for ABE
BED = 52 - old value = 52 - A = 51
51/prime = 51/3 = 17
BED = 17 + (4 * 32) = 17 + 36 = 53
```

## Universal Hashing Function

Worst case when you try to hash a bunch of things, they all end up mapping to the same bucket and it's a giant collision. To avoid that, the hashing algorithm changes depending on the data

Guarantee at worst 1/M collisions, M = number of keys

## Hashing with non-integer keys

Thus far we've pretty much assumed that the hash function will take an integer (really, a natural number). How to handle non-integer cases?

* Doubles
* C-strings
* Tuple
* std::string

In all these cases, we need to come up with an effective technique (for the expected domain of key values) to map these types to integers
