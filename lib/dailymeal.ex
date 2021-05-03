defmodule Dailymeal do
  alias Dailymeal.Users.Create, as: UserCreate
  alias Dailymeal.Users.Delete, as: UserDelete
  alias Dailymeal.Users.Get, as: UserGet
  alias Dailymeal.Users.Update, as: UserUpdate

  alias Dailymeal.Meals.Create, as: MealCreate
  alias Dailymeal.Meals.Delete, as: MealDelete
  alias Dailymeal.Meals.Get, as: MealGet
  alias Dailymeal.Meals.Update, as: MealUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate delete_meal(id), to: MealDelete, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate update_meal(params), to: MealUpdate, as: :call
end
