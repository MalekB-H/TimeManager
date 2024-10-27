defmodule Api.Telemetry do
  use Supervisor
  import Telemetry.Metrics

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      {:telemetry_poller, measurements: periodic_measurements(), period: 10_000}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def metrics do
    [
      # Phoenix Metrics
      histogram(
        "phoenix.router_dispatch.stop.duration",
        unit: {:native, :millisecond},
        reporter_options: [buckets: [10, 100, 500, 1_000, 5_000, 10_000]],
        tags: [:route]
      ),

      # Database Metrics
      histogram(
        "api.repo.query.total_time",
        unit: {:native, :millisecond},
        reporter_options: [buckets: [10, 50, 100, 500, 1_000, 5_000]],
        tags: [:source],
        description: "Database query total time"
      ),

      # VM Metrics
      last_value(
        "vm.memory.total",
        unit: {:byte, :byte},
        description: "Total memory"
      ),
      last_value(
        "vm.total_run_queue_lengths.total",
        description: "Total run queue length"
      )
    ]
  end

  defp periodic_measurements do
    [
      {Api.Metrics, :dispatch_metrics, []},
      {Api.Metrics, :memory_metrics, []}
    ]
  end
end