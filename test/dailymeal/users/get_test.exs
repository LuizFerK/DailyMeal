defmodule Dailymeal.Users.GetTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.{Error, User}
  alias Dailymeal.Users.Get

  describe "by_id/1" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:user, id: id)

      {:ok, id: id}
    end

    test "when a valid id is given, returns the user", %{id: id} do
      response = Get.by_id(id)

      assert {:ok, %User{}} = response
    end

    test "when an invalid id is given, returns an error" do
      response = Get.by_id("2baadea4-1d22-4d8c-9455-2ea5d692f932")

      assert {:error, %Error{result: "User not found", status: :not_found}} = response
    end
  end
end
