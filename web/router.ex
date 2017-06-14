defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Discuss.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Discuss do
    pipe_through :browser # Use the default browser stack

    #get "/", TopicController, :index
    #get "/topics/new", TopicController, :new
    #post "/topics", TopicController, :create
    #get "/topics/:id/edit", TopicController, :edit
    #put "/topics/:id", TopicController, :update
    #delete "/topics/:id", TopicController, :delete
    resources "/", TopicController
  end

  scope "/auth", Discuss do
    pipe_through :browser

    get "signout", AuthController, :signout
    get "/:provider", AuthController, :request #defined by ueberauth automatically
    get "/:provider/callback", AuthController, :callback
    # :provider => not only for github but others (facebook, twitter... etc.)
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
