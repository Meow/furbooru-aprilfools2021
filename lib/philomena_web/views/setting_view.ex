defmodule PhilomenaWeb.SettingView do
  use PhilomenaWeb, :view

  def theme_options(conn) do
    [
      [
        key: "Default",
        value: "default",
        data: [theme_path: Routes.static_path(conn, "/css/dark.css")]
      ],
      [key: "Dark", value: "dark", data: [theme_path: Routes.static_path(conn, "/css/dark.css")]],
      [
        key: "Light",
        value: "light",
        data: [theme_path: Routes.static_path(conn, "/css/light.css")]
      ]
    ]
  end

  def local_tab_class(conn) do
    case conn.assigns.current_user do
      nil -> ""
      _user -> "hidden"
    end
  end

  def staff?(%{role: role}), do: role != "user"
  def staff?(_), do: false
end
