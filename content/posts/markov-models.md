+++
title = "Markov Models"
author = ["Alex Day"]
lastmod = 2020-12-13T20:20:55-05:00
draft = false
+++

tags
: [Artificial Intelligence]({{< relref "20200903164633-artificial_intelligence" >}})


## Markov Model {#markov-model}

-   Markov models are defined by
    -   Some states \\(X\\)
    -   Initial Distribution \\(P(X\_{\_{1}})\\)
    -   Transitions \\(P({X\_{t}|X{t-1})\\)
-   Basic conditional independence
    -   Past and future independent given the present
    -   Each time step only depends on the previous
    -   First order markov property
-   Example
    ![](/ox-hugo/2020-10-29_17-04-00_screenshot.png)
    -   \\(P(x\_{1})\\) known
    -   \\(P(X\_{t}) = \Sigma\_{x\_{t-1}}P(X\_{t}, X\_{t-1}=x\_{t-1}) = \Sigma\_{x\_{t-1}}P(X\_{t}|X\_{t-1}=x\_{t-1})P(x\_{t-1})\\)
-   Markov models come to convergence at some \\(t\\)
    -   This is called the stationary distribution or \\(P\_{\infty}\\)
    -   \\(P\_{\infty}(X) = P\_{\infty + 1}(X)\\)
