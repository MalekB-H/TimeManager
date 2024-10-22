defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug ApiWeb.AuthPipeline
  end

  scope "/api", ApiWeb do
    pipe_through :api

    post "/register", AuthController, :register
    post "/login", AuthController, :login
  end

  scope "/api", ApiWeb do
    pipe_through [:api, :auth]

    resources "/users", UserController, except: [:new, :edit]

    post "/working_times/:userID", WorkingTimeController, :create
    get "/working_times/:userID/:id", WorkingTimeController, :show_user_working_time
    get "/working_times/:userID", WorkingTimeController, :list_user_working_times
    resources "/working_times", WorkingTimeController, except: [:new, :edit]

    post "/clockings/:userID", ClockingController, :start_clocking
    put "/clockings/:userID/:id", ClockingController, :end_clocking
    get "/clockings/:userID", ClockingController, :list_user_clockings
    resources "/clockings", ClockingController, except: [:new, :edit]
  end
end
