# Take a sequence of 2n real numbers as input. Design an O(n log2 n) algorithm that
# partitions the numbers into n pairs, with the property that the partition minimizes the
# maximum sum of a pair. For example, say we are given the numbers (1,3,5,9). The
# possible partitions are ((1,3),(5,9)), ((1,5),(3,9)), and ((1,9),(3,5)). The pair sums for
# these partitions are (4,14), (6,12), and (10,8). Thus the third partition has 10 as its
# maximum sum, which is the minimum over the three partitions.

array = [1, 3, 5, 9]
array.sort() 
print(array) 
# create a cartesian product of the array
# https://stackoverflow.com/questions/1208118/using-numpy-to-build-an-array-of-all-combinations-of-two-arrays
import numpy as np
cartesian = np.transpose([np.tile(array, len(array)), np.repeat(array, len(array))])
print(cartesian)


