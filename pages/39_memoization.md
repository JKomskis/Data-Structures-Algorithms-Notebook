# Memoization

Is a variation on dynamic programming

* A true DP solution solves the problem bottom-up
* A memoized solution solves the problem top-down

Both rely on the use of a "table" to store previously computed results. Both have the same requirements: (recursive solution, overlapping subproblems, optimal substructure). Dynamic programming does not mirror the recursive process, but memoization preserves the structure of a recursive solution

Memoization uses a table to enumerate the subproblems and their solutions. Initially, the table is filled with sentinel values to indicate that the solution to that subproblem is unknown. The table's values are computed top-down

Example: Fibonacci numbers

Recall: 0 1 1 2 3 5 8 13 …

We can define this function by a recursive relationship:

```c++
fib(n) = [ 0, n == 0
         [ 1, n == 1
         [ fib(n-2)+fib(n-1), otherwise
```

Using memoization to compute fib(n)

```c++
unsigned long int fib(unsigned long int n){
    unsigned long int n1 = n+1;
    long int f[n1];
    //initialize the array with the sentinel values (-1)
    for(unsigned long int i = 0; i != n1; ++i){
        f[i] = -1;
    f[0] = 0;
    if(n > 0) f[1] = 1;
    //top-down computation
    return do_fib(f, n);
}
unsigned long int do_fib(long int *f, unsigned long int n){
    if(f[n] == -1)
        f[n] = do_fib(f, n-1) + do_fib(f, n-2));
    return f[n];
}
```

## Memoization vs. DP

In general:

If all subproblems mist e solved, then a bottom-up DP solution will almost always outperform a top-down (memoization) solution by a constant factor (DP doesn't incur the overhead of doing the recursion)

Some problems will have a regular data access pattern, where the DP solution can be made significantly more efficient by exploiting that pattern

If some subproblems need not be solved, then a top-down (memoized) solution may have a performance advantage (it doesn't waste time solving unneeded subproblems)

Your textbook says to favor the top-down approach (memoized - though that term is never used in the book) claiming:

* If you have a recursive solution, transforming It into a memoized solution is "mechanical" (i.e. so easy you can do it without thinking)
* The order that subproblems are solved takes care of itself (again, implying easier)
* Some subproblems need not be computed

My take: the first 2 arguments are suspect at best, and the third claim doesn't apply to all problems. Therefore, I'll expect you to know how to do both

DP is easy because it has the same structure as a proof by induction

## Other kinds of problems DP is used for

We've already noted that DP is frequently used for optimization problems (find the largest, cheapest, etc.). It's also used for counting problems ("How many?")

* Longest common substring
* Approximate substring matching
  * Mispeld -> misspelled
  * 3 changes necessary: add s, add l, add e
  * Works by doing string transformations, of which there are three:
    * Substitution - two corresponding letters differ KAT->CAT
    * Insertion - add character from the other string CT->CAT
    * Deletion - remove a character not in the other string CAAT->CAT
* Determine the optimal order for matrix multiplication
  * e.g. assuming we want to multiply the matrices: ABCD what ordering will cost the fewest multiply and add operations? A(B(CD)) or A((BC)D) or ((AB)(CD)) or …
* Minimal weight triangulation of a convex polygon
  * The weight of a traingulation is the sum of the length of the diagonals, converting it into a set of triangles
  * Interestingly, a DP solution to this problem has an essentially identical structure to the DP solution for matrix multiplication
* Longest increasing sequence
  * Trying to find the longest (continuous) run of increasing values
  * [3 9 2 11 14 6 5 12]
* The partition problem
  * We have a bunch of tasks (each with a different difficulty), which we want to partition into n sets, such that each set has roughly the same aggregate difficulty

## Aside: the traveling salesman problem (TSP)

A salesman wants to visit all the cities in his region exactly once and make the "least cost" trip (where cost is measured by some factor such as total distance, total time, cost of tolls, etc.)

A straightforward solution to this problem: O(n!)

### Limitation of DP

DP allows us to solve otherwise intractable problems, but it requires (in addition to optimal substructures and overlapping subproblems) sufficient memory to preserve the solutions to the subproblems

Of all the problems we've looked at, the order of the partial problems are calculated is fixed - to scramble them would result in a different problem

With the TSP, the subproblems don't have a fixed order in which they must be solved

* Exponential number of partial subproblems
* As n grows, the amount of memory required quickly makes DP infeasible

While there is a recursive solution to the TSP, each subproblem is described by a set of subproblems and the DP solution is O(2<sup>n</sup>), both in terms of temporal and spatial complexity

While O(2<sup>n</sup>) is a big improvement over O(n!), we'll quickly run into problems that are too large to solve

## Closing words

It is often the case that one can find a tractable DP solution (when a straightforward DP solution is intractable by transforming the problem to reduce the number of subproblems which must be considered
