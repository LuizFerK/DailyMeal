defmodule DailymealWeb.MealsView do
  use DailymealWeb, :view

  alias Dailymeal.Meal

  def render("meal.json", %{meal: %Meal{} = meal}), do: meal
end
