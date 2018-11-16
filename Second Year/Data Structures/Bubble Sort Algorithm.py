array1 = [1, 3, 5, 6, 2, 4, 7, 10, 0, 10, 4, 2, 15, 20, 75, 1000, 20, 11, 39, 63]
print("Array before being sorted: ", array1)

def bubbleSort( A ):

    for i in range(len(A)):
        for x in range(len(A) - 1, i, -1):
            if (A[x] < A[x-1]):
                tempVar = A[x-1]
                A[x-1] = A[x]
                A[x] = tempVar



bubbleSort(array1)
print("Array after being sorted: ", array1)

