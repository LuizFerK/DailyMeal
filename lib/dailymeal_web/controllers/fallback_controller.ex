defmodule DailymealWeb.FallbackController do
  use DailymealWeb, :controller

  alias Dailymeal.Error
  alias DailymealWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
