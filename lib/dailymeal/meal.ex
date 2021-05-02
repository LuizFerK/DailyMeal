defmodule Dailymeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:descricao, :data, :calorias]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "meals" do
    field :descricao, :string
    field :data, :naive_datetime
    field :calorias, :integer

    timestamps()
  end

  def changeset(params), do: changes(%__MODULE__{}, params)

  def changeset(struct, params), do: changes(struct, params)

  defp changes(struct, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
