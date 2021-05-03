defmodule DailymealWeb.UsersControllerTest do
  use DailymealWeb.ConnCase, async: true

  import Dailymeal.Factory

  describe "create/2" do
    setup do
      insert(:user)

      :ok
    end

    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "cpf" => "12345678900",
               "email" => "jhondoe@example.com",
               "name" => "John Doe"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = build(:user_params, %{"cpf" => 123})

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"error" => %{"cpf" => ["should be 11 character(s)"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:user, id: id)

      {:ok, id: id}
    end

    test "when there is an user with the given id, deletes the user", %{conn: conn, id: id} do
      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end

    test "when there is no user with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.users_path(conn, :delete, "2baadea4-1d22-4d8c-9455-2ea5d692f932"))
        |> json_response(:not_found)

      assert response == %{"error" => "User not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.users_path(conn, :delete, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end

  describe "show/2" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:user, id: id)

      {:ok, id: id}
    end

    test "when there is an user with the given id, returns the meal", %{conn: conn, id: id} do
      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "id" => "2baadea4-1d22-4d8c-9455-2ea5d692f931",
               "cpf" => "12345678901",
               "email" => "johnrick@example.com",
               "name" => "John Rick"
             } = response
    end

    test "when there is no user with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :show, "2baadea4-1d22-4d8c-9455-2ea5d692f932"))
        |> json_response(:not_found)

      assert response == %{"error" => "User not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :show, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end

  describe "update/2" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:user, id: id)

      {:ok, id: id}
    end

    test "when there is a user with the given id, update the user", %{conn: conn, id: id} do
      params = %{"cpf" => "00987654321", "name" => "John Michael"}

      response =
        conn
        |> put(Routes.users_path(conn, :update, id, params))
        |> json_response(:ok)

      assert %{
               "id" => "2baadea4-1d22-4d8c-9455-2ea5d692f931",
               "cpf" => "00987654321",
               "email" => "johnrick@example.com",
               "name" => "John Michael"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, id: id} do
      params = %{"cpf" => 123}

      response =
        conn
        |> put(Routes.users_path(conn, :update, id, params))
        |> json_response(:bad_request)

      assert %{"error" => %{"cpf" => ["should be 11 character(s)"]}} = response
    end

    test "when there is no user with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> put(Routes.users_path(conn, :update, "2baadea4-1d22-4d8c-9455-2ea5d692f932"))
        |> json_response(:not_found)

      assert response == %{"error" => "User not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> put(Routes.users_path(conn, :update, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end

  describe "get_user_meals/2" do
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

    test "when there is a user with the given id, update the user meals", %{conn: conn, id: id} do
      response =
        conn
        |> get(Routes.users_path(conn, :get_user_meals, id))
        |> json_response(:ok)

      assert [
               %{
                 "calorias" => 2000,
                 "descricao" => "Meal description",
                 "id" => "2baadea4-1d22-4d8c-9455-2ea5d692f931",
                 "user_id" => "2baadea4-1d22-4d8c-9455-2ea5d692f930"
               },
               %{
                 "calorias" => 2000,
                 "descricao" => "Meal description",
                 "id" => "2baadea4-1d22-4d8c-9455-2ea5d692f932",
                 "user_id" => "2baadea4-1d22-4d8c-9455-2ea5d692f930"
               }
             ] = response
    end

    test "when there is no user with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :get_user_meals, "2baadea4-1d22-4d8c-9455-2ea5d692f932"))
        |> json_response(:not_found)

      assert response == %{"error" => "User does not exist or have no meals"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :get_user_meals, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end
end
