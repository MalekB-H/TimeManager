defmodule Api.Metrics do
  def dispatch_metrics do
    # Mettre à jour le nombre total d'utilisateurs
    users_count = Api.Repo.aggregate(Api.User, :count)
    Prometheus.Metric.Gauge.set([name: :api_users_total], users_count)

    # Mettre à jour le nombre de pointages actifs
    active_clockings = Api.Repo.aggregate(Api.Clocking, :count, :id)
    Prometheus.Metric.Gauge.set([name: :api_active_clockings], active_clockings)
  end

  def memory_metrics do
    memory = :erlang.memory()
    
    # Mettre à jour les métriques de mémoire
    Prometheus.Metric.Gauge.set(
      [name: :vm_memory_total_bytes, labels: [:total]], 
      memory[:total]
    )
    
    Prometheus.Metric.Gauge.set(
      [name: :vm_memory_total_bytes, labels: [:processes]], 
      memory[:processes]
    )
  end

  # Fonction utilitaire pour enregistrer les durées des requêtes
  def record_db_query_time(time_native, query) do
    time_ms = System.convert_time_unit(time_native, :native, :millisecond)
    
    Prometheus.Metric.Histogram.observe(
      [name: :api_repo_query_total_time_milliseconds, labels: [query]],
      time_ms
    )
  end

  # Fonction utilitaire pour enregistrer les durées des requêtes Phoenix
  def record_phoenix_dispatch_time(time_native, route) do
    time_ms = System.convert_time_unit(time_native, :native, :millisecond)
    
    Prometheus.Metric.Histogram.observe(
      [name: :phoenix_router_dispatch_stop_duration_milliseconds, labels: [route]],
      time_ms
    )
  end
end