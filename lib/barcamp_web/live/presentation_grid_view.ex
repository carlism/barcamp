defmodule BarcampWeb.PresentationGridView do
  use Phoenix.LiveView
  use Phoenix.HTML

  import Calendar.Strftime

  def render(assigns) do
    ~L"""
    <div><%= strftime!(@date, "%m-%d-%y %r") %></div>
    <div><%= strftime!(@event_date.event_date, "%m-%d-%y %r") %></div>
    """
  end

  def mount(session, socket) do
    :timer.send_interval(1000, self(), {:tick, session})
    {:ok, assign(socket, date: :calendar.local_time(), event_date: session[:event_date])}
  end

  def handle_info({:tick, session}, socket) do
    {:noreply, assign(socket, date: :calendar.local_time(), event_date: session[:event_date])}
  end
end
