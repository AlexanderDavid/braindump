+++
title = "Power laws, pareto distributions and zipf's law"
author = ["Alex Day"]
lastmod = 2020-12-13T20:21:13-05:00
draft = false
+++

tags
: [Network Science]({{< relref "20200825162306-network_science" >}})

keywords
:


## [Power laws, pareto distributions and zipf's law](/home/alex/Dropbox/notes/papers/newman2005power.pdf) {#newman2005power}


## Summary {#summary}

Newman begins his paper by introducing the concept of the power-law. That is they roughly follow a straight line when plotted in log-log scale. Newman defines the power-law function \\(p(x) = Cx^{-\alpha}\\) where \\(\alpha\\) is the exponent of the power-law and \\(C\\) is some uninteresting constant.
Newman follows with an introduction to measuring the power-law. He states that there can be some abnormal behavior in the tail of these graphs and one way to fix it is to vary the size of the bins on the log-log scale histogram. This size variance gives the tail of the graph a larger bin size and reduces the amount of jitter shown at the right tail of the graph. Then the concept of a cumulative distribution function (CDF) is introduced where the plot shows the probability that a specific \\(x\\) value has a value greater than or equal to \\(x\\). This distribution is shown in [1](#org340e2f0).

\begin{eqnarray}
\label{eq:1}
P(x) = \int\_{x}^{\infty} p(x')dx'
\end{eqnarray}

The CDF also follows the power-law but with an exponent of \\(\alpha - 1\\). This means that the CDF should also follow the power-law and will have a shallower slope. Because \\(P(x)\\) is well defined for all \\(x\\) the data does not need to be logarithmically binned as there is no jitter at either tail of the graph.

Newman then proposes a formula to calculate \\(\alpha\\) when given the underlying data from a distribution. This is more accurate method than simply calculating the least squares fit which was incompatible with the generated graph from earlier in the paper. This calculation is shown in Equation [1](#orgdacb7cf).

\begin{eqnarray}
\label{eq:2}
\alpha = 1 + n [\Sigma\_{i = 1}^{n} \ln \frac{x\_{i}}{x\_{min}}]^{-1}
\end{eqnarray}

where \\(x\_{i}\\) is the measured quantity for \\(i = 1 \dots n\\) and \\(x\_{min}\\) is the minimum value for which the power-law is an appropriate model (note: the only values in \\(x\_{i}\\) should be those above \\(x\_{min}\\)). This calculation agrees with the earlier generated graph for which the least squares fit was not an appropriate approximation.

Newman then gives 12 examples of the power-law model in domains like citation networks, natural language processing, and astronomy, among others. It is important to note that very few real-world distributions follow the power-law model for the entire dataset.

Then some interesting properties of the power-law are explored, including the normalization constant \\(C\\), the mean value of the distribution \\(\langle x \rangle\\), the probabilistic largest value in some subset of the data, among others. Newman explains the scale-free nature of power-law distributions, meaning that they take the same form no matter what scale we look at it on, and then how to formulate a powerlaw for descrete variables. Newman then concludes by providing 6 different methods used to generate a power-law. These methods all provide different methods that mirror those found in nature.


## Issues {#issues}


### Uses \\(x\_{min}\\) but doesn't give a way to calculate it {#uses--x-min--but-doesn-t-give-a-way-to-calculate-it}

In this paper Newman often talks about the \\(x\_{min}\\) value as the minimum cutoff for the data that acts in accordance with the power-law model. However, nowhere in this paper does Newman propose a method for evaluating the data in order to calculate this value. This could be easily rectified by adding a section to cover this concept. While I understand this is not meant as a full in-depth review of the power-law it would be benificial to cover the basics. Especially as not all of the intended authors (like those in the social sciences) may be intimately familiar with the power-law model.


## Computation {#computation}


### Calculated Power-Law Parameters {#calculated-power-law-parameters}

```python
# Import libraries needed for calculation
import numpy as np
from numpy import log, sum

def find_power-law_variables(data, x_min):
    # Prune the data to only include the section that contains
    # points that behave in a power-law fasion
    data = np.array([d for d in data if d > x_min])
    # Calculate the alpha (Lecture 11 pg. 9)
    alpha = 1 + (len(data) / sum(log(data/(x_min - 0.5))))
    # Calculate the C (Lecture 11 pg. 11)
    C = (alpha - 1) * x_min ** (alpha - 1)
    return alpha, C

# Get the degrees for every node
degrees = [G.degree[node] for node in G]
# Set the value at which the graph starts showing power-law
# behavior
k_min = 20
# Get the alpha and c varaibles for the specified k_min
alpha, C = find_power-law_variables(degrees, k_min)
print(f"alpha: {round(alpha, 3)}")
print(f"C    : {round(C, 3)}")
```

```text
>> alpha: 2.042
>> C    : 23.618
```

As shown above the values calculated for \\(\alpha\\) and \\(C\\) for the power-law distribution are 2.042 and 23.618 respectively. These values were calculated with an \\(x\_{min}\\) of 20. However, when plotted on the distribution the slope (\\(\alpha\\)) aligns with the power-law distribution but the offset (\\(C\\)) does not. I am not sure why this is as I checked my calculation of \\(\alpha\\) with known values and calculated \\(C\\) according to the lecture slides.
