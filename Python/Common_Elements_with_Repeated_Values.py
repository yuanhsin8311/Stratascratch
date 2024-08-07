"""
Amazon->Easy
Common Elements with Repeated Values
Find common elements in 2 given lists and return all aspects even if they are repeated.

Constraints
The input variables list1 and list2 should be of type List[int].
The input lists can have any length.
The elements in the input lists can be repeated.
The elements in the input lists can be in any order.
The input lists can contain both positive and negative integers.
The input lists can contain zero as an element.
The input lists can be empty.

Input: {"list1": [1, 2, 2, 3, 4], "list2": [2, 2, 3, 3, 4, 4]}
Output: [2, 2, 3, 4]
"""
def common_elements(input):
    list1=input["list1"]
    list2=input["list2"]
# put each item from list to dict
    counter1= {}
    counter2={}

    for item in list1:
        if item in counter1:
            counter1[item] +=1
        else:
            counter1[item]=1
    
    for item in list2:
        if item in counter2:
            counter2[item]+=1
        else:
            counter2[item]=1
    # get common numbers from 2 lists
    common={}
    for key in counter1:
        if key in counter2:
            common[key] = min(counter1[key],counter2[key])
    # count occurance of each key and list together
    result =[]
    for key,count in common.list():
        result.extend([key]*count)
    return result











