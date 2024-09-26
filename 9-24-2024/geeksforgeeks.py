#User function Template for python3
'''
	Your task is to check if given linkedlist
	is a pallindrome or not.
	
	Function Arguments: head (reference to head of the linked list)
	Return Type: boolean , no need to print just return True or False.

	{
		# Node Class
		class Node:
		    def __init__(self, data):   # data -> value stored in node
		        self.data = data
		        self.next = None
	}

	Contributed By: Nagendra Jha
'''
def get_length(head):
    length = 0
    node = head
    while node != None:
        node = node.next
        length += 1
    return length
    
    
def get_midpoint(head):
    slow = head
    fast = head
    while fast != None and fast.next != None:
        slow = slow.next
        fast = fast.next.next
    return slow
    
    
def reverse(head):
    prev = head
    curr = head.next
    while curr != None:
        next = curr.next
        prev, curr = curr, next
    head.next = None
    return prev
    
    
def is_prefix(tail, head):
    tailp = tail
    headp = head
    while tailp != None:
        if tailp.data != headp.data:
            return False
        tailp = tailp.next
        headp = headp.next
    return True
    
    
#Function to check whether the list is palindrome.
class Solution:
    def isPalindrome(self, head):
        n = get_length(head)
        if n == 1:
            return True
            
        node = get_midpoint(head)
        if n % 2 == 1:
            node = node.next
        tail = reverse(node)
        return is_prefix(tail, head) # if tail is a prefix of head


#{ 
 # Driver Code Starts
#main


class Node:
    # Constructor to initialize the node object
    def __init__(self, data):
        self.data = data
        self.next = None


class LinkedList:
    # Function to initialize head
    def __init__(self):
        self.head = None

    # Function to insert a new node at the beginning
    def push(self, new_data):
        new_node = Node(new_data)
        new_node.next = self.head
        self.head = new_node

    # Utility function to prit the linked LinkedList
    def printList(self):
        temp = self.head
        while (temp):
            print(temp.data, end=" ")
            temp = temp.next
        print("")


if __name__ == '__main__':
    t = int(input())
    while (t > 0):
        llist = LinkedList()
        values = input().strip().split()
        for i in reversed(values):
            llist.push(i)
        flag = Solution().isPalindrome(llist.head)
        if flag:
            print("true")
        else:
            print("false")
        t -= 1
# Contributed by: Harshit Sidhwa

# } Driver Code Ends
