defmodule Dailymeal.Meals.Create do
  alias Dailymeal.{Error, Meal, Repo, User}
  alias Dailymeal.Users.Get, as: UserGet

  def call(%{"data" => data, "user_id" => user_id} = params) do
    with {:ok, data} <- NaiveDateTime.from_iso8601(data),
         {:ok, %User{}} <- UserGet.by_id(user_id) do
      Map.put(params, "data", data)
      |> Meal.changeset()
      |> Repo.insert()
      |> handle_insert()
    else
      {:error, :invalid_format} -> {:error, Error.build(:bad_request, "Invalid date format")}
      error -> error
    end
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
