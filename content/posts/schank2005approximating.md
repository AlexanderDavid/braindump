+++
title = "Approximating clustering coefficient and transitivity."
author = ["Alex Day"]
lastmod = 2020-12-13T20:21:25-05:00
draft = false
+++

tags
: [Network Science]({{< relref "20200825162306-network_science" >}})

keywords
:


## Summary {#summary}

In this paper Schank and Wagner propose an algorithm for calculating the clustering coefficient in \\(\mathcal{O}(1)\\) time, an algorithm for calculating transitivity in \\(\mathcal{O}(n)\\) time, and a graph generation algorithm that is based on the preferential attachment rule and also has an adjustable clustering coefficient.

Schank begins with some basic definitions as the building blocks of both transitivity and the clustering coefficient. The first definition of is of a _triangle_ denoted as \\(\Delta\\). A triangle is a complete subgraph of three nodes. The number of triangles that some node \\(v\\) is contained in can be defined as \\(\delta(v) = |\\{(u, w) \in E : (v, w) \in E \land (v, u) \in E\\}|\\). To calculate the total number of triangles in a graph the number of triangles is summed over each node and then divided by three so each triangle is only counted once. This is shown in Equation [1](#org0b2f523).

\begin{eqnarray}
\label{eq:1}
\delta(G) = \frac{1/3} \Sigma\_{v \in V}\delta(v)
\end{eqnarray}

A _triple_, denoted as \\(\Upsilon\\) is a set of three nodes \\((i, v, k)\\) such that there exists a path with length 2 from \\(i\\) to \\(k\\) that has \\(v\\) at the center. This can be calculated for a single node as \\(\tau(v) = {d(v) \choose 2}\\) and is calculated for a whole graph as shown in Equation [1](#orgd1f34b5).

\begin{eqnarray}
\label{eq:2}
\tau(G) = \Sigma\_{v \in V}\tau(v)
\end{eqnarray}

The _clustering coefficient_ of a graph is the likelyhood that some nodes \\(u\\) and \\(w\\) are related given that there are relations between some node \\(v\\) and both \\(u\\) and \\(w\\). This metric is defined for any node with a degree greater than 1 and is calculated as \\(c(v) = \frac{\delta(v)}{\tau(v)}\\). The clustering coefficient for a whole graph is the average clustering coeffiecient for all of its nodes, as seen in Equation [1](#orgd326e02).

\begin{eqnarray}
\label{eq:3}
C(G) = \frac{1}{V'}\Sigma\_{v \in V'} c(v)
\end{eqnarray}

where \\(V' = \\{v \in V : d(v) \gt 1\\}\\)

The _transitivity_ ratio TODO TODO TODO Equation [1](#orgf3bc19b).

\begin{eqnarray}
\label{eq:4}
T(G) = \frac{3\delta(G)}{\tau(G)}
\end{eqnarray}

The penultimate definition that Shank provides is that of a _weighted clustering coefficient_ with some weighting function \\(w : V \rightarrow \mathbb{R}\\) this is defined in Equation [1](#org1b9a477).

\begin{eqnarray}
\label{eq:5}
C\_{w}(G)=\frac{1}{\Sigma\_{v \in V'}w(v)}\Sigma\_{v \in V'} w(v)c(v)
\end{eqnarray}

Shank proposes two weighting functions. The first where \\(w(v) = d(v)\\) and then \\(w(v) = \tau(v)\\). In the latter case \\(\tau(v)\\) cancels out each term in the numerator and so \\(C\_{\tau} = \Sigma \frac{\delta(v)}{\tau(v)}\\) which can be rewritten using Equations [1](#orgf3bc19b) and [1](#org0b2f523) as \\(T(G) = C\_{\tau}(G)\\) and so the transitivity is equal to the \\(\tau-\text{weighted}\\) clustering coefficient. As a corollary of this the metrics \\(C\\) and \\(T\\) are equal for graphs where all nodes have the same degree or all nodes have equal clustering coefficient.

Shank's last definition is _Generalized Transitivity_ which relies on the mapping $X: &Pi; &rarr; \\{0, 1\\}, where \\(\Pi\\) is the set of all triples in the graph and \\(X(\Upsilon)\\) is 1 if there is an edge between all nodes in the triple and 0 if not. The transitivity of a graph can then be rewritten as shown in Equation [1](#org7502f9b).

\begin{eqnarray}
\label{eq:6}
T(G) = \frac{1}{|\Pi|} \Sigma\_{\Upsilon \in \Pi}X(\Upsilon)
\end{eqnarray}

Shank then goes on to show that this can be extended to a weighted average with some weighting function \\(\varpi : \Pi \rightarrow \mathbb{R}\\). This weighted average is shown in Equation [1](#org04c91bd). Shank follows this with a proof that the weighted clustering coefficient is a special case of the weighted transitivity.

\begin{eqnarray}
\label{eq:7}
T\_{\varpi}(G) = \frac{1}{\Sigma\_{\Upsilon \in \Pi}\varpi(\Upsilon)}\Sigma\_{\Upsilon \in \Pi}\varpi(\Upsilon)X(\Upsilon)
\end{eqnarray}

After defining the basic terms needed for the introduction of his algorithms Shank then introduces the current state of the art for the calculation of \\(C\_{w}\\) which is bounded by the time complexity of counting triangles. The current most efficient algorithm with respect to the input size \\(n + m\\) of the graph has a running time of \\(\mathcal{O}(m^{2\gamma/(\gamma + 1)}) \subset \mathcal{O}(m^{2.41})\\), where \\(\gamma \leq 2.376\\) is the fast matrix multiplication exponent.

Shank then introduces his more efficient algorithms for approximating \\(C\_{w}\\), \\(T\\), and \\(C\\). This algorithm works by generating some random sample of length \\(k\\) of all of the nodes in \\(V'\\) (defined for Equation [1](#orgd326e02)) and then only calculating \\(C\_{w}\\) for the nodes in this random sample. Shank then presents a proof that the algorithm that calculates this approximation, $C<sub>w</sub><sup>approx</sup>(G), that is within some \\(\epsilon\\) of the actual \\(C\_{w}\\) with a probability of at least \\(\frac{\nu - 1}{\nu}\\) has a time complexity of \\(\mathcal{O}(n+\frac{\ln(\nu)}{\epsilon^{2}}\ln n)\\) and that their choice of \\(k\\) is correct. This algorithm is then improved such that it can run in constant time. This is achieved by improving the sampling and calculating the random node as needed instead of up front.

In the last theoretical section Shank gives a graph generation algorithm that is based on the preferential attachment rule and also has an adjustable clustering coefficient for the graphs it generates. This is important as previous preferential attachment generators do not provide the high clustering coefficient found in many real life networks.


## Issues {#issues}


### Graph Generation Seems like an Afterthought {#graph-generation-seems-like-an-afterthought}

In Section 4 Shank proposes a graph generation algorithm that builds on ideas adjacent to the ones he proposed in previous sections. However this graph is only described through a short code snippet and no theoretical background is given apart from describing pitfalls of other similar algorithms. Compared to the thoroughness of previous sections this seems bare and I think his algorithm could use a more fleshed out section as they list it as some of the most important contributions of this paper in their abstract. Furthermore, the graph that contains the running time for this generation algorithm is plotted on the same graph as the metric calculation algorithms, and is not plotted against other similar generation algorithms. To rectify this issue more time should be dedicated to this generation algorithm and how it compares to the current state of the art.


### No Results from the Sublinear Algorithm {#no-results-from-the-sublinear-algorithm}

In section 3.2 Shank asserts that the clustering coefficient \\(C\\) can be approximated in constant time by improving the algorithm proposed prior in the paper. However, this is the first and only time this algorithm is brought up in this paper. In their experimental comparisons they use the linear algorithm which should have a longer execution time for a similar amount of nodes. To fix this issue they should have plotted all of their proposed algorithms in Figure 2.


### Random Sample May Not Give Accurate Approximation {#random-sample-may-not-give-accurate-approximation}

A random sample assumes that the extreme values are evenly distributed throughout the nodes. However there could be a handful of extreme nodes that are not included in the random sample. If this is the case then the approximation is not accurate and should not be used. Furthermore the process of choosing a \\(k\\) value is not included in the time complexity calculation even though it certainly plays into the computation time of the algorithm. To rectify this Schank could have proposed an algorithm to generate the value of \\(k\\) and included this in the overall time complexity calculation.
