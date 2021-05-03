defmodule DailymealWeb.UsersView do
  use DailymealWeb, :view

  alias Dailymeal.User

  def render("user.json", %{user: %User{} = user}), do: user
end
