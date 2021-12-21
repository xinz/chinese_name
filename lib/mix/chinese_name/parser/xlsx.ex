defmodule Mix.ChineseName.Parser.XLSX do
  @moduledoc false

  def parse(xlsx_path) do
    {:ok, package} = XlsxReader.open(xlsx_path)
    {:ok, [sheet | _]} = XlsxReader.sheets(package)
    {_, [_header | rows]} = sheet
    Enum.map(rows, fn [surname, _] -> String.trim(surname)end)
  end

end
