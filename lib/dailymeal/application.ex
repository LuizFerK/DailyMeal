defmodule Dailymeal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Dailymeal.Repo,
      # Start the Telemetry supervisor
      DailymealWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Dailymeal.PubSub},
      # Start the Endpoint (http/https)
      DailymealWeb.Endpoint
      # Start a worker by calling: Dailymeal.Worker.start_link(arg)
      # {Dailymeal.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dailymeal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    # coveralls-ignore-start
    DailymealWeb.Endpoint.config_change(changed, removed)
    # coveralls-ignore-stop
    :ok
  end
end
