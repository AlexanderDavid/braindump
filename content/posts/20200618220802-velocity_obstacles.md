+++
title = "Velocity Obstacles"
author = ["Alex Day"]
lastmod = 2020-06-19T20:47:19-04:00
draft = false
+++

## Slides {#slides}

### From Cartesian to velocity space {#from-cartesian-to-velocity-space}

If you take a Cartesian space where agent A is centered and a point. Then B is at position x<sub>b</sub>-x<sub>a</sub> and has a radius of r<sub>a</sub>+r<sub>b</sub> (because A is a point and the radius has to be inflated).

By doing this you calculate the Minkowski sum. The Minkowsi sum is X &oplus; Y = {x + y | x &isin; X, y &isin; Y}. So if X is the position of A {[0, 0]}, and Y is the position of B {[1, 1]}. Then X &oplus; Y = {[1, 1]}.

### Velocity Space {#velocity-space}

If we take that same 2d plane but change the X and Y axis and change them to velocities (by dividing everything by one second).

Now every point in this space denotes a velocity. The question now is what is the set of velocities that will lead to a collision. This is the VO<sub>A|B</sub>

If we pick some point V<sub>1</sub> and have it define a ray starting at the origin and going through V<sub>1</sub> and that ray passes through the disk at some time &tau; >= 0 then this is a colliding velocity and is in VO<sub>A|B</sub>.

### Revising definition {#revising-definition}

Lets pick some V. If for any &tau; >= 0 V&tau; is in the set denoted by the circle with origin at x<sub>b</sub> - x<sub>a</sub> with radius r<sub>a</sub> + r<sub>b</sub> then it is in the VO<sub>A|B</sub>.

This leads to the time to collision equation

### Time horizon VO {#time-horizon-vo}

If you move a disk closer to the origin you can find the time horizon VO.

Given two agents, A and B, the velocity obstacle VO<sup>&tau;<sub>H</sub></sup><sub>A|B</sub> (read: the velocity obstacle of A induced by B for time horizon &tau;<sub>H</sub>) is the set of all relative velocities that will lead to a collision between A and B at some moment within the next &tau;<sub>H</sub> seconds.

\begin{equation}
VO^{\tau\_{H}}\_{A|B} = { v | \exists \tau \in [0, \tau\_{H}]: \tau V \cap \in D(x\_{B} - X\_{A}, r\_{A} + r\_{B}\_{}) \ne \emptyset }
\end{equation}

The velocity obstacle VO for time horizon &tau;<sub>H</sub> induced on A by B is equal to all velocities such that a &tau; exists between 0 and &tau;<sub>H</sub> (inclusive) such that &tau; V unioned with the disk centered at X<sub>B</sub> - X<sub>A</sub> with radius r<sub>A</sub> + r<sub>B</sub> is not empty.

If a collision happens beyond a certain &tau;<sub>H</sub> it might not matter

Geometrically, this VO is still a cone (assuming circular agents). But this cone is truncated by a disk of radius (r<sub>A</sub> + r<sub>B</sub>)/&tau;<sub>H</sub> and centered at (x<sub>A</sub> - x<sub>B</sub>)/&tau;<sub>H</sub> compared to the VO discussed above.

GOT TO 24:40 ish
