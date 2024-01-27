
import random
import time
import math
import matplotlib.pyplot as plt

def ternarySearch(arr, l, r, x):
    if r >= l:
        mid1 = l + (r - l) // 3
        mid2 = r - (r - l) // 3

        if arr[mid1] == x:
            return mid1
        if arr[mid2] == x:
            return mid2

        if x < arr[mid1]:
            print(arr[l:mid1])
            return ternarySearch(arr, l, mid1 - 1, x)
        elif x > arr[mid2]:
            print(arr[mid2 + 1:r + 1])
            return ternarySearch(arr, mid2 + 1, r, x)
        else:
            print(arr[mid1 + 1:mid2])
            return ternarySearch(arr, mid1 + 1, mid2 - 1, x)

    return -1

def bsearch(A, key_to_search):
 
    n = len(A)
    # Set number of bits to represent
    lg = int(math.log2(n-1)) + 1
 
    # largest array index
    #while ((1 << lg) < n - 1):
        #lg += 1
 
    pos = 0
    for i in range(lg - 1, -1, -1) :
        if (A[pos] == key_to_search):
            return pos
 
        # Incrementally construct the
        # index of the target value
        new_pos = pos | (1 << i)
 
        # find the element in one
        # direction and update position
        if ((new_pos < n) and
            (A[new_pos] <= key_to_search)):
            pos = new_pos
 
    # if element found return
    # pos otherwise -1
    return (pos if(A[pos] == key_to_search) else -1)



def binarySearch(arr, l, r, x):
    if r >= l:
        mid = l + (r - l) // 2

        if arr[mid] == x:
            return mid

        if x < arr[mid]:
            print(arr[l:mid])
            return binarySearch(arr, l, mid - 1, x)
        else:
            print(arr[mid + 1:r + 1])
            return binarySearch(arr, mid + 1, r, x)

    return -1



arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Ternary Search
start = time.time()
print(ternarySearch(arr, 0, len(arr) - 1, 9))
end = time.time()

print("Ternary Search: ", end - start)

# Meta Binary Search
start = time.time()
print(bsearch(arr, 9))
end = time.time()

print("Meta Binary Search: ", end - start)

# Binary Search
start = time.time()
print(binarySearch(arr, 0, len(arr) - 1, 9))
end = time.time()

print("Binary Search: ", end - start)


