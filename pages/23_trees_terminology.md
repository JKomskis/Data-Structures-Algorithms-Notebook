# Trees: Terminology

## (Free) Tree

A non-ordered set of vertices (nodes) and edges

* For all pairs of vertices, V<sub>i</sub> and V<sub>j</sub>, there exists exactly one path between V<sub>i</sub> and V<sub>j</sub>
* Acyclic
* |E| = |V|-1

![](../images/free_tree.svg)

## Forest 

A disjoint set of trees

* T-E<sub>i</sub> = forest
* T+E<sub>n</sub> = graph (non-tree)

![](../images/forest.svg)

## Rooted Tree (aka unordered tree) 

A tree which has one vertex designated as the root - rooted tree is a graph with a node, called the root, such that each child of the node is a rooted tree

* A subtree consists of a vertex and all its children
* There exists exactly one path connecting V<sub>i</sub> to the root (where V<sub>i</sub> != root)

### Directionless

![](../images/directionless_rooted_tree.svg)

Implicitly tree with bidirectional edges

### Directed

![](../images/directed_rooted_tree.svg)
![](../images/directed_rooted_tree_2.svg)

## Leaf and Non-Leaf Nodes

A vertex without children is a leaf (node) / terminal (node) / external vertex / external node.

A vertex with children is a non-leaf (node) / non-terminal (node) / internal vertex / internal node

## Positional tree / ordered tree

Each node's children have distinct positions that can be labeled with integers

## n-ary tree / M-ary tree/ k-ary tree / …

Positional trees in which each vertex may have (0, n) children

## Full n-ary tree/proper n-ary tree

Each vertex may have either

* No children
* Exactly n children

## Complete n-ary tree

All leaf vertices either at depth d or (d-1)

  * Level (d-1) is completely filled in

There are no gaps to the left of a leaf at depth d

Leaves at depth d are filled in from left-to-right without any gaps

## Binary tree

An n-ary tree, where n == 2

Its children are often called left and right

## Perfect n-ary tree

All leaf vertices are at depth d

All leaves at depth d are filled in

All vertices at depth d-1 have exactly n children

## Degenerate tree

A tree where each vertex has (0,1) children, it thus a fancy chain

## Classify the trees

![](../images/classify_tree_binary.svg)

binary

![](../images/classify_tree_complete_binary.svg)

complete binary

![](../images/classify_tree_degenerate.svg)

degenerate

![](../images/classify_tree_perfect_binary.svg)

perfect binary

![](../images/classify_tree_complete_binary_2.svg)

complete binary
