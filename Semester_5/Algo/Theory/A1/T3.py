# Quick Sort from Biggest to Lowest (Descending)
# Print the list after each iteration
# Print the pivot value after each iteration
# array = [9, 19, 14, 29, 13, 4, 23, 10, 37]
# pick the last element as pivot

def quickSort(array, start, end):
    if start < end:
        pivot = partition(array, start, end)
        quickSort(array, start, pivot-1)
        quickSort(array, pivot+1, end)

def partition(array, start, end):
    pivot = array[end]
    i = start - 1
    for j in range(start, end):
        if array[j] >= pivot:
            i += 1
            array[i], array[j] = array[j], array[i]
    array[i+1], array[end] = array[end], array[i+1]
    print("Pivot: ", pivot)
    print(array)
    return i+1

array = [9, 19, 14, 29, 13, 4, 23, 10, 37]
quickSort(array, 0, len(array)-1)
print(array)

