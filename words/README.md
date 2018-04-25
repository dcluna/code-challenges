Technical Spec
----------------

Write a program which, given a dictionary, generates two output files, 'sequences' and 'words'. Sequences should contain every sequence of four letters that appears in exactly one word of the dictionary, one sequence per line. Words should contain the corresponding words that contain the sequences, in the same order, again one per line.

For example, given the trivial dictionary containing only the following words:

```
arrows
carrots
give
me
```

The expected output would be:

sequences
```
carr
rrot
rots
rows
rrow
give
```

words
```
carrots
carrots
carrots
arrows
arrows
give
```

In the above example, 'arro' does not appear in the output. This is because it is found in more than one word (cARROts, ARROw).

For the final solution, read in the dictionary file in this repo.
