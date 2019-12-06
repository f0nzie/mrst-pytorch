# README

[toc]


https://www.mathworks.com/help/matlab/math/partial-differential-equations.html



## Solving Partial Differential Equations

In a *partial differential equation* (PDE), the function being solved for depends on several variables, and the differential equation can include partial derivatives taken with respect to each of the variables. Partial differential equations are useful for modelling waves, heat flow, fluid dispersion, and other phenomena with spatial behavior that changes over time.



### What Types of PDEs Can You Solve with MATLAB?

The MATLAB® PDE solver [`pdepe`](https://www.mathworks.com/help/matlab/ref/pdepe.html) solves initial-boundary value problems for systems of PDEs in one spatial variable *x* and time *t*. You can think of these as ODEs of one variable that also change with respect to time.

`pdepe` uses an informal classification for the 1-D equations it solves:

- Equations with a time derivative are *parabolic*. An example is the heat equation ∂u∂t=∂2u∂x2.
- Equations without a time derivative are *elliptic*. An example is the Laplace equation ∂2u∂x2=0.

`pdepe` requires at least one parabolic equation in the system. In other words, at least one equation in the system must include a time derivative.

`pdepe` also solves certain 2-D and 3-D problems that reduce to1-D problems due to angular symmetry (see the argument description for the [symmetryconstant `m`](https://www.mathworks.com/help/matlab/ref/pdepe.html#mw_bf53ae0b-d53a-47fc-81dc-ee63671697a8) for more information).



#### Solution Process

To solve PDEs with `pdepe`, you must define the equation coefficients for *c*, *f*, and *s*, the initial conditions, the behavior of the solution at the boundaries, and a mesh of points to evaluate the solution on. The function call `sol = pdepe(m,pdefun,icfun,bcfun,xmesh,tspan)` uses this information to calculate a solution on the specified mesh:

- [`m`](https://www.mathworks.com/help/matlab/ref/pdepe.html#mw_bf53ae0b-d53a-47fc-81dc-ee63671697a8) is the symmetry constant.
- [`pdefun`](https://www.mathworks.com/help/matlab/ref/pdepe.html#mw_ca773a23-ccd3-45fc-9eb0-0982f085f21d) defines the equations being solved.
- [`icfun`](https://www.mathworks.com/help/matlab/ref/pdepe.html#mw_dbdef752-2363-43aa-94c6-6c2242a43406) defines the initial conditions.
- [`bcfun`](https://www.mathworks.com/help/matlab/ref/pdepe.html#mw_5ccaac8a-d9a6-484d-8859-2ff9fc7e8913) defines the boundary conditions.
- [`xmesh`](https://www.mathworks.com/help/matlab/ref/pdepe.html#mw_39f0a244-6853-4b5a-b45c-ef17928a7175) is a vector of spatial values for *x*.
- [`tspan`](https://www.mathworks.com/help/matlab/ref/pdepe.html#mw_86a8dc7c-372b-421b-8082-2b459cb51733) is a vector of time values for *t*.

Together, the `xmesh` and `tspan` vectors form a 2-D grid that `pdepe` evaluates the solution on.

