PowerQueryでチェックディジット計算
-----------

EAN/JAN13はバーコードである。

お近くのスーパー等で商品についているバーコードを見られます。

私は会社コード7桁と商品コード5桁を合わせて12桁のコードを作った。

でも12桁しかない。

12桁にチェックディジットの桁を追加しないといけない。

EAN13は13桁ある。

この12桁のコードをExcelのPowerQuery( パワークエリー )で作っている。

## どうやってチェックディジットを計算する ?

ExcelのPowerQueryでどうやってチェックディジットを計算すればいいだろうか？

チェックディジットの計算方法は以下の通りである。

|桁番号|13|12|11|10|9|8|7|6|5|4|3|2|1|
|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
|例|4|5|6|9|9|5|1|1|1|6|1|7| |
|偶数桁| |5| |9| |7| |2| |6| |7| |
|奇数桁|4| |6| |9| |1| |1| |1| | |

1. 全ての偶数桁を合計
   - 5 + 9 + 5 + 1 + 6 + 7 = 33
2. 1の結果を3倍する
   - 33 x 9 = 99
3. 全ての奇数桁を合計
   - 4 + 6 + 9 + 1 + 1 + 1 = 22
4. 2の結果と3の結果を合計
   - 99 + 22 = 121 
5. 4の結果の最終桁から10を引く。
   - 10 - 1 = 9
6. ここでのチェックディジットは 9

上記を実現するためには以下の関数が必要になる。

1. 特定の桁の数字を取り出す
2. テキスト型から数値型へ変換
3. 数値型からテキスト型へ変換
4. Mod関数

PowerQueryで以下の関数を見つけた。

これを組み合わせればチェックディジット計算ができるだろう。

1. [TextAt(text value,index)](https://docs.microsoft.com/ja-jp/powerquery-m/text-at)
2. [Value.FromText(text value)](https://docs.microsoft.com/ja-jp/powerquery-m/value-fromtext)
3. [Number.ToText(text value)](https://docs.microsoft.com/ja-jp/powerquery-m/number-totext)
4. [Number.Mod(number value,divisor)](https://docs.microsoft.com/ja-jp/powerquery-m/number-mod)

## サンプル

上記の組み合わせて作ったのが下記のサンプルになる。

- [チェックディジットのPowerQuery](pq/checkdigit.m)
- [checkdigitのExcelファイル](checkdigit.xlsx)


## 参考文献

- [チェックディジットの計算方法 - GS1Japan](https://www.gs1jp.org/code/jan/check_digit.html)
- [International Article Number - WikiPedia](https://en.wikipedia.org/wiki/International_Article_Number)