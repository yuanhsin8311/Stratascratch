"""
Unique Words in Two Sentences
Find non-repeated words in any given 2 sentences.

Constraints
The input variables sentence1 and sentence2 must be of type str.
There are no specific constraints on the length or format of the sentences.
"""

from collections import Counter

def non_repeated_words(input):
    sentence1 = input[0]
    sentence2 = input[1]
    
    word_counts = Counter(sentence1.split() + sentence2.split())
    return [word for word, count in word_counts.items() if count == 1]


def non_repeated_words(input):
    input[0]
    input[1]
    











