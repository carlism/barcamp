defmodule BarcampWeb.Router do
  use BarcampWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(Phoenix.LiveView.Flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :guardian do
    plug(BarcampWeb.Guardian.Plug)
    plug(BarcampWeb.Guardian.CurrentUserPlug)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BarcampWeb do
    pipe_through([:browser, :guardian])

    get("/", PageController, :index)
  end

  scope "/signup", BarcampWeb.Signup, as: :signup do
    pipe_through([:browser, :guardian])
    resources("/users", UserController, only: [:new, :create])
  end

  scope "/login", BarcampWeb.Auth, as: :auth do
    pipe_through([:browser, :guardian])
    resources("/", UserController, only: [:new, :create])
  end

  scope "/logout", BarcampWeb.Auth do
    pipe_through([:browser, :guardian, :ensure_auth])
    post("/", UserController, :delete)
  end

  scope "/schedule", BarcampWeb.Schedule, as: :schedule do
    pipe_through([:browser, :guardian])
    resources("/events", EventController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", BarcampWeb do
  #   pipe_through :api
  # end
end
