+++
title = "Reinforcement Learning"
author = ["Alex Day"]
lastmod = 2020-12-13T20:18:00-05:00
draft = false
+++

tags
: [Artificial Intelligence]({{< relref "20200903164633-artificial_intelligence" >}})


## Definition {#definition}

-   [Markov Decision Process]({{< relref "20201029201035-markov_decision_process" >}}) but we don't know \\(P\\) and \\(R\\)


## Framework {#framework}

At every timestep \\(t\\) the agent picks an action \\(a\_t\\) and the environment changes to a new state \\(s\_t\\) and the agent is given some reward \\(r\_t\\)
![](/ox-hugo/2020-09-15_17-13-25_screenshot.png)


## Model-Based Learning {#model-based-learning}

{{< figure src="/ox-hugo/2020-09-17_17-13-20_screenshot.png" >}}


### Model-Based Monte Carlo {#model-based-monte-carlo}

1.  Learn empirical MDP using Monte Carlo simulation
    1.  Episodic data: \\(s\_0, a\_0, r\_1, s\_1, a\_1, ..., s\_T\\)
    2.  Estimate transitions and rewards
        ![](/ox-hugo/2020-09-15_17-19-38_screenshot.png)
    3.  Discover each \\(\hat{R}\\) when we experience \\((s, a, s')\\)
2.  Estimates converge to the truth
3.  Solve using value/policy iteration


## Model-Free Learning {#model-free-learning}

{{< figure src="/ox-hugo/2020-09-17_17-14-56_screenshot.png" >}}


### Example {#example}

-


## Q-Learning {#q-learning}

-   Used to compute \\(V^\*\\), \\(Q^\*\\), and \\(\pi^\*\\) in a model free, unknown MDP


### Active RL {#active-rl}

-   Full reinforcement learning
-   Learner makes choices
-   Exploration vs Exploitation


### Tabular Q-Learning {#tabular-q-learning}

-   Sample-based Q-value iteration
    ![](/ox-hugo/2020-09-17_17-26-24_screenshot.png)
-   Learn Q-values as you go
    -   Recieve a sample \\((s, a, r, s')\\)
    -   Consider previous estimate \\(\hat{Q}(s, a)\\)
    -   Consider your new sample estimate
        -   target \\(= R(s,a,s')+\gamma max\_{a'}\hat{Q}(s', a')\\)
    -   Incorperate the new estimate into a running average using some learning rate \\(\alpha\\)
        -   \\(\hat{Q}(s, a) \leftarrow (1 - a)\hat{Q}(s, a) + \alpha\text{[target]}\\)


### Properties {#properties}

-   Q-learning converges to optimal policy, even if you're acting suboptimally if the policy visits every path
-   This is called off-policy learning
    -   On policy: Learn values of the policy used to generate samples
    -   Off policy: Learn the value of another policy
-   Caveats
    -   Lot of exploration
    -   Make the learning rate small enough evantually
    -   Basically, in the limit, it doesn't matter how you select actions!


### Exploration vs Exploitation {#exploration-vs-exploitation}

-   All states should be visited infinitely often
-   Multi-arm bandit

<!--list-separator-->

-  How to sample actions?

    -   Choose random actions?
        -   You need to visit a lot of cells to get enough data of optimal paths
    -   Choose action greedily?
        -   Never try the other paths that could be higher value?
    -   Answer: start by random and transition to greedy to converge
    -   Epsilon-greedy
        -   With a (small) probability \\(\epsilon\\), act randomly
        -   With a (large) probability \\(1-\epsilon\\), act on current policy
