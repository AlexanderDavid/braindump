+++
title = "Adversarial Games"
author = ["Alex Day"]
lastmod = 2020-12-13T20:17:47-05:00
draft = false
+++

tags
: [Artificial Intelligence]({{< relref "20200903164633-artificial_intelligence" >}})


## Types of Games {#types-of-games}

-   Axes
    -   Deterministic vs Stochastic
    -   Perfect Information
    -   One, two, or more players?
    -   Zero sum?
        ![](/ox-hugo/2020-09-24_17-13-31_screenshot.png)


## Deterministic Games {#deterministic-games}

-   Search Problem
    -   States: \\(S\\) (starts at \\(s\_0\\))
    -   Players: \\(P={1\dots N}\\)
    -   Actions: \\(A\\)
    -   Transition Function \\(S \times A \rightarrow S\\)
    -   Terminal test: \\(S \rightarrow \\{\text{true},\text{false}\\}\\)
    -   Terminal utilities: \\(S \times P \rightarrow \mathbb{R}\\)
-   Solution for a _player_ p is a policy \\(\pi\_p:S \rightarrow A\\)
    -   \\(\pi\_p\\) is defined when it is \\(p\\)'s turn to play


## Why are games hard? {#why-are-games-hard}

-   The utility comes at the end of the game
-   Each state is controlled by different players


## Zero Sum Games {#zero-sum-games}

-   Agents have opposite utilities
-   Single value on maximizes that the other minimizes
-   Adversarial, pure competition


## General Games {#general-games}

-   Agents have independent utilities
-   Cooperation, indifference, competition, etc.


## MinMax {#minmax}

-   Perfect play for deterministic, fully observable games
-   One player maximizes result, the other minimizes result
-   Idea: Choose node with highest minimax value = best achievable utility against best play
-   Has all properties of DFS
    -   Complete, if the tree is finite
    -   Optimal against optimal opponent
    -   Time: \\(O(b^m)\\) where \\(b\\) is the average number of actions and \\(m\\) is the average number of moves per game
    -   Space \\(O(bm)\\)


## Alpha/Beta Pruning {#alpha-beta-pruning}

-   Used to eliminate some paths of exploration for MinMax algorithm
-   General Configuration (MIN version)
    -   We're computing the MIN-VALUE at some node \\(n\\)
    -   Let \\(\alpha\\) be the best value to MAX found so far off the current path
    -   If \\(n\\) is worth than \\(\alpha\\), MAX will avoid it, so we can stop considering \\(n\\)'s other children (prune the branch)
-   Does not affect final result
    -   Values of nodes not taken may be wrong though
-   \\(O(b^{m/2})\\)


## Depth Limited Search {#depth-limited-search}

-   Search only to a limited depth in the tree
-   Replace terminal utilities with an evaluation function for non-terminal positions (estimate desirability of positions)
