+++
title = "Data Visualization (Fall 2020)"
author = ["Alex Day"]
lastmod = 2020-12-13T20:17:22-05:00
draft = false
+++

## Dataset Information {#dataset-information}


### Dataset {#dataset}

-   Graph
-   Table
-   Fields
-   Geometry

**Note**: Each item in a dataset also has a Data Type (position for geometry, attribute for others, etc.)


### Data {#data}

-   Categorical
    -   Can only check equality
-   Ordinal
    -   Can establish some order
-   Quantitative
    -   Can do some sort of math on them (average, sum, range, etc.)


### Examples {#examples}

<!--list-separator-->

-  Example 1

    Dataset is a graph. The nodes (countries) have an attribute which is their total spending (floating point number) and then an edge between the nodes has a weight that denotes the percentage of total spending that goes to that country (floating point number between 0 and 1). This dataset contains self-edges to denote reinvestment. This dataset could also be represented as a table but the table would use more memory than the graph would.

    {{< figure src="/ox-hugo/2020-09-03_11-18-42_screenshot.png" >}}

<!--list-separator-->

-  Example 2

    The dataset type is tabular. The table has 3 columns for each salary. An categorical string for the job type (Legal, Management, etc.), a ordinal year for each expense, and a quantitative expense cost. I like the way this data is represented as it is easy to see the different "tiers" of job pay. For example it seems like there is a strong band at around $87k-ish. However when the data is heavily clustered it seems like some datapoints can be pushed around.
    ![](/ox-hugo/2020-09-03_11-41-45_screenshot.png)


## Marks and Channels {#marks-and-channels}

Jumping straight to how to visualize


### Marks {#marks}

Basic graphical element visualized as a geometric primitive. This decides the graphical appearance of each attribute in a dataset.

<!--list-separator-->

-  Items

    -   Points
    -   Lines
    -   Areas

<!--list-separator-->

-  Links

    -   Containment
    -   Connection


### Channels {#channels}

Represent how the marks will be displayed in the final visualization.

-   Position
    -   Horizontal
    -   Vertical
    -   Both
-   Color
-   Shape
-   Tilt
-   Size
    -   Length
    -   Area
    -   Volume


### Gestalt Laws {#gestalt-laws}

-   Rules to describe the way we see patterns in visual displays
-   Translate into useful sets of rules for visual design
-   8 laws:
    1.  Proximity
        -   Things that are closer together are perceptually grouped together
    2.  Similarity
        -   Color can really take the lead and pop out that objects share similarities
    3.  Connectedness
        -   Links between objects
    4.  Continuity
    5.  Symmetry
    6.  Closure
    7.  Alignment


### Color in Data Visualizations {#color-in-data-visualizations}

-   3 different things we can modulate

<!--list-separator-->

-  Luminance

    -   Well suited for ordered data
    -   Low accuracy for non-contiguous regions with similar luminance
    -   Small number of discriminable steps (less than 5)

<!--list-separator-->

-  Saturation

    -   Well suited for ordered data
    -   Around 3 discriminable steps
    -   Saturation interacts with the size channel
    -   Saturation and hue are not separable channels within small regions

<!--list-separator-->

-  Hue


### Color Map {#color-map}

-   Mapping from values to color
-   Can be:
    -   Categorical vs Ordered
    -   Sequential vs Diverging
    -   Segmented vs Continuous
    -   Univariate vs Bivariate
