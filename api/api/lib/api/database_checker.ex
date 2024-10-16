defmodule Api.DatabaseChecker do
  require Logger

  def wait_for_database(attempts \\ 0) do
    max_attempts = 60  

    case Ecto.Adapters.SQL.query(Api.Repo, "SELECT 1") do
      {:ok, _} ->
        Logger.info("Database is ready")
      {:error, _} ->
        if attempts < max_attempts do
          Logger.info("Database not ready. Retrying in 1 second... (Attempt #{attempts + 1}/#{max_attempts})")
          :timer.sleep(1000)
          wait_for_database(attempts + 1)
        else
          Logger.error("Failed to connect to the database after #{max_attempts} attempts")
          System.halt(1)
        end
    end
  end
end