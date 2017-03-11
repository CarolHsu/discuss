defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  def new(conn, params) do
    struct = %Discuss.Topic{}
    params = %{}
    changeset = Discuss.Topic.changeset(struct, params)
  end
end
