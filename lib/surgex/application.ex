defmodule Surgex.Application do
  @moduledoc """
  Main Surgex OTP application that calls patches configured for running and hibernates itself.
  """

  use Application
  use GenServer

  alias Surgex.Sentry

  @doc false
  def start(_type, _args) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    Sentry.apply_patch()

    {:ok, nil, :hibernate}
  end
end
