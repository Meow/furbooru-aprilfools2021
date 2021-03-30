defmodule PhilomenaWeb.AprilFoolsController do
  use PhilomenaWeb, :controller

  alias Philomena.Badges

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, _) do
    case Badges.create_april_fools_award(conn.assigns.current_user) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Derpibooru <-> Furbooru migration successfully aborted.")
        |> redirect(to: "/")

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "You have already aborted the migration.")
        |> redirect(to: "/")
    end
  end
end
