+++
title = "A set of measures of centrality based on betweenness"
author = ["Alex Day"]
lastmod = 2020-12-13T20:19:58-05:00
draft = false
+++

tags
: [Network Science]({{< relref "20200825162306-network_science" >}})


## Summary {#summary}

In this paper Freeman lays out the foundation for betweenness centrality. He starts out by laying a conceptual groundwork so that the reader can intuit some base knowledge about how this measure might work in different domains of network science. The main application discussed is that of communication. Freeman explains that a node's importance is heavily correlated to the fraction of the communication that goes on in the graph that passes through this node. Freeman then goes to describe how to measure this importance or centrality of any node within the graph. He defines the importance of a first with respect to two other nodes. He says that the importance of some node \\(k\\) with respect to two other nodes \\(i\\) and \\(j\\) (s.t. \\(k \ne i \ne j\\)), denoted \\(b\_{ij}(p\_k)\\), is equal to the probability that \\(k\\) lies on a randomly chosen geodesic path between \\(i\\) and \\(j\\). This idea is then expanded so that the importance of some node \\(k\\) can be defined as it relates to the whole graph by summing \\(b\_{ij}(p\_k)\\) for all \\(i\\) and \\(j\\) s.t. \\(i < j\\) and \\(k \ne i \ne j\\). This measure is denoted by \\(C\_B(p\_k)\\) Freeman then discusses how to compare this measure between graphs by normalizing it w.r.t. the maximum value this measure could be for a graph with the same number of nodes. This normalization is denoted by \\(C'\_B(p\_k)\\) Using this normalization allows for inter-graph comparison of betweenness centralities. The final formulation that Freeman makes is measuring the centrality of an entire graph. Freeman says that the centrality of an entire graph depends on the dominance of one point's betweenness centrality. He stipulates that the centrality of an entire graph is equal to the average difference in the betweenness centrality of the most central point to all other points on the graph. Formally expressed as \\(C'\_B=\frac{\Sigma^{n}\_{i=1}[C\_B(p\_k^\*)-C'\_B(p\_i)]}{n - 1}\\), where \\(p\_k^\*\\) is the node with the highest betweenness centrality. Freeman finishes off with some applications of his measure as it compares to the current (at the time) state of the art in centrality. His measure out-performs Leavitt's Point Centrality Index in a communication network problem.


## Issues {#issues}


### Normalization Will Cause Small Numbers on Large Graphs {#normalization-will-cause-small-numbers-on-large-graphs}

Most of the networks we have worked with in this class thus far have been around \\(15000\\) nodes. The normalization factor for a network of \\(15000\\) nodes, \\(G\_1\\), is \\(\frac{15000^2-3 \times 15000+2}{2}=112477501\\), and for a network with \\(20000\\) nodes, \\(G\_2\\), is \\(\frac{20000^2-3 \times 20000+2}{2}=199970001\\). Suppose we wanted to compare two nodes from \\(G\_1\\) and \\(G\_2\\) with a non-normalized \\(c\_B\\) of \\(15\\) and \\(60\\) respecitvely. We would then be comparing \\(0.000000133300041\\)  with \\(0.00000030004000350053\\). The first problem is that these numbers are hard for a human to interpret. These numbers are very small and will only decrease in size as the graph size increases. The second problem with this is that as the graph size increases it is possible that the machine will lose precision as the value reduces. One way to recify this would be to assign some scaling factor \\(\beta\\) so that \\(c\_B\\) is first scaled by \\(\beta\\) before it was normalized so that the resulting normalized numbers are still relatively large. The problem with this, however, is that we would only be able to compare values with the same \\(\beta\\).


### The Measure of the Most Central Node in the Graph Betweenness is not Normalized {#the-measure-of-the-most-central-node-in-the-graph-betweenness-is-not-normalized}

On page 5 Freeman discusses how to measure the graph centrality with respect to his new centrality metric. The formula he presents is as followsp \\(C'\_B=\frac{\Sigma^{n}\_{i=1}[C\_B(p\_k^\*)-C'\_B(p\_i)]}{n - 1}\\), where \\(p\_k^\*\\) is the node with the highest betweenness centrality. Because \\(C\_b(p^\*\_k)\\) is not normalized it will dominate the normalized measure for every other node. The normalized values of \\(C'\_B(p\_i)\\) range between \\(0\\) and \\(1\\) so the value of \\(C'B\\) will always fall in the range \\(C\_B(p\_k^\*) <= C'\_B <= C\_B(p\_k^\*) + 1\\). Furthermore, this means that it is unwise to compare this measure between different graphs. To fix this problem the value of \\(C\_B(p\_k^\*)\\) could be normalized within the sum and should be \\(C'\_B(p^\*\_k)\\)


### Communication through non-geodesic paths is not taken into account {#communication-through-non-geodesic-paths-is-not-taken-into-account}

The assumption most critical to this measure is that all communication between nodes occurs only through the geodesic paths. However, depending on the domain, this is not always true. For example in Peer2Peer (P2P) networks this assumption does not hold because communication is intentionally decentralized, nor does this assumption hold within online social networks as it could be the case that information spreads faster along a route with more edges due to so called "lurkers". This could be accounted for in some way by adding some weight to each edge that is equal to the probability that each edge carries some information, call this \\(\alpha\\), and then modifying the betweenness of node \\(k\\) w.r.t. nodes \\(i\\) and \\(j\\) to be the average alpha over all paths between \\(i\\) and \\(j\\) that contain \\(k\\) over the average \\(\alpha\\) over all paths between \\(i\\) and \\(j\\). Or, more formally, \\(b\_{ij}(p\_k) = \frac{\Sigma\_{e \in p\_{ij}(k)}\alpha(e)}{\Sigma\_{e \in p\_{ij}}\alpha(e)}\\) where \\(\alpha(e)\\) returns the \\(\alpha\\) for some edge \\(e\\), \\(P\_{ij}\\) returns all edges contained in all paths from \\(i\\) to \\(j\\), and \\(P\_{ij}(k)\\) returns all edges in all paths from \\(i\\) to \\(j\\) that also contain \\(k\\).
