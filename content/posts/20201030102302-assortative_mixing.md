+++
title = "Assortative Mixing"
author = ["Alex Day"]
lastmod = 2020-12-13T20:18:25-05:00
draft = false
+++

tags
: [Network Science]({{< relref "20200825162306-network_science" >}})


The tendency of individuals to associate and bond with similar others
    -   Examples: Social networks, citation networks, web page langauges, animals

_Disassortative Mixing_ - Opposite to assortative


### Discrete {#discrete}

-   \\(c\_i\\) - type of vertex \\(i\\)
-   \\(\delta(i,j)\\) - Kronnecker delta
-   \\(q=\frac{1}{2}\Sigma\_{ij}A\_{aj}\delta(c\_i, c\_j) - \frac{1}{2}\Sigma\_{ij}\frac{d(i)d(j)}{2m}\delta(c\_i, c\_j)\\)
    -   TOtal number of edges between similar vertexes
    -   Expected number of edges between similar vertexes in a random model
-   \\(Q = q/m\\) is called the _modularity_
-   Modularity is a measure of the extent to which like is connected to like in a network


## Scalar {#scalar}

{{< figure src="/ox-hugo/2020-09-24_10-14-18_screenshot.png" >}}


## Modularity Maximization {#modularity-maximization}

-   Easy way to cluster
-   Iterative algorithm \\(O(mn)\\)
-   Spectral Modularity Maximization
