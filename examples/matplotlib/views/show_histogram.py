# variables  `sample` and `num_bins` should be defined in context
import matplotlib.pyplot as plt
n, bins, patches = plt.hist(sample, num_bins, normed=1)
plt.show()
