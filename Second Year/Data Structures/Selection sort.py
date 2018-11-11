import random

A = []
n = 100

def randArray(array, n):
    for i in range(0, n):
        array.insert(i, random.randint(0, 100))

def selectionSort(array, n):
    for i in range(len(array)):
        minimum = min(array[i:])
        minimum_index = array[i:].index(minimum)
        array[i + minimum_index] = array[i]
        array[i] = minimum

def main():
    randArray(A, n)

    selectionSort(A, n)

    print(A)

main()


