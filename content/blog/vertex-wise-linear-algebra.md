---
title: "Vertex-Wise Linear Algebra"
date: 2025-11-19
draft: false
tags: ["representation-theory", "tensor-categories", "quivers"]
summary: "An Invitation to Quiver Representations"
---

If you have ever taken a linear algebra course, you likely spent a significant amount of time analyzing square matrices. You calculated determinants, found eigenvalues, and perhaps wrestled with the Jordan Normal Form.

Later, you might have realized that a matrix is essentially a coordinate-dependent projection of a more fundamental object: a linear map between vector spaces. A matrix is what we obtain when we fix a basis.

But there is a third perspective. This approach takes the "vector space and map" intuition and lifts it into a combinatorial setting. This perspective allows us to perform linear algebra not just locally at a single **node**, but across a network. This is the theory of **Quiver Representations**.

To understand a quiver representation, we do not need complex definitions immediately. We simply need to view two familiar examples through this structural lens.

## The Single-Object Universe

Consider the classic problem in linear algebra: we have a single vector space, let's call it $V$, and a linear operator $T: V \to V$.

In a standard course, we ask: *What is the canonical form for $T$?* If the field is algebraically closed, we seek the Jordan Normal Form. This characterizes the operator up to similarity.

Now, let's visualize this structurally. We have one location ($V$) and one morphism ($T$).

In the language of quivers, this is a graph with one vertex and one loop.

- The **node** represents the vector space $V$.
- The arrow (loop) represents the linear map $T$.

When we classify the "representations" of this simple graph, we are essentially classifying linear operators up to a change of basis. The "Single Node" quiver is simply the linear algebra of a single endomorphism.

## The Two-Object Universe

Let's increase the complexity slightly. Suppose we have two distinct vector spaces, $V$ and $W$, and a linear map between them, $f: V \to W$.

Visually, this is a graph with two nodes connected by a single arrow.

- Node 1 is assigned the space $V$.
- Node 2 is assigned the space $W$.
- The arrow represents the map $f$.

To classify this system, we look for bases in $V$ and $W$ that simplify the matrix of $f$. The Rank-Nullity theorem provides the answer: we can always choose bases such that the matrix is diagonal with $1$s and $0$s. The structure is entirely determined by the dimensions of the spaces and the rank of the map.

## Connecting the Nodes

Notice the pattern?

1. A graph with **one node and a loop** recovers the theory of **Jordan Normal Forms**.
2. A graph with **two nodes and an arrow** recovers the theory of **Rank**.

These are not disparate topics. They are the simplest instances of **Vertex-Wise Linear Algebra**.

A **Quiver** (a directed graph) creates an underlying combinatorial structure. To build a **Representation** of that quiver, we assign a vector space to every node and a linear map to every arrow.

Linear algebra is no longer confined to a single node; it operates over a network. The question then becomes: *If we construct a more complex graph, such as a star, a cycle, or a chain of $n$ nodes, can we still classify all the possible linear maps that live on it?*

The answer, established by Pierre Gabriel in the 1970s, is surprisingly deep. It connects this "multiobject linear algebra" to the classification of Lie algebras.

## Defining the Structure

Now that we have the intuition that we are placing linear algebra on top of a graph, we can formalize the definitions.

### The Quiver

A **quiver** $Q$ is simply a directed graph. It consists of:
- A set of vertices $Q_0$
- A set of arrows $Q_1$
- Two maps: $s, t: Q_1 \to Q_0$ (source and target) which assign to every arrow $\alpha \in Q_1$ its **source** node $s(\alpha)$ and its **target** node $t(\alpha)$.

### The Representation

A **representation** of $Q$ over a field $k$ assigns:
- A vector space $V_i$ to each vertex $i \in Q_0$
- A linear map $f_\alpha: V_{s(\alpha)} \to V_{t(\alpha)}$ to each arrow $\alpha \in Q_1$

### The Dimension Vector

The **dimension vector** of a representation is the tuple:
$$\mathbf{d} = (\dim V_1, \dim V_2, \ldots, \dim V_n)$$

This simple combinatorial invariant already tells us a lot about the representation.

## Morphisms: Comparing Representations

Given two representations $V$ and $W$ of the same quiver $Q$, a **morphism** $\phi: V \to W$ is a collection of linear maps:
$$\phi_i: V_i \to W_i$$

such that for every arrow $\alpha: i \to j$, the following diagram commutes:

$$V_i \xrightarrow{f_\alpha} V_j$$
$$\downarrow \phi_i \qquad\qquad \downarrow \phi_j$$
$$W_i \xrightarrow{g_\alpha} W_j$$

### The Commutativity Condition

This means: $\phi_j \circ f_\alpha = g_\alpha \circ \phi_i$

In other words, the linear maps must respect the structure imposed by the quiver.

## The Atoms of Linear Algebra

Just as integers factor into primes, representations decompose into **indecomposables**.

A representation is **indecomposable** if it cannot be written as a direct sum of two non-zero representations.

### The Problem of Classification

For which quivers can we explicitly list all indecomposable representations?

**Gabriel's Theorem** provides a stunning answer:

> A quiver has finitely many indecomposable representations if and only if its underlying undirected graph is a Dynkin diagram of type $A_n$, $D_n$, $E_6$, $E_7$, or $E_8$.

* **Type $A_n$:** A simple line of nodes (Linear chains).
* **Type $D_n$:** A line with a fork at one end.
* **Type $E_{6,7,8}$:** Three specific exceptional graphs with short branches.

This connects quiver representations directly to the classification of simple Lie algebras!

Furthermore, Gabriel provided a bijection: the dimension vectors of these indecomposable representations correspond exactly to the **positive roots** of the associated root system.

This result is profound. It tells us that the combinatorics of the graph strictly dictate the complexity of the linear algebra capable of living on it. If the graph is a Dynkin diagram, the linear algebra is "tame" and classifiable.

## **The Categorical Perspective**

Throughout this post, we have treated representations as explicit collections of data: vector spaces at nodes and linear maps on arrows. However, for those familiar with category theory, there is a much more concise definition that captures the entire structure at once.

We can view the quiver $Q$ as generating a small category $\mathcal{Q}$, where the objects are the nodes and the morphisms are the paths formed by sequences of arrows. From this vantage point, a representation is simply a **covariant functor** from the quiver path category to the category of vector spaces:

$$F: \mathcal{Q} \to \textbf{Vect}_k$$

* **Objects:** The functor assigns a vector space $F(i) = V_i$ to each node $i$.
* **Morphisms:** The functor assigns a linear map $F(\alpha) = V_\alpha$ to each arrow $\alpha$.
* **Composition:** The functorality ensures that composition of paths corresponds to composition of linear maps.

Furthermore, the morphisms between representations that we defined earlier (the families of maps satisfying the commutativity condition) are exactly the **natural transformations** between these functors.

### **Why This Matters**

This is not merely a change in notation. By recognizing the category of representations, denoted $\text{Rep}(Q)$, as a functor category, we gain access to the powerful tools of homological algebra. We can speak of kernels, cokernels, and exact sequences of representations. We can compute extension groups to measure how representations can be "glued" together.

We started with a simple matrix, expanded it into a graph of vector spaces, and ultimately arrived at a functor category. This journey from the concrete algebra of matrices to the structural beauty of quivers demonstrates the power of modern representation theory. It turns the "zoo" of linear operators into a structured landscape, where the geometry of the graph dictates the behavior of the algebra.

---

*This post provides an introduction to the theory. For a deeper dive, the following texts provide excellent entry points, ranging from introductory to advanced:*

* **Ralf Schiffler**, *Quiver Representations*. (An accessible introduction focusing on the path algebra and combinatorics).
* **Pavel Etingof et al.**, *Introduction to Representation Theory*. (Chapter 4 covers quivers with a broad view of the field).
* **Alexander Kirillov Jr.**, *Quiver Representations and Quiver Varieties*. (Connects the theory to geometry and physics).
