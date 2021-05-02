defmodule Dailymeal.Factory do
  use ExMachina.Ecto, repo: Dailymeal.Repo

  alias Dailymeal.Meal

  def meal_params_factory do
    %{
      "descricao" => "Description",
      "data" => "2021-04-28T15:09:40-03:00",
      "calorias" => 1500
    }
  end

  def meal_factory do
    %Meal{
      descricao: "Meal description",
      data: NaiveDateTime.local_now(),
      calorias: 2000,
      id: "2baadea4-1d22-4d8c-9455-2ea5d692f931",
      inserted_at: NaiveDateTime.local_now(),
      updated_at: NaiveDateTime.local_now()
    }
  end
end
