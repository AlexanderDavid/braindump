+++
title = "Botornot: a system to evaluate social bots"
author = ["Alex Day"]
lastmod = 2020-12-13T20:19:39-05:00
draft = false
+++

tags
: Network Science Final


## Notes {#davis2016botornot}

-   Introduces BotOrNot service, an API to discover twitter bots
-   Uses the following features (high level):
    -   Retweet, mention, hashtag-co-occurance networks
        -   Degree distribution
        -   Clustering coefficient
        -   Centrality metrics
    -   User features
        -   Account creation
        -   Language
        -   Geographic locations
    -   Friends
        -   Median, moments, and entropy of the distributions of the number of followers, followees, posts, etc.
    -   Temporal
        -   Timing patterns
        -   Tweet rate
        -   Inter-tweet time distribution
    -   Content
        -   Linguistic queues and POS tagging
    -   Sentiment
        -   Happiness
        -   Arousal-dominance-valence
        -   Emoji scores
-   200 most recent tweets and up to 100 most recent tweets mentioning them
-   Random Forest classifiers
    -   Seven different classifiers, one for each feature
