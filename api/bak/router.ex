defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

 scope "/api", ApiWeb do
  pipe_through :api

  get "/users", UserController, :index
  get "/users/:id", UserController, :show
  post "/users", UserController, :create
  put "/users/:id", UserController, :update
  delete "/users/:id", UserController, :delete

  get "/workingtime/:user_id", WorkingTimeController, :index
  get "/workingtime/:user_id/:id", WorkingTimeController, :show
  post "/workingtime/:user_id", WorkingTimeController, :create
  put "/workingtime/:id", WorkingTimeController, :update
  delete "/workingtime/:id", WorkingTimeController, :delete

  get "/clocks/:user_id", ClockingController, :index
  post "/clocks/:user_id", ClockingController, :create
  end
end