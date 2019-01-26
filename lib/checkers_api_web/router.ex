defmodule CheckersApiWeb.Router do
  use CheckersApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CheckersApiWeb do
    pipe_through :api
  end
end
