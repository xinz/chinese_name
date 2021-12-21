defmodule ChineseName.ParserTest do
  use ExUnit.Case

  @html File.read!("test/support/page-20211220.html")
  @xlsx_path "priv/data/Chinese_Family_Name.xlsx"

  test "HTML.parse/1" do
    surname_list = Mix.ChineseName.Parser.HTML.parse(@html)

    assert "赵" in surname_list and "欧阳" in surname_list and
             assert_special_defined_from_html(surname_list)
  end

  defp assert_special_defined_from_html(surname_list) do
    assert "公叔" in surname_list and "叶赫纳兰" in surname_list
  end

  test "XLSX.parse/1" do
    surname_list = Mix.ChineseName.Parser.XLSX.parse(@xlsx_path)

    assert "赵" in surname_list and assert_special_defined_from_xlsx(surname_list)
  end

  defp assert_special_defined_from_xlsx(surname_list) do
    assert "冼" in surname_list and "亓" in surname_list and "邝" in surname_list
  end

  test "Parser.parse/2" do
    surname_list = Mix.ChineseName.Parser.parse(@html, @xlsx_path)

    # Ensure the return surnames order by its length in DESC to
    # process the generated pattern match in the generated module.
    assert String.length(List.first(surname_list)) > 1
    assert String.length(List.last(surname_list)) == 1

    assert "赵" in surname_list and assert_special_defined_from_html(surname_list) and
             assert_special_defined_from_xlsx(surname_list)
  end
end
