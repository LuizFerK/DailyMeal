defmodule Dailymeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  alias Dailymeal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:descricao, :data, :calorias, :user_id]

  @derive {Jason.Encoder, only: [:id] ++ @required_params}

  schema "meals" do
    field :descricao, :string
    field :data, :naive_datetime
    field :calorias, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
