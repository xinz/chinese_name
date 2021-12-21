defmodule ChineseName.Generated.GivenName do
  @moduledoc false

<%= for surname <- context.surnames do %>
def given_name("<%= surname %>" <> given_name), do: given_name<% end %>
  def given_name(_), do: nil
end
