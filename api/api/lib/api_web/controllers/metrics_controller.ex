defmodule ApiWeb.MetricsController do
  use ApiWeb, :controller
  
  def index(conn, _params) do
    # Mettre à jour quelques métriques avant de les exposer
    update_metrics()
    
    metrics = Prometheus.Format.Text.format(:default)
    
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, metrics)
  end

  defp update_metrics do
    # Exemple de mise à jour des métriques
    try do
      # Compter les utilisateurs
      users_count = Api.Repo.aggregate(Api.User, :count)
      Prometheus.Metric.Gauge.set([name: :api_users_total], users_count)

      # Compter les pointages actifs
      active_clockings = Api.Repo.aggregate(Api.Clocking, :count, :id)
      Prometheus.Metric.Gauge.set([name: :api_active_clockings], active_clockings)
    rescue
      _ -> :error
    end
  end
end