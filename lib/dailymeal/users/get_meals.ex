defmodule Dailymeal.Users.GetMeals do
  import Ecto.Query

  alias Dailymeal.{Error, Meal, Repo}

  def by_id(id) do
    query = from meal in Meal, where: meal.user_id in ^[id]

    query
    |> Repo.all()
    |> handle_get()
  end

  defp handle_get([]) do
    {:error, Error.build(:not_found, "User does not exist or have no meals")}
  end

  defp handle_get([%Meal{} | _] = user_meals), do: {:ok, user_meals}
end
