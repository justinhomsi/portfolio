#------------------------------------------------------------------
import random
import timeit

# Class definitions

A = []

## Define function to make array
def randArray(Array, n):
    for i in range(0, n):
        Array.insert(i, random.randint(0, 100))
        
randArray(A, 2000)

bstCount = 0
class Node:
    def __init__(self, key):
        self.right = None
        self.left = None
        self.data = key

    def insert(self, data):
        global bstCount
        """
        Insert new node with data

        @param data node data object to insert
        """
        if self.data:
            if data < self.data:
                if self.left is None:
                    self.left = Node(data)
                    bstCount += 1
                else:
                    self.left.insert(data)
                    bstCount += 1
            elif data > self.data:
                if self.right is None:
                    self.right = Node(data)
                    bstCount += 1
                else:
                    self.right.insert(data)
                    bstCount += 1
        else:
            self.data = data
            bstCount += 1


class Tree:
    def __init__(self):
        self.root = None
        self.size = 0
#------------------------------------------------------------------
# Functions for in-order traversal and bst insertion

def in_order(root):
    if not root:
        return
    in_order(root.left)
    print(root.data)
    in_order(root.right)    

def main():
   bstTimeStart = timeit.default_timer()
   bst(A)
   bstTimeEnd = timeit.default_timer()
   print("The BST comparison count is:", bstCount)
   print("The BST completion time is:", (bstTimeEnd - bstTimeStart) * 1000)
    
def bst(array):
    t = Tree()
    root = Node(random.choice(array))
    for i in array:
        root.insert(i)

    print("In order traversal: ")
    in_order(root)

    print("\n" + "Root of tree:", root.data)

main()
