defmodule Dailymeal.Meals.CreateTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.{Error, Meal}
  alias Dailymeal.Meals.Create

  describe "call/1" do
    setup do
      insert(:user)

      :ok
    end

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

    test "when there is no user with the given user_id, returns an error" do
      params = build(:meal_params, %{"user_id" => "2baadea4-1d22-4d8c-9455-2ea5d692f931"})

      response = Create.call(params)

      assert {:error, %Error{}} = response
    end
  end
end
