defmodule ChineseName.MixProject do
  use Mix.Project

  def project do
    [
      app: :chinese_name,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
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
      {:xlsx_reader, "~> 0.4", only: [:dev, :test]}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

end
