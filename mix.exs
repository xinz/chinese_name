defmodule ChineseName.MixProject do
  use Mix.Project

  @source_url "https://github.com/xinz/chinese_name"

  def project do
    [
      app: :chinese_name,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:finch, "~> 0.5", only: [:dev, :test]},
      {:floki, "~> 0.32", only: [:dev, :test]},
      {:html5ever, "~> 0.9", only: [:dev, :test]},
      {:xlsx_reader, "~> 0.4", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp docs() do
    [
      main: "readme",
      source_url: @source_url,
      formatter_opts: [gfm: true],
      extras: [
        "README.md"
      ]
    ]
  end

  defp description() do
    "A simple tool built-in dataset for processing Chinese name, to get the surname, the given name, or both from the valid Chinese name input."
  end

  defp package do
    [
      files: ["lib/chinese_name.ex", "lib/generated", "mix.exs", "README.md", "LICENSE.md"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end
end
