defmodule Sudamerik.Router do
  use Sudamerik.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Sudamerik do
    pipe_through :browser # Use the default browser stack

    resources "/products", ProductController
    resources "/requests", RequestController

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Sudamerik do
  #   pipe_through :api
  # end
end
