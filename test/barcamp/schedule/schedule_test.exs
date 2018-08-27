defmodule Barcamp.ScheduleTest do
  use Barcamp.DataCase

  alias Barcamp.Schedule

  describe "events" do
    alias Barcamp.Schedule.Event

    @valid_attrs %{description: "some description", image_url: "some image_url", name: "some name", site_url: "some site_url"}
    @update_attrs %{description: "some updated description", image_url: "some updated image_url", name: "some updated name", site_url: "some updated site_url"}
    @invalid_attrs %{description: nil, image_url: nil, name: nil, site_url: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Schedule.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Schedule.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Schedule.create_event(@valid_attrs)
      assert event.description == "some description"
      assert event.image_url == "some image_url"
      assert event.name == "some name"
      assert event.site_url == "some site_url"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, event} = Schedule.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.description == "some updated description"
      assert event.image_url == "some updated image_url"
      assert event.name == "some updated name"
      assert event.site_url == "some updated site_url"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_event(event, @invalid_attrs)
      assert event == Schedule.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Schedule.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Schedule.change_event(event)
    end
  end
end
