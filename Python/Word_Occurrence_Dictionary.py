"""
Word Occurrence Dictionary

Given a list of sentences, construct a dictionary with all words and the number of their occurrences.

Constraints
The input variable sentences is a list of strings.
The strings in sentences can contain any characters, including letters, numbers, and special characters.
The length of sentences can be any positive integer.
The length of each string in sentences can be any positive integer.
The words in each sentence are separated by spaces.
The words can contain any characters, including letters, numbers, and special characters.
The words are case-sensitive, meaning that "word" and "Word" would be considered as different words.
The number of occurrences of each word in the sentences can be any non-negative integer.

Input: ["Hello world!", "Hello there.", "Hello world?", "Is anybody there?"]
Output: {"Is": 1, "Hello": 3, "there.": 1, "there?": 1, "world!": 1, "world?": 1, "anybody": 1}
"""
 
def count_word(setences):
    word_count={}
    for sentence in sentences:
        words = sentence.split()
        for word in words:
            if word in word_count:
                word_count[word] +=1
            else:
                word_count[word]=1
    return word_count





 

            

