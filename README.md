# ChineseName

A simple tool built-in dataset for processing Chinese name, to get the surname, given name, or both to the valid Chinese name.

The surnams dataset are merged from:

 * [Baidu Baike - 中华姓氏大全](https://baike.baidu.com/item/%E4%B8%AD%E5%8D%8E%E5%A7%93%E6%B0%8F%E5%A4%A7%E5%85%A8/1689641)
 * [wainshine/Chinese-Names-Corpus](https://github.com/wainshine/Chinese-Names-Corpus/tree/master/Chinese_Names_Corpus/Chinese_Family_Name（1k）.xlsx )

## Usage

We use pattern match to find the match surname or others in the pre-compiled modules, here are some example:

```
iex(1)> ChineseName.surname("李四")
"李"
iex(2)> ChineseName.given_name("李四")
"四"
iex(3)> ChineseName.split("李四")
{"李", "四"}
```

If input an invalid or not-included in the dataset naming, there will return `nil` or the origin input:

```
iex(5)> ChineseName.surname("测试")
nil
iex(6)> ChineseName.given_name("测试")
nil
iex(7)> ChineseName.split("测试")
"测试"
```

Please see the document of the main module `ChineseName` for details.

## Development

Since we use [floki](https://hex.pm/packages/floki) with [html5ever](hex.pm/packages/html5ever) parser to parse the HTML page of [Baidu Baike - 中华姓氏大全](https://baike.baidu.com/item/%E4%B8%AD%E5%8D%8E%E5%A7%93%E6%B0%8F%E5%A4%A7%E5%85%A8/1689641), the Rust compiler [installed](https://www.rust-lang.org/tools/install) is required.

After the mix dependences installed, run `mix generate_parser` you will see the following output:

```
Successfully download dataset from: `https://baike.baidu.com/item/中华姓氏大全/1689641` will be merged with datasource from `priv/data/Chinese_Family_Name.xlsx`
* creating lib/generated/given_name.ex
* creating lib/generated/surname.ex
* creating lib/generated/break.ex
```

As usual, we need to follow the above steps to update dataset(if needed) or fix dataset processing not working because the original web page content changed.

Currently, the `priv/data/Chinese_Family_Name.xlsx` file is a copy from [wainshine/Chinese-Names-Corpus](https://github.com/wainshine/Chinese-Names-Corpus) in this repo.

## Test

Run `mix test`
