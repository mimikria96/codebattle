defmodule CodebattleWeb.PageController do
  use CodebattleWeb, :controller

  alias Codebattle.{Repo, Game}
  alias Ecto.Query

  def index(conn, _params) do
    current_user = conn.assigns.current_user

    case current_user.guest do
      true ->
        render(conn, "landing.html", current_user: current_user)

      false ->
        render(conn, "index.html", current_user: current_user)
    end
  end
end
