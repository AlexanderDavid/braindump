+++
title = "Constraint Satisfaction Problems"
author = ["Alex Day"]
lastmod = 2020-12-13T20:17:41-05:00
draft = false
+++

tags
: [Artificial Intelligence]({{< relref "20200903164633-artificial_intelligence" >}})


## Constraint Graph {#constraint-graph}


### Independence {#independence}

-   Different components can have independent solutions


### Tree {#tree}

-   Thm: If the constraint graph is a tree it can be solved in \\(\mathcal{O}(nd^2)\\) time


### Iterative Improvement {#iterative-improvement}

-   Keep some local state that you try to improve
-   Fast and memory-efficient but  bsincomplete and sub optimal
-   Combine multiple local states and then randomly try and fix all conflicts
