defmodule BarcampWeb.Schedule.EventController do
  use BarcampWeb, :controller

  alias Barcamp.Schedule
  alias Barcamp.Schedule.Event

  def index(conn, _params) do
    events = Schedule.list_events()
    render(conn, "index.html", events: events)
  end

  def new(conn, _params) do
    changeset = Schedule.change_event(%Event{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"event" => event_params}) do
    case Schedule.create_event(event_params) do
      {:ok, _event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: schedule_event_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Schedule.get_event!(id)
    render(conn, "show.html", event: event)
  end
end
