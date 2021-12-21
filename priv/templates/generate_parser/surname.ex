defmodule ChineseName.Generated.Surname do
  @moduledoc false

<%= for surname <- context.surnames do %>
def surname("<%= surname %>" <> _given_name), do: <%= inspect surname %><% end %>
  def surname(_), do: nil
end
