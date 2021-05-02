defmodule DailymealWeb.ErrorViewTest do
  use DailymealWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(DailymealWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(DailymealWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end

  # test "renders error.json" do
  #   assert render(DailymealWeb.ErrorView, "error.json", %{result: "Error message"}) == %{
  #            error: "Error message"
  #          }
  # end
end
