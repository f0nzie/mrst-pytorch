# Jacobians that run in CPU only

[toc]

## Jacobian solutions with TensorFlow and PyTorch

* Notebooks
* Other have tried Jacobians with TensorFlow but only in CPU
* There are couple of scientific (physics) experiments run in PyTorch with GPU


## What is the Jacobian matrix

Let’s call y the output vector of f. The Jacobian matrix of f contains the partial derivatives of each element of y, with respect to each element of the input x:

![img](https://miro.medium.com/max/292/1*TGd_23HUO4PpApE5eFflKg.png)



This matrix tells us how local perturbations the neural network input  would impact the output. There are cases where this information can be  valuable. For example, in ML systems used for creative tasks, it can be  convenient to have the system provide the users with some interactive  feedback, telling them how modifying each input dimension would impact  each of the output classes.



## Solving with TensorFlow

Let’s now try to compute the Jacobian of this model. Unfortunately,  Tensorflow does not currently provide a method to compute Jacobian  matrices out-of-the-box. The method `tf.gradients(ys, xs)` returns`sum(dy/dx)` for each x in `xs`, which in our case would be *N*-dimensional vector containing the sums of the Jacobian rows; not quite what we are looking for (see [this issue](https://github.com/tensorflow/tensorflow/issues/675)). However, we can still compute our Jacobian matrix, by computing the gradients vectors for each `yi`, and grouping the output into a matrix: