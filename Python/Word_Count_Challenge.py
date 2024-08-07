"""
Word Count Challenge
Count the number of words in a given sentence.

Constraints: The input variable sentence must be a string.
"""

def count_words(sentence):
    words = sentence.split()
    return len(words)
