# README

## GPU accelerated for MRST (proof of concept)

I started today (Dec 5) work on the evaluation and **Proof of Concept** to port the Matlab Reservoir Simulator [MRST][MRST] to [PyTorch][PyTorch] for [GPU][GPU] acceleration.

Part of the work requires the Eclipse datasets from SPE papers for testing. MRST. I have uploaded most important datasets to its own repository. See references below.

Since PyTorch has built-in functionality to work with [Graphics Processing Units][GPU] or GPUs, we expect demonstrating that PyTorch GPU-based [tensors][tensor] could significantly reduce compute time in reservoir simulation. That is the idea in a nutshell.



## Background

A handful of scientists have already ported some of their [computational physics][computational physics] work to such ML frameworks but do not address specifically reservoir simulation.



## Strategy

1. Test the Partial Differential Equations (PDE) that constitute the  core  of the MRST solvers. Test the running times of the solvers using Matlab  and Octave. Some code for performance testing available in latest book [An  Introduction to Reservoir Simulation Using MATLAB, Octave][book-mrst] by [Knut-Andreas Lie][knut andreas] (see Appendix). 
2. Replicate the functionality in Python using PyTorch for GPUs. Convert  the Matlab code to PyTorch; measure the compute time of MRST solvers.



If GPU compute times are 10 to 100 faster in PyTorch, then proceed with converting more Matlab code to PyTorch tensor based calculations. Thanks [Lukas Mosser][lukas] for the brainstorming.



## Update

Already have some scripts running the basics of the Partial Differential Equations (PDE) required for proving that an experimental  reservoir simulation tool can run using machine learning libraries such as PyTorch and TensorFlow

Scripts in Matlab/Octave, Python. 

Started by testing  Jacobians with TensorFlow. See references for code.



## References

* Code and notebooks: https://github.com/f0nzie/mrst-pytorch
* Eclipse datasets:  https://github.com/f0nzie/reservoir_datasets
* Book [An  Introduction to Reservoir Simulation Using MATLAB, Octave] by Knut-Andreas Lie
* 



## Tags

#petroleumengineering #spe #oilandgas #reservoirengineering #computationalphysics

[MRST]: https://www.sintef.no/projectweb/mrst/
[book-mrst]: https://www.cambridge.org/core/books/an-introduction-to-reservoir-simulation-using-matlabgnu-octave/F48C3D8C88A3F67E4D97D4E16970F894
[PyTorch]: https://pytorch.org/
[GPU]: https://en.wikipedia.org/wiki/Graphics_processing_unit
[tensor]: https://www.grc.nasa.gov/www/k-12/Numbers/Math/documents/Tensors_TM2002211716.pdf
[computational physics]: https://www.eidos.ic.i.u-tokyo.ac.jp/~tau/lecture/computational_physics/docs/computational_physics.pdf
[lukas]: https://www.linkedin.com/in/lukas-mosser/
[knut andreas]: https://www.linkedin.com/in/kalie/