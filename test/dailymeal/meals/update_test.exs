defmodule Dailymeal.Meals.UpdateTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.{Error, Meal}
  alias Dailymeal.Meals.Update

  describe "call/1" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:meal, id: id)

      {:ok, id: id}
    end

    test "when all params are valid, updates the meal", %{id: id} do
      params = build(:meal_params, %{"id" => id, "descricao" => "Updated description"})

      response = Update.call(params)

      assert {:ok, %Meal{}} = response
    end

    test "when an invalid id is given, returns an error" do
      params =
        build(:meal_params, %{
          "id" => "2baadea4-1d22-4d8c-9455-2ea5d692f932",
          "descricao" => "Updated description"
        })

      response = Update.call(params)

      assert {:error, %Error{}} = response
    end

    test "when invalid params are given, returns an error", %{id: id} do
      params =
        build(:meal_params, %{
          "id" => id,
          "calorias" => "invalid_calories"
        })

      response = Update.call(params)

      assert {:error, %Error{}} = response
    end
  end
end
