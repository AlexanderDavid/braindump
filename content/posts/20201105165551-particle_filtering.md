+++
title = "Particle Filtering"
author = ["Alex Day"]
lastmod = 2020-12-13T20:18:56-05:00
draft = false
+++

## Why Particle Filtering? {#why-particle-filtering}

-   Sometimes \\(|X|\\) is too big to use exact inference
    -   \\(|X|\\) may be too big to even store \\(B(X)\\)
    -   E.g. X is continuous


## What is Particle Filtering? {#what-is-particle-filtering}

-   A way of narrowing down the state space for filtering using [Hidden Markov Models]({{< relref "hidden-markov-models" >}})
-   Approximate inference using samples (particles)
-   Track samples of X not all values
-   Time per step: \\(O(|\text{particles}|)\\)
    -   But the number may be large
-   In memory: list of particles not states
-   Aka Monte Carlo filter, Survival of the fittest, Bootstrap filter


## Particles {#particles}

-   \\(B(X\_t) = P(X\_{t}|e\_{1:t})\\) is now a list of samples \\({x\_{t}^{1}, x\_{t}^{2}, \dots, x\_{t}^{N}}\\)
    -   Generally N << |X|
    -   Storing map from X to counts would defeat the point


## Step 1: Time Update {#step-1-time-update}

-   Problem
    -   Given \\({x\_{t}^{1}, x\_{t}^{2}, \dots, x\_{t}^{N}}\\) approximating \\(B(X\_{t})\\), find the next set of particles
-   Solution
    -   Move each particle by sampling it's next position from the transition model
