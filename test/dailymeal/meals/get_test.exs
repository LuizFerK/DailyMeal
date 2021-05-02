defmodule Dailymeal.Meals.GetTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.{Error, Meal}
  alias Dailymeal.Meals.Get

  describe "by_id/1" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:meal, id: id)

      {:ok, id: id}
    end

    test "when a valid id is given, returns the meal", %{id: id} do
      response = Get.by_id(id)

      assert {:ok, %Meal{}} = response
    end

    test "when an invalid id is given, returns an error" do
      response = Get.by_id("2baadea4-1d22-4d8c-9455-2ea5d692f932")

      assert {:error, %Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
