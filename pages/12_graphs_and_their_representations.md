# Graphs and Their Representations

Graphs come in many flavors

* Direct vs undirected
* Weighted vs unweighted
* Cyclic vs acyclic

Undirected, unweighted, cyclic:

![](../images/undirected_unweighted_cyclic_graph.svg)

Undirected, unweighted, acyclic:

![](../images/undirected_unweighted_acyclic_graph.svg)

Directed, unweighted, acyclic:

![](../images/directed_unweighted_acyclic_graph.svg)

Directed, unweighted, cyclic:

![](../images/directed_unweighted_acyclic_graph_2.svg)

Undirected, weighted, cyclic:

![](../images/undirected_weighted_cyclic_graph.svg)

Directed, weighted, acyclic:

![](../images/directed_weighted_acyclic_graph.svg)

Weights are internally relative

## Adjacency Matrix

![](../images/adjacency_matrix_list_graph.svg)

|     | A   | B   | C   | D   | E   |
| --- | --- | --- | --- | --- | --- |
| A   | 1   | 1   | 1   | 0   | 0   |
| B   | 0   | 0   | 1   | 0   | 1   |
| C   | 0   | 0   | 0   | 1   | 0   |
| D   | 0   | 0   | 1   | 0   | 0   |
| E   | 0   | 1   | 0   | 1   | 0   |

Directed graph:

* Not guaranteed to by symmetric about the diagonal
* Therefore, we need to represent the whole thing

![](../images/adjacency_matrix_list_graph_2.svg)

|     | A   | B   | C   |
| --- | --- | --- | --- |
| A   | 0   | 1   | 7   |
| B   | 1   | 0   | 0   |
| C   | 7   | 0   | 0   |

Undirected graph:

* Symmetric about the diagonal
* Therefore, only really need to represent the upper of lower triangle

Weighted graph:

* Weights in matrix

Unweighted graph:
* 1 used to denote presence of an edge, 0 used otherwise

## Adjacency List

Order is important (each index maps to a specific node)

![](../images/adjacency_matrix_list_graph.svg)
![](../images/directed_graph_adjacency_list.svg)

![](../images/adjacency_matrix_list_graph_2.svg)
![](../images/undirected_graph_adjacency_list.svg)

## List-of-lists adjacency list representation

Order may be important (the Node ID is embedded in the chain of chains)

![](../images/adjacency_matrix_list_graph.svg)
![](../images/directed_graph_adjacency_list_of_lists.svg)

![](../images/adjacency_matrix_list_graph_2.svg)
![](../images/undirected_graph_adjacency_list_of_lists.svg)

In both list representations, the nodes in each adjacency list need not be sorted (though they could be)

## An Object-Based Representation

There are many implementation strategies; one is to have 2 different classes:

* Node
    * Typically have "interesting" behaviors
    * Responsible for maintaining list of edges
* Edge
    * Typically don't have "interesting" behavior - often simple structs
    * An edge instance knows its
        * Weight (when graph is weighted)
        * Destination
        * They frequently also know their source

Aside: There is another object-based scheme that consists entirely of edge objects ["I connect q->P with a cost of 7"]

![](../images/edge_based_graph.svg)