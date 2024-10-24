defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug ApiWeb.AuthPipeline
  end

  # PIpeline pour les routes admins
  pipeline :admin do
    plug :auth
    plug ApiWeb.RoleAuth, ["admin"]
  end

  # Pipeline pour les routes manager
  pipeline :manager do
    plug :auth
    plug ApiWeb.RoleAuth, ["admin", "manager"]
  end

  # Pipeleine pour les routes employées
  pipeline :employee do
    plug :auth
    plug ApiWeb.RoleAuth, ["admin", "manager", "employee"]
  end

  # Routes publiques
  scope "/api", ApiWeb do
    pipe_through :api

    post "/register", AuthController, :register
    post "/login", AuthController, :login
  end

  # Routes pour les employés
  scope "/api", ApiWeb do
    pipe_through [:api, :employee]

    get "/clockings/:userID", ClockingController, :list_user_clockings
    put "/clockings/:userID/:id", ClockingController, :end_clocking
    post "/clockings/:userID", ClockingController, :create_clocking
  end

  # Routes pour les managers
  scope "/api", ApiWeb do
    pipe_through [:api, :manager]

    resources "/working_times", WorkingTimeController, except: [:new, :edit]
    get "/working_times/user/:userID", WorkingTimeController, :list_user_working_times
    get "/working_times/:userID/:id", WorkingTimeController, :show_user_working_time
    post "/working_times/:userID", WorkingTimeController, :create
  end

  # Routes pour les admins
  scope "/api", ApiWeb do
    pipe_through [:api, :admin]

    resources "/users", UserController, except: [:new, :edit]    
  end
end