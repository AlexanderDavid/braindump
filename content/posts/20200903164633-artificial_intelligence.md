+++
title = "Artificial Intelligence"
author = ["Alex Day"]
lastmod = 2020-12-13T20:17:28-05:00
draft = false
+++

## Agents {#agents}

-   An **agent** is an entity that perceives and acts
-   A **rational agent** selects actions that achieve the best (expected) outcome
-   **Reflex agents** consider how the world is but do ****not**** consider future consequences of their actions
    -   Can sometimes be rational, although not always
-   **Planning agents** consider how the world would be based upon their actions and have some goal
    -   Decisions are based on hypothesized consequences of actions
    -   Not always the ****best**** action so they're note always rational


## Searching {#searching}

-   In a Discrete Search Problem we are given:
    -   A finite state space
    -   A finite action space
    -   A cost function
        -   \\(Cost=C(Action, State, FutureState)\\)
        -   The cost of an action is defined as the cost of moving from a state to some future state through that action
    -   A transition model
        -   \\(FutureState=Transition(Action, CurrentState)\\)
    -   Start state and a goal state or goal test
    -   We seek to find a minimum cost solution solution: a sequence of actions that lead from the start to the goal
    -   We assume the cost of the solution is equal to the sum of the cost of each step


## State Space Graphs vs Search Trees {#state-space-graphs-vs-search-trees}

-   State Space Graphs
    -   The state space forms a directed graph where the nodes are states and the edges are actions
    -   Each state occurs only once
    -   Goal test is a set of nodes
    -   Rarely can build it in memory
-   Search Trees
    -   Root has the start state
    -   Branches are actions
    -   The nodes show states but correspond to local PLANS
    -   Search trees can be expanded until the solution is found
        -   Leaf nodes are called the frontier or the open list
        -   Leaf nodes are nodes that have unexplored options
