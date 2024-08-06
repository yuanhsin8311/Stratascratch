"""
Amazon->Easy
Unique Order Values
Find unique values in a given list.

Constraints
The input variable must be a list of integers.
There are no constraints on the length of the input list.
The input list can contain both positive and negative integers.
The input list can contain duplicate values.
The order of the elements in the input list must be preserved in the output list.
"""
def non_duplicate(input):
    seen = set()
    seen_add=seen.add
    return [x for x in input if not (x in seen or seen_add(x))]





