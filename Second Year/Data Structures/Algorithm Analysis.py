## Import random module
import random

## Create array
A = []

## Define function to make array
def randArray(Array, n):
    for i in range(0, n):
        Array.insert(i, random.randint(0, 100))
        
randArray(A, 200)
##---------------------------------------------------------------        
## Insertion sort function

def insertion_sort(Array):
    for i in range(0, len(Array)):
        val = Array[i]
        k = i-1
        while (k >= 0) and (Array[k] > val):
            Array[k+1] = Array[k]
            k = k - 1
        Array[k+1] = val

## Quick-Sort Function.

def quick_sort(Array, start, end):
    
    if start < end:
        pivot = partition(Array, start, end)

        quick_sort(Array, start, pivot - 1)
        quick_sort(Array, pivot + 1, end)
    return Array

def partition(Array, start, end):
    pivot = Array[start]
    left = start +1
    right = end
    done = False

    while not done:
        while left <= right and Array[left] <= pivot:
            left = left +1
        while Array[right] >= pivot and right >= left:
            right = right - 1
        if right < left:
            done = True
        else:
            temp = Array[left]
            Array[left] = Array[right]
            Array[right] = temp

    temp = Array[start]
    Array[start] = Array[right]
    Array[right] = temp
    return right


#quick_sort(A, 0, len(A)-1)
#print(A)

## Merge-Sort Function.

def merge_sort(A):
    if len(A) < 2:
        return A

    result = []
    mid = int(len(A)/2)

    y = merge_sort(A[:mid])
    z = merge_sort(A[mid:])

    while (len(y) > 0) and (len(z) > 0):
        if y[0] > z[0]:
            result.append(z.pop(0))
        else:
            result.append(y.pop(0))

    result.extend(y + z)
    return result


print(merge_sort(A))


        
        
