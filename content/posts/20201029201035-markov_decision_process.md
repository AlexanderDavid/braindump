+++
title = "Markov Decision Process"
author = ["Alex Day"]
lastmod = 2020-12-13T20:17:54-05:00
draft = false
+++

tags
: [Artificial Intelligence]({{< relref "20200903164633-artificial_intelligence" >}})


## Markov Decision Process {#markov-decision-process}


### Stochasticity {#stochasticity}

-   Sometimes you cannot rely that a given action from a specific state may always take you to a certain state
-   How can we act optimally in the face of randomness


### Gridworld {#gridworld}

-   Noisy motion model
    -   80% the action N takes the agent North (if there is no wall)
    -   10% N goes West, 10% N goes east
    -   If there is a wall the agent stays put
-   The agent receives rewards at each step and a big reward if it exits at +1 and a bad reward if it exits at -1
    ![](/ox-hugo/2020-09-03_17-54-54_screenshot.png)


### Stochastic motion model {#stochastic-motion-model}

{{< figure src="/ox-hugo/2020-09-03_17-58-54_screenshot.png" >}}


### Simple Game {#simple-game}

-   At each round:
    1.  Stay or quit
    2.  If quit: you get $10
    3.  If stay: you get $5 and then roll a die
        1.  If the result is 1 or 2 the game ended
        2.  Otherwise the game continues to the next round

![](/ox-hugo/2020-09-03_18-02-27_screenshot.png)
In a Markov Decision Process there are state nodes (in blue), chance nodes (in green), choice edges (in black text), and reward edges with the probability and reward (in red)


### Markov Decision Process {#markov-decision-process}

-   A set of states \\(S\\)
-   A set of actions \\(A\\)
-   A transition function \\(T(s, a, s')\\)
    -   Also called the model or dynamics
    -   Sometimes \\(P(s'|s, a)\\)
-   A reward function \\(R(s, a, s')\\)
    -   Sometimes just \\(R(s)\\) or \\(R(s')\\)
    -   A start state \\(s\_0\\) (and maybe a terminal state)
-   MDPs are non-deterministic search problems
    ![](/ox-hugo/2020-09-03_18-05-59_screenshot.png)
-   In a MDP, "Markov" means that the action outcomes depend only on the current state
    ![](/ox-hugo/2020-09-03_18-07-52_screenshot.png)
-   This is just like search: in the 1st assignment the children of an expanded state depended only on the current node not how you got there


### Policy {#policy}

-   In deterministic we seek an optimal sequence of actions from start to goal
-   In stochastic we seek an optimal policy \\(\pi^\*:S \rightarrow A\\)
    -   Policy \\(\pi\\) gives an action for each state
-   Following a policy yields a random path
-   The utility, \\(U\\), of a policy is the (discounted) sum of the rewards along the path
-   The goal is to find an optimal policy, \\(\pi^\*\\) that maximizes the expected utility


### Discounting {#discounting}

-   It's reasonable to maximize the sum of rewards
-   It's also reasonable to prefer rewards now to rewards later
-   Solution: values of rewards decay exponentially over time based on some discount factor \\(0 <= \gamma <= 1\\)
-   We discount so that algorithms can converge and have theoretical guarantees


### Avoiding Infinite Rewards {#avoiding-infinite-rewards}

-   **Problem**: If the game lasts forever, do we get infinite rewards?
-   Solutions:
    -   Introduce some artificial time horizon \\(H\\)
        -   Gives nonstationary policies (\\(\pi\\) depends on the time left)
    -   Discounting: use \\(0< \gamma <1\\)
    -   Absorbing state: guarantee that for every policy a terminal state will eventually be reached


### Revisitng MDPs {#revisitng-mdps}

-   Same definition as before but with:
    -   Discount factor &gamma;
    -   Horizon \\(H\\) (can be &infin;)
-   MDP quantities so far
    -   Policy &pi;: Choice of action for each state
    -   Utility \\(U\_\pi=\Sigma^H\_{t=0}\gamma^tR(s\_t)\\) Sum of discounte d rewards


### Solving MDPs {#solving-mdps}

<!--list-separator-->

-  Value Iteration

    -   \\(\pi^\*=\text{argmax}\_\pi \mathbb{E} [\Sigma^H\_{t=0}\gamma^tR(s\_t) | \pi]\\)

    <!--list-separator-->

    -  Optimal value Function \\(V^\*\\)

        -   \\(V^\*(s)\\) is the sum of discounted rewards starting in \\(s\\) and acting optimally

        {{< figure src="/ox-hugo/2020-09-08_17-31-58_screenshot.png" >}}

        {{< figure src="/ox-hugo/2020-09-08_17-34-27_screenshot.png" >}}

        -   Closed form for \\(V^\*\\) is CV\\(V^\*=max\_a(R(s, a, s') + \gamma V^\*(s'))\\)

            {{< figure src="/ox-hugo/2020-09-08_17-40-23_screenshot.png" >}}

    <!--list-separator-->

    -  Bellman Equation

        \\(V^\*(s) = max\_a \mathbb{E} [R(s, a, s') + \gamma V^\*(s')]\\)

    <!--list-separator-->

    -  Q-Values

        -   \\(Q^\*(s, a)\\) = expected utility starting at state \\(s\\), taking action \\(a\\), and then acting optimally

            {{< figure src="/ox-hugo/2020-09-08_18-06-00_screenshot.png" >}}

<!--list-separator-->

-  Policy Iteration

    <!--list-separator-->

    -  Extracting Policy from \\(V^\*\\)

        -   It's not obvous
        -   We need to keep track of the optimal policy during value iteration
        -   This is called policy extraction, since the policy is informed by the value

    <!--list-separator-->

    -  Extracting policy from \\(Q^\*\\)

        -   Just take the max from each
        -   Optimal policy is implicit

    <!--list-separator-->

    -  Issues with Value iteration

        -   Slow \\(O(S^2A)\\) per iteration
        -   The "max" at each state rarely changes
        -   The policy often converges before the actions

    <!--list-separator-->

    -  Policy evaluation

        -   In value iteration we max over all actions to compute optimal values
        -   If we fixed some policy \\(\pi(s)\\), then only one action per state
            -   \\(V^\pi(s)\\) =expected total discounted rewards starting in \\(s\\) and following \\(\pi\\)
            -   The value depends now on which policy we fixed
        -   Iterate and converge at optimal policy rather than optimal value
