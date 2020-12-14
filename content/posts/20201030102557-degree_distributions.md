+++
title = "Degree Distributions"
author = ["Alex Day"]
lastmod = 2020-12-13T20:18:50-05:00
draft = false
+++

tags
: [Network Science]({{< relref "20200825162306-network_science" >}})


\\(p\_k\\) is the probability that a randomly chosen node has a degree \\(k\\)

Classical undirected random graph models \\(G\_{n,p}\\)
    -   Each node is connected independently with probability \\(p\\) to \\(n-1\\) nodes
        -   {{< figure src="/ox-hugo/2020-09-29_09-45-26_screenshot.png" >}}
            -   When n is large, mean degree is approximately constant

What if the network is large?
    -   Mean degree is approximately constant \\(c\\)
    -   let \\(p=\frac{c}{n-1}\\)
    -   \\((1-p)^{n-1-k}=e^{-c}\\)
    -   \\(p\_k = \frac{(np)^k}{k!}e^{-np}\\)

Eigenvector and betweenness centrality roughly correlate with degree in the powerlaw distribution
