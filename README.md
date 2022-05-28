# openbd_ruby_alpha

command line interfece to use opendb REST API (https://openbd.jp/).

References:
* https://openbd.jp/

## examples

```
$./openbd_rbcli.rb get 9784296109654 | jq

[
  {
    "isbn": "9784296109654",
    "title": "Amazon　Mechanism （アマゾン・メカニズム）― イノベーション量産の方程式",
    "volume": "",
    "series": "",
    "publisher": "日経ＢＰ",
    "pubdate": "20211126",
    "cover": "https://cover.openbd.jp/9784296109654.jpg",
    "author": "谷敏行／著"
  }
]
```
