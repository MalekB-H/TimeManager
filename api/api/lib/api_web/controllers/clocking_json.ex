defmodule ApiWeb.ClockingJSON do
  alias Api.Accounts.Clocking

  @doc """
  Renders a list of clockings.
  """
  def index(%{clockings: clockings}) do
    %{data: for(clocking <- clockings, do: data(clocking))}
  end

  @doc """
  Renders a single clocking.
  """
  def show(%{clocking: clocking}) do
    %{data: data(clocking)}
  end

  defp data(%Clocking{} = clocking) do
    %{
      id: clocking.id,
      clock_in: clocking.clock_in,
      clock_out: clocking.clock_out,
      user_id: clocking.user_id
    }
  end
end
