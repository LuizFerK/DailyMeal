defmodule Dailymeal.Meals.CreateTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.{Error, Meal}
  alias Dailymeal.Meals.Create

  describe "call/1" do
    test "when all params are valid, returns the created meal" do
      params = build(:meal_params)

      response = Create.call(params)

      assert {:ok, %Meal{id: _id, descricao: "Description", calorias: 1500}} = response
    end

    test "when there is invalid params, returns an error" do
      params = build(:meal_params, %{"calorias" => "invalid_params"})

      response = Create.call(params)

      assert {:error, %Error{}} = response
    end
  end
end
