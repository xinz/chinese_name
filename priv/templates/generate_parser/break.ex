defmodule ChineseName.Generated.Break do
  @moduledoc false

<%= for surname <- context.surnames do %>
def split("<%= surname %>" <> given_name), do: {<%= inspect surname %>, given_name}<% end %>
  def split(name), do: name
end
