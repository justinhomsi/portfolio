## Import modules
import random
import timeit

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
    insCount = 0
    insTimeStart = timeit.default_timer()
    for i in range(0, len(Array)):
        val = Array[i]
        k = i-1
        while (k >= 0) and (Array[k] > val):
            insCount += 1
            Array[k+1] = Array[k]
            k = k - 1
            Array[k+1] = val

        insTimeEnd = timeit.default_timer()

    print("The Insertion comparison count is:", insCount)
    print("The Insertion completion time is:", (insTimeEnd - insTimeStart) * 1000)


## Quick-Sort Function.

qsCount = 0 
def quick_sort(Array, start, end):
    global qsCount
    qsTimeStart = timeit.default_timer()
    
    if start < end:
        pivot = partition(Array, start, end)

        quick_sort(Array, start, pivot - 1)
        quick_sort(Array, pivot + 1, end)
        qsCount += 1
 

    qsTimeEnd = timeit.default_timer()

    return Array

def partition(Array, start, end):
    global qsCount
    pivot = Array[start]
    left = start +1
    right = end
    done = False

    while not done:
        while left <= right and Array[left] <= pivot:
            left = left +1
            qsCount += 1
        while Array[right] >= pivot and right >= left:
            right = right - 1
            qsCount += 1
        if right < left:
            done = True
            qsCount += 1
        else:
            temp = Array[left]
            Array[left] = Array[right]
            Array[right] = temp
            qsCount += 1

    temp = Array[start]
    Array[start] = Array[right]
    Array[right] = temp
    return right


## Merge-Sort Function.
mergeCount = 0
def merge_sort(A):
    global mergeCount
    mergeTimeStart = timeit.default_timer()
    if len(A) < 2:
        return A

    result = []
    mid = int(len(A)/2)

    y = merge_sort(A[:mid])
    z = merge_sort(A[mid:])

    while (len(y) > 0) and (len(z) > 0):
        if y[0] > z[0]:
            mergeCount += 1
            result.append(z.pop(0))
        else:
            mergeCount += 1
            result.append(y.pop(0))

    result.extend(y + z)

    mergeTimeEnd = timeit.default_timer()

    return result


## Bubble-Sort Function.
def bubble_sort( A ):
    bubbleCount = 0
    bubbleStart = timeit.default_timer()
    for i in range(len(A)):
        for x in range(len(A) - 1, i, -1):
            if (A[x] < A[x-1]):
                bubbleCount += 1
                tempVar = A[x-1]
                A[x-1] = A[x]
                A[x] = tempVar
    bubbleEnd = timeit.default_timer()
    print("The Bubble comparison count is:", bubbleCount)
    print("The Bubble completion time is:", (bubbleEnd - bubbleStart) * 1000)

## Selection-Sort Function.

def selectionSort(A):
    selectionCount = 0
    selectionStart = timeit.default_timer()      
    for i in range( len( A ) ):
        least = i
        for k in range(i+1 , len(A)):
            if A[k] < A[least]:
                selectionCount += 1
                least = k
        swap( A, least, i )

    selectionEnd = timeit.default_timer()
    print("The Selection comparison count is:", selectionCount)
    print("The Selection completion time is:", (selectionEnd - selectionStart) * 1000)
def swap( A, x, y ):
    tmp = A[x]
    A[x] = A[y]
    A[y] = tmp

    

def main():
    #insertion_sort(A)
    
    #bubble_sort(A)
    
    #selectionSort(A)
    
    #qsTimeStart = timeit.default_timer()
    #quick_sort(A, 0, len(A) - 1)
    #qsTimeEnd = timeit.default_timer()
    #print("The Quick Sort comparison count is:", qsCount)
    #print("The Quick Sort completion time is:", (qsTimeEnd - qsTimeStart) * 1000)
    
    mergeTimeStart = timeit.default_timer()
    merge_sort(A)
    mergeTimeEnd = timeit.default_timer()
    print("The Merge comparison count is:", mergeCount)
    print("The Merge completion time is:", (mergeTimeEnd - mergeTimeStart) * 1000)
    
main()
    







        
        
