# AVL Trees

Adelson-Valskii & Landis (1962) <= first self-balancing tree in CS literature

* An empty AVL tree is balanced
* A non-empty binary search tree is AVL balanced when:
  * The left and right subtrees are AVL balanced, AND
  * |height<sub>left</sub>|-|height<sub>right</sub>| <= 1
* A tree's balance factor = height<sub>left</sub> - height<sub>right</sub>

There are four AVL rotations

LL-rotation

```c++
LL_rotate(Vertex*& root){
    vertex *tmp = root;
    root = root->left;
    tmp->left = root->right;
    root->right = tmp;
}
```
RR-rotation (mirror of LL)

LR-rotation

```c++
LR_rotate(Vertex*& root){
    RR_rotate(root);
    LL_rotate(root);
}
```

RL-rotation (mirror of LR)

XY = the two edges that will be adjacent to the new root

Rebalancing a AVL tree after an insertion

The choice of rotation depends on the balance factors

| Root bf | Left bf | Right bf | Type of rotation to use |
| ------- | ------- | -------- | ----------------------- |
| +2      | +1      | ?        | LL-rotation             |
| +2      | -1      | ?        | LR-rotation             |
| -2      | ?       | -1       | RR-rotation             |
| -2      | ?       | +1       | RL-rotation             |

At most only one of these rotation types will be needed after a rotation

* Therefore, O(1)

Rebalancing a tree after a deletion

* Requires no more than lg(N) AVL rotations
* Hint: work from the deletion point upwards to the root

## AVL Trees vs Red-Black Trees

Both rebalance a tree in constant time

Compared to red-black trees, AVL trees are more strictly balanced

* Slightly slower to insert into a AVL tree - both are O(lgN)
* Slightly faster to search an AVL tree - both are O(lgN)

All AVL trees are red-black colorable, but not all red-black trees are AVL balanced
