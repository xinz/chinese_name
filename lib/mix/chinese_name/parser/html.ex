defmodule Mix.ChineseName.Parser.HTML do
  @moduledoc false

  @selector "table[log-set-param=table_view] tr:not(:first-child) div[class=para]"

  def parse(html) do
    html 
    |> Floki.parse_document!()
    |> Floki.find(@selector)
    |> Enum.map(fn div ->
      text(div)
    end)
  end

  defp text(html) do
    html |> Floki.text() |> String.trim()
  end

end
