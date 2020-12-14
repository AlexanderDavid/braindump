+++
title = "Hidden Markov Models"
author = ["Alex Day"]
lastmod = 2020-12-13T20:20:11-05:00
draft = false
+++

tags
: [Artificial Intelligence]({{< relref "20200903164633-artificial_intelligence" >}})


## Hidden Markov Models {#hidden-markov-models}

-   [Markov Models]({{< relref "markov-models" >}})  are useful theoretical tools but they are not applicable nowadays
    -   Need observations to update beliefs
    -   Hidden Markov Models combine evidence with each state
        ![](/ox-hugo/2020-10-29_17-19-19_screenshot.png)
        -   Can infer some posterior distribution over some hidden space to glean more information about unobservable variables
        -   Defined by:
            -   Initial distribution: \\(P(X\_{1})\\)
            -   Transition model: \\(P(X\_{t}|X\_{t-1})\\)
            -   Sensor model \\(P(E\_{t}|X\_{t})\\)
-   Weather HMM Example
    ![](/ox-hugo/2020-10-29_17-15-42_screenshot.png)
    ![](/ox-hugo/2020-10-29_17-13-23_screenshot.png)
    -   You are locked in a basement and not allowed to go out. Every day you see someone come in and they either do or do not have an umbrella. Based on this evidence we try to infer the weather outside.
    -   Trying to find \\(P(X\_{3}=+r|E\_{1}=+u, E\_{2}=-1)\\)
        -   Trying to find if it will rain today given all evidence collected so far
-   HMMs have two importance independence properties
    -   Future states are independent of the past given present
    -   Current evidence is independent of all else given current state
-   Real world HMMs
    -   Speech recognition
        -   Observations are acoustic signals
        -   States are specific positions in specific words
    -   Machine translation
        -   Observations are words
        -   States are translation options
    -   Robot Tracking
        -   Observations are range readings
        -   States are positions on a map
-   Filtering/Monitoring
    -   Filtering is the task of tracking the distribution \\(B\_{t}(X) = P(X\_{t}|e\_{1:t})\\) (the belief state) over time
        -   In umbrella the belief state is if it is raining at \\(t\\) given all days my supervisor carried an umbrella
    -   Typically \\(B\_{1}(X)\\) begins as a uniform distribution and is updated over time
    -   The Kalman filter tackles continuous HMM and was first implemented in the Apollo program
-   Localization
    -   HMMs can be used to predict a robots position at some time given some sensor observations
-   Inference
    -   Base Case
        -   \\(P(X\_{1}|e\_{1}) = \frac{P(e\_{1}|X\_{1})P(X\_{1})}{P(e\_{1})}\text{  }\alpha\text{  } x\_{1}P(X\_{1})P({e\_{1}}|X\_{1})\\)
        -   Probability that you are in some state given some reading. Can be calculated
    -   Time/Predict Step
        -   Markov model update
        -   \\(P(X\_{2}) = \Sigma\_{x\_{1}}P(x\_{1}, X\_{2})\\)
        -   Assume we have some current belief \\(B(X\_{t}) = P(X\_{t}|e\_{1:t})\\)
        -   Then after one time step passes:
            -   \\(P(X\_{t+1}|e\_{1:t})\\)
            -   \\(\Sigma\_{x\_t}P(X\_{t+1}, x\_t|e\_{1:t})\\)
            -   \\(\Sigma\_{x\_t}P(X\_{t+1}| x\_t,e\_{1:t})P(x\_{t}|e\_{1:t})\\)
            -   We know \\(P(x\_{t}|e\_{1:t})\\) from the last step
            -   We know \\(P(X\_{t+1}|x\_{t})\\) doesnt depend on evidence
            -   \\(\Sigma\_{x\_{t}}P(X\_{t+1}|x\_{t})P(x\_{t}|e\_{1:t})\\)
            -   Compactly \\(B'(X\_{t+1}) = \Sigma\_{x\_{t}}P(X'|x\_{t})B(x\_{t})\\)
