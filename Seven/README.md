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
3. Evaluate the with the RPN calculator
4. As a bonus, trying to convert the RPN notation into usual math notation ?