defmodule DailymealWeb.MealsControllerTest do
  use DailymealWeb.ConnCase, async: true

  import Dailymeal.Factory

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      params = build(:meal_params)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "calorias" => 1500,
               "data" => "2021-04-28T15:09:40",
               "descricao" => "Description"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = build(:meal_params, %{"calorias" => "invalid_param"})

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"error" => %{"calorias" => ["is invalid"]}}

      assert response == expected_response
    end

    test "when the data is invalid, returns an error", %{conn: conn} do
      params = build(:meal_params, %{"data" => "invalid_param"})

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"error" => "Invalid date format"}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:meal, id: id)

      {:ok, id: id}
    end

    test "when there is a meal with the given id, deletes the meal", %{conn: conn, id: id} do
      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end

    test "when there is no meal with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, "2baadea4-1d22-4d8c-9455-2ea5d692f932"))
        |> json_response(:not_found)

      assert response == %{"error" => "Meal not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end

  describe "show/2" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:meal, id: id)

      {:ok, id: id}
    end

    test "when there is a meal with the given id, returns the meal", %{conn: conn, id: id} do
      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "calorias" => 2000,
               "descricao" => "Meal description",
               "id" => "2baadea4-1d22-4d8c-9455-2ea5d692f931"
             } = response
    end

    test "when there is no meal with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.meals_path(conn, :show, "2baadea4-1d22-4d8c-9455-2ea5d692f932"))
        |> json_response(:not_found)

      assert response == %{"error" => "Meal not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.meals_path(conn, :show, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end

  describe "update/2" do
    setup do
      id = "2baadea4-1d22-4d8c-9455-2ea5d692f931"

      insert(:meal, id: id)

      {:ok, id: id}
    end

    test "when there is a meal with the given id, update the meal", %{conn: conn, id: id} do
      params = %{"calorias" => 2000, "descricao" => "Updated description"}

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:ok)

      assert %{
               "calorias" => 2000,
               "descricao" => "Updated description",
               "id" => "2baadea4-1d22-4d8c-9455-2ea5d692f931"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, id: id} do
      params = %{"calorias" => "invalid_param"}

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:bad_request)

      assert %{"error" => %{"calorias" => ["is invalid"]}} = response
    end

    test "when there is no meal with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> put(Routes.meals_path(conn, :update, "2baadea4-1d22-4d8c-9455-2ea5d692f932"))
        |> json_response(:not_found)

      assert response == %{"error" => "Meal not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> put(Routes.meals_path(conn, :update, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end
end
