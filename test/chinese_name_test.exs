defmodule ChineseNameTest do
  use ExUnit.Case

  test "ChineseName.surname/1 with valid name" do
    assert ChineseName.surname("李四") == "李"
    assert ChineseName.surname("李si") == "李"
    assert ChineseName.surname("张三") == "张"
    assert ChineseName.surname("王小小") == "王"
    assert ChineseName.surname("亓羽") == "亓"
    assert ChineseName.surname("晓鱼") == "晓"
    assert ChineseName.surname("欧阳修") == "欧阳"
    assert ChineseName.surname("东方白") == "东方"
  end

  test "ChineseName.surname/1 with invalid name" do
    assert ChineseName.surname("小小鱼") == nil
    assert ChineseName.surname("忘记") == nil
  end
  
  test "ChineseName.given_name/1 with valid name" do
    assert ChineseName.given_name("李白") == "白"
    assert ChineseName.given_name("张sam") == "sam"
    assert ChineseName.given_name("公孙胜") == "胜"
    assert ChineseName.given_name("司马迁") == "迁"
    assert ChineseName.given_name("大怀真") == "怀真"
    assert ChineseName.given_name("牛旺旺旺") == "旺旺旺" 
  end

  test "ChineseName.given_name/1 with invalid name" do
    assert ChineseName.given_name("你好") == nil
    assert ChineseName.given_name("测试") == nil
  end

  test "ChineseName.split/1 with valid name" do
    assert ChineseName.split("李白") == {"李", "白"}
    assert ChineseName.split("李bai") == {"李", "bai"}
    assert ChineseName.split("可乐") == {"可", "乐"}
    assert ChineseName.split("诸葛亮") == {"诸葛", "亮"}
    assert ChineseName.split("完颜红烈") == {"完颜", "红烈"}
  end

  test "ChineseName.split/1 with invalid name" do
    assert ChineseName.split("测试") == "测试"
    assert ChineseName.split("hello world") == "hello world"
  end
end
