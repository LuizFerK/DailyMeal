defmodule Dailymeal.MealTest do
  use Dailymeal.DataCase, async: true
  import Dailymeal.Factory

  alias Dailymeal.Meal
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, return a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{changes: %{calorias: 1500}, valid?: true} = response
    end

    test "when there is invalid params, return an invalid changeset" do
      params = %{"invalid_param" => "test_param"}

      %Changeset{errors: errors, valid?: valid?} = Meal.changeset(params)

      expected_response = %{
        errors: [
          descricao: {"can't be blank", [validation: :required]},
          data: {"can't be blank", [validation: :required]},
          calorias: {"can't be blank", [validation: :required]}
        ],
        valid?: false
      }

      assert expected_response == %{errors: errors, valid?: valid?}
    end
  end

  describe "changeset/2" do
    test "when all params are valid, return a valid updated changeset" do
      meal = build(:meal)

      params = build(:meal_params)

      response = Meal.changeset(meal, params)

      assert %Changeset{changes: %{calorias: 1500}, valid?: true} = response
    end

    test "when there is invalid params, return an invalid updated changeset" do
      meal = build(:meal)

      params = %{"calorias" => "invalid_param"}

      %Changeset{errors: errors, valid?: valid?} = Meal.changeset(meal, params)

      expected_response = %{
        errors: [calorias: {"is invalid", [type: :integer, validation: :cast]}],
        valid?: false
      }

      assert expected_response == %{errors: errors, valid?: valid?}
    end
  end
end
