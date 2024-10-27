defmodule Api.PrometheusEx do
  use Prometheus

  def setup do
    # VM Metrics
    Prometheus.Registry.register_collector(:prometheus_vm_memory_collector)
    Prometheus.Registry.register_collector(:prometheus_vm_system_info_collector)

    # Métriques système
    Prometheus.Metric.Gauge.declare(
      name: :vm_memory_total_bytes,
      help: "Total memory in bytes",
      labels: [:type]
    )

    # Métriques Phoenix
    Prometheus.Metric.Histogram.declare(
      name: :phoenix_router_dispatch_stop_duration_milliseconds,
      help: "Phoenix router dispatch stop duration",
      buckets: [10, 100, 500, 1_000, 5_000, 10_000],
      labels: [:route]
    )

    # Métriques Base de données
    Prometheus.Metric.Histogram.declare(
      name: :api_repo_query_total_time_milliseconds,
      help: "Database query total time",
      buckets: [10, 50, 100, 500, 1_000, 5_000],
      labels: [:query]
    )

    # Métriques Application
    Prometheus.Metric.Counter.declare(
      name: :api_working_times_created_total,
      help: "Total number of working times created",
      labels: [:status]
    )

    Prometheus.Metric.Counter.declare(
      name: :api_logins_total,
      help: "Total number of user logins",
      labels: [:status]
    )

    Prometheus.Metric.Gauge.declare(
      name: :api_users_total,
      help: "Total number of users"
    )

    Prometheus.Metric.Gauge.declare(
      name: :api_active_clockings,
      help: "Number of active clockings"
    )
  end
end