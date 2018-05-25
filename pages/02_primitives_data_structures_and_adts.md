# Primitives, Data Structures, and ADTs

## Primitives
Primitives are the values the CPU manipulates and typically have a simple numeric representation.

*   int, float, double, bool, etc. 

Many have multiple flavors; different sizes/precisions, signed/unsigned, etc.

Ultimately all the data we manipulate with a computer are composed of primitives.

## Data Structures
Data Structures are a technique for organizing a group of data within the computer's memory - i.e. how the data are physically structured/laid-out in memory.

*   Objects created to organize the data involved in the computation of an algorithm

Examples:

*   Arrays
*   Records (C/C++ struct/union)
*   Linked structures
    *   Linked lists (AKA chains)
    *   Trees and graphs
*   (simple) hash table

## Abstract Data Types
Abstract data types are groupings of values and the operations that can be performed on them. 

*   All of the interactions on the values are performed via a  well defined interface (i.e. the set of operations the ADT supports)

They are independent of any particular representation (i.e. representation using data structures and/or primitives) - hence abstract. 

*   There are multiple representations for the same ADT, each with difference performance characteristics.

A data type (a set of values and a collection of operations on those values) that is only accessed through an interface. Client programs do not access any data values except through an operations provided in the interface.

*   Examples:
    *   Stack
    *   Queue
    *   Lists
    *   Maps (dictionaries)

## ADTs vs Data Structures
People tend to be loose with terminology; it is common to find data structure as a generic term for either data structure or ADT, e.g. people say a stack is a data structure (it's an ADT)

In general, it doesn't matter, but if you are asked specifically, you should know the differences and be able to classify.