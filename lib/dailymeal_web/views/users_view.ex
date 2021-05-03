defmodule DailymealWeb.UsersView do
  use DailymealWeb, :view

  alias Dailymeal.{Meal, User}

  def render("user.json", %{user: %User{} = user}), do: user

  def render("user_meals.json", %{user_meals: [%Meal{} | _] = user_meals}), do: user_meals
end
