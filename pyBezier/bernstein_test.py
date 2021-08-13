# Generated on: 2021-08-13 
# Author: Suwon Lee from Samsung Electronics

import numpy as np
import bernstein as bt
import matplotlib.pyplot as plt

coefficients = [0,3,0,0,3]
mybt = bt.Bernstein(coefficients)

tau = np.linspace(0,1,100)
print(np.size(tau))
curve = []

fig,ax = plt.subplots(4,1)
fig.set_size_inches(6,10)
fig.tight_layout()
for i in range(4):
    curve.append(mybt.Pthderivative(tau,i))
    print(i,np.size(curve[i]))

for i in range(4):
    print(curve[i])
    print(i,tau.shape)
    ax[i].plot(tau,curve[i])
    ax[i].grid(True)
plt.show()
