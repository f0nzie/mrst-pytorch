import numpy as np
import tensorflow as tf
from tensorflow.keras.layers import Dense
from tqdm import tqdm


N = 500  # Input size
H = 100  # Hidden layer size
O = 10   # Output size

w1 = np.random.randn(N, H)
b1 = np.random.randn(H)

w2 = np.random.randn(H, O)
b2 = np.random.randn(O)


""" Keras implementation
# ! can also use input_shape but providing a tuple instead of an integer
"""
sess = tf.InteractiveSession()
sess.run(tf.initialize_all_variables())

model = tf.keras.Sequential()
model.add(Dense(H, activation='relu', use_bias=True, input_dim=N))
model.add(Dense(O, activation='softmax', use_bias=True, input_dim=O))
model.get_layer(index=0).set_weights([w1, b1])
model.get_layer(index=1).set_weights([w2, b2])


model.add()