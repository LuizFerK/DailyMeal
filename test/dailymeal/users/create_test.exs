defmodule Dailymeal.Users.CreateTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.{Error, User}
  alias Dailymeal.Users.Create

  describe "call/1" do
    test "when all params are valid, returns the created user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, name: "John Doe", cpf: "12345678900"}} = response
    end

    test "when there is invalid params, returns an error" do
      params = build(:user_params, %{"cpf" => "invalid_params"})

      response = Create.call(params)

      assert {:error, %Error{}} = response
    end
  end
end
