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

def pre_order(root):
    if not root:
        return
    print(root.data)
    pre_order(root.left)
    pre_order(root.right)

def post_order(root):
    if not root:
        return
    post_order(root.left)
    post_order(root.right)
    print(root.data)

def print_leaf_nodes(node):
    if (node.left == None and node.right == None):
        print(node.data)
    else:
        if node.left is not None:
            print_leaf_nodes(node.left)
        if node.right is not None:
            print_leaf_nodes(node.right)

def print_non_leaf_nodes(node):
    if (node.left is not None or node.right is not None):
        print(node.data)
        if node.left is not None:
            print_non_leaf_nodes(node.left)
        if node.right is not None:
            print_non_leaf_nodes(node.right)

def depth_of_tree(root, depth = 0):
    if root is None:
        return depth
    return max(depth_of_tree(root.left, depth+1), depth_of_tree(root.right, depth+1))

def main():
   # print("Unordered array: ", a, '\n')
   a = [50, 76, 60, 15, 30, 74, 18, 9, 16, 98, 87, 40, 80, 46, 42, 43, 45, 41]
   bstTimeStart = timeit.default_timer()
   bst(a)
   bstTimeEnd = timeit.default_timer()
   print("The BST comparison count is:", bstCount)
   #print("The BST completion time is:", (bstTimeEnd - bstTimeStart) * 1000)
    
def bst(array):
    t = Tree()
    #root = Node(random.choice(array))
    root = Node(50)
    for i in array:
        root.insert(i)

    print("In order traversal: ")
    in_order(root)

    print("\n" + "Pre order traversal: ")
    pre_order(root)

    print("\n" + "Post order traversal: ")
    post_order(root)

    print("\n" + "Leaf nodes of tree: ")
    print_leaf_nodes(root)

    print("\n" + "Non leaf nodes of tree: ")
    print_non_leaf_nodes(root)

    print("\n" + "Depth of tree:", depth_of_tree(root))

    print("\n" + "Root of tree:", root.data)

main()
