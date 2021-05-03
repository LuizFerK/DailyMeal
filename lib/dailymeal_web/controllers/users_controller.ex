defmodule DailymealWeb.UsersController do
  use DailymealWeb, :controller

  alias Dailymeal.User
  alias DailymealWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Dailymeal.create_user(params) do
      conn
      |> put_status(:created)
      |> render("user.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Dailymeal.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Dailymeal.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Dailymeal.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def get_user_meals(conn, %{"id" => id}) do
    with {:ok, user_meals} <- Dailymeal.get_user_meals(id) do
      conn
      |> put_status(:ok)
      |> render("user_meals.json", user_meals: user_meals)
    end
  end
end
