defmodule Pokelixir.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_start_type, _start_args) do
    children = [
      {Finch, [name: Pokelixir.Finch]}
    ]
    opts = [strategy: :one_for_one, name: Pokelixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
