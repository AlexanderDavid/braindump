+++
title = "Network Generation Algorithms"
author = ["Alex Day"]
lastmod = 2020-12-13T20:18:32-05:00
draft = false
+++

tags
: [Network Science]({{< relref "20200825162306-network_science" >}})


Method of generation for specific networks

Used to test metrics and evaluate if they apply to multiple types of networks


## Price Model {#price-model}

-   Modelled citations
-   New nodes randomly attach to nodes with a prob proportional to the number of citations the paper already had
-   A new paper needs a random non-zero chance of getting cited


## Barabasi-Albert {#barabasi-albert}

-   Similar to price model but undirected
-   Can have non-linear preferential attachment


## Vertex Copying Model {#vertex-copying-model}

-   Same as Price but we copy one of the existing nodes and part of its citations


## Network Optimization {#network-optimization}

-   Some networks are optimized over time
-   Minimize shortest path or other prefered metric


## Small World Model {#small-world-model}

-   Aims to maximize clustering
-   Adding shortcuts to circle model


### Watts-Strogatz {#watts-strogatz}

-   Given circle model
-   Remove Edge
-   Add new randomly uniform


## R-Mat Generator {#r-mat-generator}

-   Generate empty adjacency matrix of a graph and then recursively split into segments (based on assigned probabilities)
-   When some final cell is chosen place an edge between two nodes
-   We can add community "clusters" by increasing the probability
    ![](/ox-hugo/2020-10-15_10-01-19_screenshot.png) bs
