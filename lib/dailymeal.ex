defmodule Dailymeal do
  alias Dailymeal.Meals.Create, as: MealsCreate
  alias Dailymeal.Meals.Delete, as: MealsDelete
  alias Dailymeal.Meals.Get, as: MealsGet
  alias Dailymeal.Meals.Update, as: MealsUpdate

  defdelegate create_meal(params), to: MealsCreate, as: :call
  defdelegate delete_meal(id), to: MealsDelete, as: :call
  defdelegate get_meal_by_id(id), to: MealsGet, as: :by_id
  defdelegate update_meal(params), to: MealsUpdate, as: :call
end
