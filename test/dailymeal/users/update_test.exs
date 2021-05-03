defmodule Dailymeal.Users.UpdateTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.{Error, User}
  alias Dailymeal.Users.Update

  describe "call/1" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:user, id: id)

      {:ok, id: id}
    end

    test "when all params are valid, updates the user", %{id: id} do
      params = build(:user_params, %{"id" => id, "name" => "John Mike"})

      response = Update.call(params)

      assert {:ok, %User{name: "John Mike"}} = response
    end

    test "when an invalid id is given, returns an error" do
      params =
        build(:user_params, %{
          "id" => "2baadea4-1d22-4d8c-9455-2ea5d692f932",
          "cpf" => 123
        })

      response = Update.call(params)

      assert {:error, %Error{}} = response
    end

    test "when invalid params are given, returns an error", %{id: id} do
      params =
        build(:user_params, %{
          "id" => id,
          "cpf" => 123
        })

      response = Update.call(params)

      assert {:error, %Error{}} = response
    end
  end
end
