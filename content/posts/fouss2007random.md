+++
title = "Random-walk computation of similarities between nodes of a graph with application to collaborative recommendation"
author = ["Alex Day"]
lastmod = 2020-12-13T20:19:52-05:00
draft = false
+++

tags
: [Network Science]({{< relref "20200825162306-network_science" >}})


## Notes {#fouss2007random}


### Weights are assumed to be equal to relation between nodes {#weights-are-assumed-to-be-equal-to-relation-between-nodes}


## Summary {#summary}

In their paper _Random-Walk Computation of Similarities between Nodes of a Graph with Application to Collaborative Recommendation_ Fouss et al. introduce a measure of node similarity based on random-walks called **average commute time**. This metric is first explained in terms of a first-order Markov chain performing a random walk through the network. Fouss first defines the **average first-passage time** , \\(m(k|i)\\), to be equal to the average time it takes for the random walker to get to node \\(k\\) when starting at node \\(i\\). This metric is then expaneded to **average first-passage cost**, \\(o(k|i)\\) performs the same random walk but takes into account some transition cost between nodes. The recursive functions for calculating these metrics are shown in Equations [1](#orgfaace74) and [1](#orgb79555b) respectively    .

\begin{equation}
  \begin{cases}
        m(k|k) = 0  \\\\\\
        m(k|i) = 1 + \Sigma\_{j=1}^{n}p\_{ij}m(k|j)& \text{for $i \ne k$} \\\\\\
  \end{cases}
\end{equation}

\begin{equation}
  \begin{cases}
        o(k|k) = 0  \\\\\\
        o(k|i) = \Sigma\_{j=1}^{n}p\_{ij}c(j|i) +  \Sigma\_{j=1}^{n}p\_{ij}o(k|j)& \text{for $i \ne k$} \\\\\\
  \end{cases}
\end{equation}

where \\(p\_{ij}\\) is the probability of moving to \\(j\\) from \\(i\\) and \\(c(j|i)\\) is the transition cost associated with moving from \\(i\\) to \\(j\\).

The last metric Fouss introduces is **average commute time** ,\\(n(i, j)\\). This metric is defined as the average number of steps required to start and end at \\(i\\) while passing through \\(j\\) or, more formally, \\(n(i,j) = m(j|i) + m(i|j)\\) (note that while \\(n(i,j) = n(j,i)\\) it is not always the case that \\(m(j|i) = m(i|j)\\)). Fouss also states that this metric is a distance measure and also is Euclidian and so will be referred to as Euclidean Commute-Time Distance (ECTD).

Fouss then goes on to provide a derivation of average commute time (derivations for average first-passage time and cost are also shown in the appendix) using the Moore-Penrose pseudoinverse of the Laplacian matrix of the graph, \\(L^+\\). However, as the number of nodes within a graph increases the time required to perform these computations does also. To combat this problem Fouss proposes a method for computing \\(L^+\\) based on a sparse Cholesky factorization of the Laplacian matrix.

In the penultimate section Fouss provides a mapping of the node vectors \\(e\_i\\), where \\(e\_i\\) is the \\(i\text{th}\\) column of \\(\mathbf{I}\\) or \\(\underset{}{[}\underset{1}{0}, \dots \underset{i-1}{0}, \underset{i}{1}, \underset{i+1}{0}, \dots, \underset{n}{0}\underset{}{]}\\), into some Euclidean space where the ECTD is preserved. This is done using the transformation \\(x\_i=\mathbf{U}^T e\_i\\) where \\(\mathbf{U}\\) is the orthonormal matrix of the eigenvectors of \\(\mathbf{L}^+\\) in decreasing order according to their corresponding eigenvalues, \\(\lambda\_{k}\\). Using these \\(x\_i\\) the transformed node vectors \\(x'\_i\\) are calculated as \\(x'\_i=\mathbf{\Lambda}^{1/2}x\_{i}\\) where \\(\mathbf{\Lambda} = \mathbf{Diag}(\lambda\_{k}\_)\\). In this \\(n\text{-dimensional}\\) space the vectors \\(x'\_{i}\\) are exactly separated according to their ECTD. As a corollary of the fact that these \\(x'\_{i}\\) are centered and that the elements of \\(\mathbf{L}^{+}\\) are the inner products between the transformed node vectors, \\(l\_{ij}^{+}=x
'\_{i}^{T}x'\_{i}\\) \\(\mathbf{L}^{+}\\) can be considered a similarity matrix for the nodes.

The last section of the paper outlines some applications of the metrics previously introduced. They use the tripartite graph from the MovieLens dataset, however they only include the `people` and `movie` sets of the graph in their analysis. They use 3 different methods to calculate person-movie similarity and compare their metric against 11 others with the person-independent maximum-frequency algorithm as the baseline all other metrics are compared against. The results show that only the metrics based on the \\(\mathbf{L}^{+}\\) and the cosine similarity of \\(\mathbf{L}^{+}\\) perform better than the current state of the art for this problem.


## Issues {#issues}


### No Normalization of \\(n(i,j)\\) {#no-normalization-of--ni-j}

Fouss proposes the average commute time \\(n(i,j)\\) to be equal to the sum of the average first-passage time from \\(i\\) to \\(j\\) and back again, or \\(m(i|j) + m(j|i)\\). Average first-passage time is heavily dependent on the length of the path between \\(i\\) and \\(j\\) and so, it is also heavily dependent on the number of nodes in the graph. Because this metric \\(n(i,j)\\) is heavily dependent on the number of nodes it needs to be normalized before it can be compared across graphs. No normalization factor has been proposed in this work. One way to normalize this metric would be to take it as a fraction of the maximum value possible in a graph with the same number of nodes as the graph it occurs in. The maximum value for the average commute time occurs in a graph when two nodes are separated by as many edges as possible, such as a line graph, and so the normalization factor should be \\(2|E|\\), or the twice the number of edges in the graph (this is because the random walker has to complete a round trip, visiting every edge twice).


### No weights were used in the analysis {#no-weights-were-used-in-the-analysis}

In the analysis of these metrics with the MovieLens dataset the weight (or cost) of each edge was not taken into account. Because this dataset contains the user ratings as the weight of the edge it is important to include these in the analysis. The assumption the authors make by not including the weight is that all users only watch movies that they enjoy. This is not the case and this may be the cause of the poor results from the average first-passage distance and the euclidian commute-time distance. If the authors used the average first-passage cost in their analysis a user rated highly would be more similar than another highly rated movie, rather than all movies that a user has watched being equal in similarity. Using the average first-passage cost could then lead to a better prediction of other highly rated movies the user may enjoy.
