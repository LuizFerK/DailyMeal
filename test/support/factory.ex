defmodule Dailymeal.Factory do
  use ExMachina.Ecto, repo: Dailymeal.Repo

  alias Dailymeal.{Meal, User}

  def user_params_factory do
    %{
      "name" => "John Doe",
      "cpf" => "12345678900",
      "email" => "jhondoe@example.com"
    }
  end

  def user_factory do
    %User{
      id: "3baadea4-1d22-4d8c-9455-2ea4d692f932",
      name: "John Rick",
      cpf: "12345678901",
      email: "johnrick@example.com",
      inserted_at: NaiveDateTime.local_now(),
      updated_at: NaiveDateTime.local_now()
    }
  end

  def meal_params_factory do
    %{
      "user_id" => "3baadea4-1d22-4d8c-9455-2ea4d692f932",
      "descricao" => "Description",
      "data" => "2021-04-28T15:09:40-03:00",
      "calorias" => 1500
    }
  end

  def meal_factory do
    %Meal{
      id: "2baadea4-1d22-4d8c-9455-2ea5d692f931",
      descricao: "Meal description",
      data: NaiveDateTime.local_now(),
      calorias: 2000,
      user_id: "3baadea4-1d22-4d8c-9455-2ea4d692f932",
      inserted_at: NaiveDateTime.local_now(),
      updated_at: NaiveDateTime.local_now()
    }
  end
end
