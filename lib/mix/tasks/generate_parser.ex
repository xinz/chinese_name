defmodule Mix.Tasks.GenerateParser do
  use Mix.Task

  @html_datasource "https://baike.baidu.com/item/中华姓氏大全/1689641"
  @xlsx_datasource "priv/data/Chinese_Family_Name.xlsx"

  def run(_args) do
    fetch_surnames() |> generate()
  end

  defp fetch_surnames() do
    with {:ok, html} <- download(),
         surnames <- parse(html) do
      surnames
    end
  end

  defp download() do
    Application.ensure_all_started(:finch)

    Finch.start_link(name: Download)

    case Finch.build(:get, URI.encode(@html_datasource)) |> Finch.request(Download) do
      {:ok, response} ->
        {:ok, response.body}

      error ->
        error
    end
  end

  defp parse(html) do
    Mix.shell().info(
      "Successfully download dataset from: `#{@html_datasource}` will be merged with datasource from `#{@xlsx_datasource}`"
    )

    Mix.ChineseName.Parser.parse(html, @xlsx_datasource)
  end

  defp generate(surnames) do
    to_gen = [
      {"priv/templates/generate_parser/break.ex", "lib/generated/break.ex"},
      {"priv/templates/generate_parser/given_name.ex", "lib/generated/given_name.ex"},
      {"priv/templates/generate_parser/surname.ex", "lib/generated/surname.ex"}
    ]

    fun_to_create = fn {source, target} ->
      file_content =
        source
        |> EEx.eval_file(context: %{surnames: surnames})
        |> Code.format_string!()

      Mix.Generator.create_file(target, file_content, [])
    end

    stream = Task.async_stream(to_gen, fun_to_create)

    Enum.map(stream, fn item -> item end)
  end
end
