import matplotlib.pyplot as plt
import numpy as np

x1 = []
y1 = []
with open('merge_mpi.txt', 'r') as f:
    for line in f:
        line = line.split(',')
        x1.append(int(line[0]))
        y1.append(float(line[1]))


x2 = []
y2 = []
with open('quick_mpi.txt', 'r') as f:
    for line in f:
        line = line.split(',')
        x2.append(int(line[0]))
        y2.append(float(line[1]))

# plot graph
plt.plot(x1, y1, label='Merge Sort')
plt.plot(x2, y2, label='Quick Sort')
plt.xlabel('No of processors')
plt.ylabel('Time taken')
plt.title('Merge Sort vs Quick Sort using MPI')
plt.legend()
plt.show()
