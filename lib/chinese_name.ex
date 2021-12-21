defmodule ChineseName do
  @moduledoc """
  Get the surname, the given name, or both from the valid Chinese name input.
  """

  @doc ~S"""
  Get the surname of the valid Chinese name input, return `nil` if not found any matched.

  ## Examples

      iex> ChineseName.surname("李四")
      "李"
      iex> ChineseName.surname("欧阳修")
      "欧阳"
      iex> ChineseName.surname("测试")
      nil

  """
  @spec surname(String.t()) :: String.t() | nil
  defdelegate surname(name), to: __MODULE__.Generated.Surname

  @doc ~S"""
  Get the given name of the valid Chinese name input, return `nil` if not found any matched.

  ## Examples

      iex> ChineseName.given_name("李四")
      "四"
      iex> ChineseName.given_name("欧阳修")
      "修"
      iex> ChineseName.given_name("测试")
      nil

  """
  @spec given_name(String.t()) :: String.t() | nil
  defdelegate given_name(name), to: __MODULE__.Generated.GivenName

  @doc ~S"""
  Split the valid Chinese name input into a tuple contains the surname and the given name,
  return the original input string if not found any matched.

  ## Examples

      iex> ChineseName.split("李四")
      {"李", "四"}
      iex> ChineseName.split("欧阳修")
      {"欧阳", "修"}
      iex> ChineseName.split("测试")
      "测试"

  """
  @spec split(String.t()) :: String.t() | {String.t(), String.t()}
  defdelegate split(name), to: __MODULE__.Generated.Break
end
