import numpy as np
from Nyquist_Pulses import Raised_C, SPLCP
import matplotlib.pyplot as plt

t=np.arange(-10,10,0.1)
plt.plot(t, SPLCP(t,0,10))  # Plot some data on the axes.
plt.show()
