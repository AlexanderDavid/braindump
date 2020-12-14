+++
title = "Research as a Stochastic Decision Process"
author = ["Alex Day"]
lastmod = 2020-12-13T20:16:26-05:00
draft = false
+++

This document details an approach to research (or any project with an uncertain outcome) and specifically what order to attack your actionable items in


## Warm Up {#warm-up}

It is often that when starting a project you set out with a TODO list of tasks. The order that most people (myself included) perform these tasks in is easiest to hardest.

However the problem with this is that if you get 80% of the tasks done and then realize that the remaining two tasks are impossible to complete while keeping the system you have to scrap all the work that you have done.

The author postulates that tasks should be prioritized by their likelihood to fail (larger likelihoods first) and based on the time they will take (shorter tasks first)


## A Better Strategy: Sorting by Information Rate {#a-better-strategy-sorting-by-information-rate}

A more formal strategy is to do tasks by sorting them based on most informative by unit time. The author lays out two strategies for measuring informativeness.

1.  Expected Time Saved
    Higher "informative" tasks give a higher amount of time saved if they fail.

    ```text
        Situation: All steps of a project take equal time to complete and have an 80% success rate

        Task Order: Do the shortest tasks first. This means that if a task fails then all the longer tasks haven't been done yet and the time is saved.
    ```

<!--listend-->

```text
    Situation: Task 1 (90% success, 30 minutes), Task 2 (40% success and 4 hours)

    Do easy task first. If it failes we save 240 minutes. (10% * 240 = 24 minutes saved). If we did the opposite and did the hard task first we save 30 minutes or (60% * 30 minutes) 18 minutes
```

This method is bad however because it is \\(O(n) = n!\\).

1.  Failure Rate
