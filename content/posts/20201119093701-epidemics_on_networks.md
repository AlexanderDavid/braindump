+++
title = "Epidemics on Networks"
author = ["Alex Day"]
lastmod = 2020-12-13T20:19:14-05:00
draft = false
+++

-   Analysis of infection spread
    -   In theory we should consider everything
    -   In practice we can only model some of them
-   Model 1: Mass-action approximation (every individual has equal chance for contact)
-   Model 2: Network based


## S(usceptible)-I(nfected) Model {#s--usceptible--i--nfected--model}

-   Someone who doesn't have the disease but coould catch it is _susceptible_
-   Someone who has the disease nd can pass it to a susceptible is _infected_
-   \\(n\\) individuals, \\(S(t)\\) is number of susceptible individuals at \\(t\\), and \\(X(t)\\) is infected at time \\(t\\)
-   \\(s = S/n\\), \\(x = X/n\\)
-   \\(S, X\\) are expectations of \\(S(t), X(t)\\) if we run this process many times
-   \\(\beta\\) is contact per-individual
-   Average rate of new infections

\begin{eqnarray}
\label{eq:1}
X \beta \frac{S}{n} \rightarrow \frac{dX}{dt} = X \beta \frac{S}{n} \text{ or } \frac{dx}{dt} = \beta(1-x)x
\end{eqnarray}

-   The solution to this is a logistic growth curve


## S(usceptible)-I(nfected)-R(ecovered) Model {#s--usceptible--i--nfected--r--ecovered--model}

-   Similar differential model but with an extra parameter for I to R
-   \\(R(t)\\) number of recovered at \\(t\\)
-   &gamma; is the recovery rate
-   \\(\frac{ds}{dt} = -\beta sx\\)
-   \\(\frac{dx}{dt} = \beta sx - \gamma x\\)
-   \\(\frac{dr}{dt} = \gamma x\\)
-   \\(s + x + r = 1\\)
-   Epidemic threshold: transition to epidemic regimes at \\(\beta = \gamma\\)
-   \\(R\_{0}=\frac{\beta}{\gamma}\\)


## S(usceptible)-I(nfected)-S(usceptible) Model {#s--usceptible--i--nfected--s--usceptible--model}

-   Individuals can be reinfected
