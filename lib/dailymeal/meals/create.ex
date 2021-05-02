defmodule Dailymeal.Meals.Create do
  alias Dailymeal.{Error, Meal, Repo}

  def call(%{"data" => data} = params) do
    NaiveDateTime.from_iso8601(data)
    |> handle_parse(params)
  end

  defp handle_parse({:error, :invalid_format}, _) do
    {:error, Error.build(:bad_request, "Invalid date format")}
  end

  defp handle_parse({:ok, data}, params) do
    Map.put(params, "data", data)
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
