## Window Frames
-  Set of rows relative to the row that is currently beign evaluated by a window function
- These rows form the context for the computation.

SYNTAX

Rows operator is a physical operator that looks at the position of the rows.
```sql
ROWS BETWEEN <starting expression>
AND <ending expression>
```
Range operator is a logical operator that looks at the value of an expression over a set of rows
```sql
RANGE BETWEEN <starting expression>
AND <ending expression>
```
Expressions in Window Frames:

1. Unbounded Precedence (starting expression)
2. Unbounded Following (ending expression)
3. N Preceding (starting expression)
4. N Following (ending expression)
5. Current row (starting expression, ending expression)