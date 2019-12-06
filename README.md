# Barcamp  

[![Build Status](https://travis-ci.org/carlism/barcamp.svg?branch=master)](https://travis-ci.org/carlism/barcamp)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Commands

```
mix phx.gen.html Auth User users email:string password:string --web Auth
mix ecto.migrate
mix phx.gen.html Signup User users email:string:unique password:string --web Signup
mix ecto.migrate
gigalixir config:set -a puny-scaly-ox GUARDIAN_KEY=`mix phx.gen.secret`
gigalixir ps:migrate -a puny-scaly-ox
gigalixir ps:remote_console -a puny-scaly-ox
git push gigalixir master
mix phx.gen.html Schedule Event events name:string site_url:string image_url:string description:string --web Schedule
mix phx.gen.schema Schedule.EventDate event_dates event_id:references:events event_date:utc_datetime

mix phx.gen.schema Schedule.Room rooms event_date_id:references:event_dates name:string location:string capacity:integer display_position:integer

mix phx.gen.schema Schedule.TimeSlot time_slots event_date_id:references:event_dates start_time:utc_datetime duration:integer

mix phx.gen.schema Schedule.Presentation presentations room_id:references:rooms time_slot_id:references:time_slots title:string presenter:string contact:string description:text format:string


```
