defmodule Sudamerik.PageController do
  use Sudamerik.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
