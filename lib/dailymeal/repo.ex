defmodule Dailymeal.Repo do
  use Ecto.Repo,
    otp_app: :dailymeal,
    adapter: Ecto.Adapters.Postgres
end
