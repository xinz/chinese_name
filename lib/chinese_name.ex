defmodule ChineseName do
  @moduledoc """
  TODO
  """

  defdelegate surname(name), to: __MODULE__.Generated.Surname

  defdelegate given_name(name), to: __MODULE__.Generated.GivenName

  defdelegate split(name), to: __MODULE__.Generated.Break
end
