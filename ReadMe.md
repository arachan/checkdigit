CheckDigit calculate by PowerQuery
------

EAN/JAN13 is Barcode.

We often look Barcode on items at Super Market.

I make Barcode numerical value to concat conpanycd 7 digit and itemcd 5 digit.

It is only 12 digit.

You must add checkdigit EAN12 at last digit.

EAN13 is 13 digits.

I make 12 digit code by PowerQuery in Excel.

## How to Calculate CheckDigit ?

How do you Calculate CheckDigit by PowerQuery in Excel ?

It is to calculate CheckDigit under one.

- 456995111617

1. add all even digits
   - 5 + 9 + 5 + 1 + 6 + 7 = 33
2. It is 3 times
   - 33 x 9 = 99
3. add all odd digits
   - 4 + 6 + 9 + 1 + 1 + 1 = 22
4. 2nd result and 3rd result add all
   - 99 + 22 = 121 
5. minus 10 from 4th result last digit
   - 10 - 1 = 9
6. checkdigit is 9

We need some function under to calculate checkdigit.

1. pick up digit number
2. Change Text to Number
3. Change Number to Text
4. Mod function

I found under 4 function in PowerQuery.

we calculate checkdigit to under 4 functions.

1. [TextAt(value,digit)](https://docs.microsoft.com/en-us/powerquery-m/text-at)
2. [Value.FromText(value)](https://docs.microsoft.com/en-us/powerquery-m/value-fromtext)
3. [Number.ToText(value)](https://docs.microsoft.com/en-us/powerquery-m/number-totext)
4. [Number.Mod(value,divided value)](https://docs.microsoft.com/en-us/powerquery-m/number-mod)

## Sample

- [PowerQuery in checkdigit](pq/checkdigit.m)
- [checkdigit's Excel File](checkdigit.xlsx)


## reference

[International Article Number](https://en.wikipedia.org/wiki/International_Article_Number)