## Puzzle

**Numbers: 7 7 7 7 7 1**
```
 ((7 + 7) / 7) * (7 * 7 + 1)
= (14 / 7) * (49 + 1)
= 2 * 50
= 100
```

Using the same type of operators [``+,-,*,/ and ()``], find the result 100 by using one 7 less.


## Idea for solution
*This is probably not the most optimal way of doing it, but well ...*

1. Make an RPN calculator, to avoid having to deal with ( )
2. Generate all possible combinations of numbers given and operators
3. Evaluate them with the RPN calculator
4. As a bonus, trying to convert the RPN notation into usual math notation ?

__Final workflow is the same as described above, including translating back to usual math notation__
_I found at least one bug, e.g. an expression such as ``7 1 7 / +`` is not being generated.
I am not sure if it means that under some circumstances, you can't find a valid result when there is one.
(see line 31 o Main.hs)_
