defmodule Dailymeal.Users.GetMealsTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.{Error, Meal}
  alias Dailymeal.Users.GetMeals, as: UserGetMeals

  describe "by_id/1" do
    setup do
      user1_id = "2baadea4-1d22-4d8c-9455-2ea5d692f930"
      user2_id = "2baadea4-1d22-4d8c-9455-2ea5d692f940"

      insert(:user, id: user1_id)
      insert(:user, id: user2_id, cpf: "12345678800", email: "test@example.com")
      insert(:meal, id: "2baadea4-1d22-4d8c-9455-2ea5d692f931", user_id: user1_id)
      insert(:meal, id: "2baadea4-1d22-4d8c-9455-2ea5d692f932", user_id: user1_id)
      insert(:meal, id: "2baadea4-1d22-4d8c-9455-2ea5d692f933", user_id: user2_id)

      {:ok, id: user1_id}
    end

    test "when a valid id is given, returns the user meals", %{id: id} do
      response = UserGetMeals.by_id(id)

      assert {:ok, [%Meal{} | _]} = response
    end

    test "when an invalid id is given, returns an error" do
      response = UserGetMeals.by_id("2baadea4-1d22-4d8c-9455-2ea5d692f932")

      assert {:error, %Error{result: "User does not exist or have no meals", status: :not_found}} =
               response
    end
  end
end
