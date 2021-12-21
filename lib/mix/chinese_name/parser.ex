defmodule Mix.ChineseName.Parser do
  @moduledoc false

  alias __MODULE__.{XLSX, HTML}

  def parse(html, xlsx_path) do
    surnames_from_html = HTML.parse(html) |> MapSet.new()
    surnames_from_xlsx = XLSX.parse(xlsx_path) |> MapSet.new()

    surnames_from_html 
    |> MapSet.union(surnames_from_xlsx)
    |> MapSet.to_list()
    |> Enum.sort(&desc_sort_by_length/2)
  end

  defp desc_sort_by_length(name1, name2) do
    String.length(name1) >= String.length(name2)
  end

end
