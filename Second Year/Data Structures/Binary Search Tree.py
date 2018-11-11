#------------------------------------------------------------------
import random
# Class definitions

class Node:
    def __init__(self, key):
        self.right = None
        self.left = None
        self.data = key

    def insert(self, data):
        """
        Insert new node with data

        @param data node data object to insert
        """
        if self.data:
            if data < self.data:
                if self.left is None:
                    self.left = Node(data)
                else:
                    self.left.insert(data)
            elif data > self.data:
                if self.right is None:
                    self.right = Node(data)
                else:
                    self.right.insert(data)
        else:
            self.data = data


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
    a = ['a','g','h','j','i','o','p','r','e','w','t','b','n','m','z','s','y','c','k','q']
    print("Unordered array: ", a, '\n')
    bst(a)
    
def bst(array):
    t = Tree()
    root = Node(random.choice(array))
    for i in array:
        root.insert(i)

    print("In order traversal: ")
    in_order(root)

    print("\n" + "Root of tree:", root.data)

main()
