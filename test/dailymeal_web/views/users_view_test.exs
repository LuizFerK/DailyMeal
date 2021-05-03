defmodule DailymealWeb.UsersViewTest do
  use DailymealWeb.ConnCase, async: true

  import Phoenix.View
  import Dailymeal.Factory

  alias Dailymeal.{Meal, User}
  alias DailymealWeb.UsersView

  test "renders user.json" do
    user = build(:user)

    response = render(UsersView, "user.json", user: user)

    assert %User{
             cpf: "12345678901",
             email: "johnrick@example.com",
             name: "John Rick"
           } = response
  end

  test "renders user_meals.json" do
    meal = build(:meal)

    user_meals = List.duplicate(meal, 2)

    response = render(UsersView, "user_meals.json", user_meals: user_meals)

    assert length(response) == 2

    assert [%Meal{} | _] = response
  end
end
