defmodule Dailymeal.UserTest do
  use Dailymeal.DataCase, async: true

  import Dailymeal.Factory

  alias Dailymeal.User
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when all params are valid, return a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "John Doe"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid chageset with the given changes" do
      params = build(:user_params)

      update_params = %{
        name: "Another John",
        email: "anotherjohn@example.com"
      }

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{
               changes: %{name: "Another John", email: "anotherjohn@example.com"},
               valid?: true
             } = response
    end

    test "when there is some error, returns an invalid changeset" do
      params = build(:user_params, %{"email" => "invalid_email", "cpf" => 123})

      response = User.changeset(params)

      expected_response = %{email: ["has invalid format"], cpf: ["is invalid"]}

      assert errors_on(response) == expected_response
    end

    test "when updating a changeset, if there is some error, returns an invalid changeset" do
      params = build(:user_params)

      update_params = build(:user_params, %{"email" => "invalid_email", "cpf" => 123})

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      expected_response = %{email: ["has invalid format"], cpf: ["is invalid"]}

      assert errors_on(response) == expected_response
    end
  end
end
