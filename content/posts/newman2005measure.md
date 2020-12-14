+++
title = "A measure of betweenness centrality based on random walks"
author = ["Alex Day"]
lastmod = 2020-12-13T20:21:07-05:00
draft = false
+++

tags
: [Network Science]({{< relref "20200825162306-network_science" >}})


## Notes {#newman2005measure}


### Abstract Summary {#abstract-summary}

Betweenness Centrality makes the assumption that information only propogrates through the geodesic paths. This measure uses random walks as to propose a betweenness measure that doesn't only go through geodesic paths but essentially all paths between two nodes.


### Sumarization of Betweenness Centrality {#sumarization-of-betweenness-centrality}

Betweenness centrality is the portion of all communication that flows through some node \\(i\\) assuming communication occurs only over geodesic paths. Although it is not always the case that information does only flow over geodesic paths.


### Betweenness Centrality 2: Flow Boogaloo {#betweenness-centrality-2-flow-boogaloo}

Freeman in 1991 suggested a more sophisticated measure based on the "flow" of information through a network where each edge has some maximum flow capacity. The betweenness of a node is then the amount of flow through vertex \\(i\\) when the flow from \\(s\\) to \\(t\\) is maximal. There is some averaging beacuase there isn't one unique solution but that is the gist. However, this still assumes that the information flows in the most efficient way possible.


### Introduction of Random Walk Betweenness {#introduction-of-random-walk-betweenness}

Random walk betweenness is then defined as the number of times some random walk between nodes \\(s\\) and \\(t\\) passes through node \\(i\\), averaged over all \\(s\\) and \\(t\\) s.t. \\(s \ne t \ne i\\).


### Circuit City {#circuit-city}

This I don't understand at all. Something about how if you change all the edges to resistors and pump some current in and out of the graph then the current at \\(i\\) is equal to the random walk betweenness.


## Summary {#summary}

In this paper Newman introduces an augmented betweenness centrality based on random walks rather than geodesic paths. This is motivated by the assumption that information flows along all edges with equal probability. In this measure the betweenness of some vertex \\(i\\) is equal to the net number of times \\(i\\) is visited during a random walk starting at \\(s\\) and ending at \\(t\\) for all pairs \\((s, t)\\). This more aptly models vertex importance in networks where the path that information must take is not known, such as Peer2Peer networks. Newman then introduces the analogy of a circuit where every edge is represented by unit resistors and unit current is given at \\(s\\) and removed at \\(t\\). The random walk betweenness is defined to be equal to the current flowing through a vertex averaged over all \\(s\\) and \\(t\\).

Newman finishes his introduction of his measure with a matrix-based algorithm for its calculation. He defines \\(M\_{ij}^{(st)} = \frac{A\_{ij}}{k\_j}\\) for all \\(j \ne t\\) where \\(A\_{ij}\\) is the \\(ij\text{-th}\\) element from the adjacency matrix and \\(k\_j\\) is the degree of \\(j\\). This matrix is the probability that an _absorbing random walk_ starting at \\(s\\), ending at \\(t\\), and currently at \\(j\\) will take a random step and end up at \\(i\\) (the \\(^{(st)}\\) will not be shown in the following equations for ease of understanding but it should be inferred that these equations are for a specific random walk starting at \\(s\\) and ending at \\(t\\)). Because this is an absorbing random walk the \\(t\text{-th}\\) column is redundant and can be removed. The matrix with this row removed is denoted as \\(M\_t\\) (similar notation is used for \\(A\\) and \\(D\\), where \\(D\\) is the diagonal matrix of vertex degrees). For a walk starting at \\(s\\) the probability of being at \\(j\\) after \\(r\\) steps is given by \\([M\_t^r]\_{js}\\). The probability that a random step taken from this state and arriving at \\(i\\) is then \\(k^{-1}\_j[M^r\_t]\_{js}\\). The average number of times that the random walk goes from \\(j\\) to \\(i\\)  is then equal to \\(k^{-1}\_j[(I - M\_t)^{-1}]\_{js}\\). This can be written as an element of the vector \\(V=D\_t^{-1}\cdot(I-M\_t)^-1\cdot s\\) where \\(s\\) is defined as follows

\\[ s\_i = \begin{cases}
      +1 & \text{for } i = s\\\\\\
      -1 & \text{for } i = t\\\\\\
      0 & \text{otherwise}
   \end{cases}
\\]

The net flow of the random walk along the edge \\(ij\\) is given by the absolute difference between \\(V\_i\\) and \\(V\_j\\) or \\(|V\_i - V\_j|\\). and the net flow through vertex \\(i\\) is half the sum over all edges connected to \\(i\\) or \\(I\_i=\frac{1}{2} \Sigma\_j A\_{ij}|V\_i-V\_j|\\). The betweenness is then the average of the flow over all pairs \\(s, t\\) or \\(b\_i = \frac{\Sigma\_{s<t}I\_i^{(st)}}{(1/2)n(n-1)}\\).

The remainder of the article is focused on how random walk betweenness compares to both flow betweenness and vanilla betweenness centralities. It is then concluded that in networks where resources propagate through all edges (such as sexual disease transmission networks) rather than only through the shortest path (like some communication networks) random walk betweenness is a more apt measure.


## Issues {#issues}


### Communication Assumed to Pass Through Vertexes with Equal Probability {#communication-assumed-to-pass-through-vertexes-with-equal-probability}

This centrality method aims to augment vanilla betweenness centrality by foregoing the assumption that information is only passed through geodesic paths. Instead it makes the assumption that information is equally likely to pass through any edge on any path between two vertexes. This is not always the case, especially so in social networks when two people may talk more often than even the sum of how much they communicate with their other connections. To solve this some value, denoted \\(\alpha\\), could be assigned to an edge \\(ij\\) that is equal to the probability that information will transfer from vertex \\(i\\) to vertex \\(j\\) through this edge \\(ij\\). This value could be taken into account with by modifying \\(M\_{ij}\\) to be \\(\frac{\alpha(ij) A\_{ij}}{k\_j}\\) where \\(\alpha\\) is a function returning the \\(\alpha\\) value for a given edge \\(ij\\).


### No Path Scaling {#no-path-scaling}

Freeman makes the assumption that only geodesic paths should count in terms of centrality measures, and Newman makes an assumption on the opposite end of the spectrum. In this metric, two paths would have the same importance even if one was hundreds of edges longer. While the purpose of this metric is to give equal importance to all paths it might make sense to linearly decay an edges importance based on the total path length. That way a vertex that exists on a shorter path would have a higher centrality than a vertex on a longer path. This would make the metric more applicable to problems where errors are more frequent with the longer path it takes, like in the children's game Telephone or in internet communication networks. This may make it difficult, however, to derive a matrix based approach to this algorithm.


### Metric is Initially Defined in terms of Circuits {#metric-is-initially-defined-in-terms-of-circuits}

Network science is a broad subject that spans multiple disciplines. As such, it is important to make papers within this domain accessable to the greatest amount of people. Newman decides in this paper that the simplest introduction to the equations that define random walk betweenness is to define them in terms of current flow through a circuit. This presents an issue to those in non-electrical focused fields as they may not posses the required background to reason about Kirchhoff's law or even current and voltages. These metrics should rather be presented in a manner that is easy to reason with for the largest audience. A more apt analogy may be message passing in social networks.
