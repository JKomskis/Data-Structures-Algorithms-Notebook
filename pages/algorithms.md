# Algorithms

## What are algorithms?

An algorithm is a well defined computational process which transforms a set of input values into a set of output values.

Note: This is an informal definition - some use more formal and restrictive definitions that account for things like **correctness** and **halting**.

Methods for solving problems that are suited for computer implementation.

## Classification by Technique

Algorithms can be grouped into families that use similar solution methods.

### Brute Force
Enumerate all possible solutions, testing each one to see if it solves the problem (might stop after finding the first solution or continue until you find all possible sets).

E.g. 8 queens problem (place 8 queens on a chess board such that they aren't attacking)

### Backtracking
Smarter than brute force; generate possible solutions for enumeration; if a partial candidate solution can't be correct, skip it and all its decendents, and try the next one

E.g. 8 queens problem

### Greedy
When given a choice, select the most valuable option offered

E.g. getting you money's worth at an all you can eat buffet

### Reductions
Works by transforming a difficult problem into one or more for which we have a solution (or a technique for solving it).

### Divide and Conquer (algorithmic technique)
Relies on recursion for solving the problem, but just because a solution uses recursion doesn't make it a divide and conquer solution.

Because tail recursion is isomorphic to looping (any loop could be written as a recursive process), these are actually decrease and conquer problems because each step divides the problem into exactly one subproblem.

Divide and conquer technique requires the problem to be broken into two or more subproblems

E.g. calculating powers, binary search (actually decrease and conquer), merge sort (divide and conquer)

### Branch and Bound
Used to efficiently find optimal solutions to optimization problems that would otherwise be intractable due to search space's size. It works by eliminating entire groups of candidate solutions (those which can be proven to be non optimal without considering each one)

E.g. checkers - tree of all choices

Often use heuristics to make the decision - when heuristics are used, the solution may be optimal but may also be near optimal (depending on how good the heuristic is).
*   Heuristic - a rule of thumb, works most of the time, not guaranteed to always work.

E.g. widely used in game AI for move planning

### Randomized Algorithms

#### Monte Carlo Methods
Return an approximation of the correct result; the longer it is allowed to run, the more likely the results are to be accurate (and potentially more precise).

E.g. compute the area of strange shapes, etc.

#### Las Vegas Algorithms
Always return the currect result, but the amount of time to compute it is probabilistic.

E.g. choosing random element for quicksort algorithm

## Classification by type of problem solved

*   Sorting
*   Searching
*   Pattern matching (e.g. greatest common subsequence)
*   Graph traversal (e.g. shortest path)
*   Computational geometry (e.g. convex hull, image segmenting, etc.)
*   Machine learning (e.g. automated classification)
*   Encryption
*   Classification
*   Etc.

**Why are there so many algorithms to do the same thing? For instance, there are a bazillion and 3 sorting algorithms (at this moment). Why?**
*   Implementation ease
*   Execution speed
    *   Generalized case
    *   Specialized case
*   Memory restrictions
*   Correctness in concurrent/parallel computing environments
*   Leveraging CPU capabilities (e.g. vector instructions)
*   Power consumption