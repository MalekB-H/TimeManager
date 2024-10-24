# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api.Repo.insert!(%Api.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Code.require_file("seeds/users.exs", __DIR__)
Code.require_file("seeds/working_times.exs", __DIR__)
Code.require_file("seeds/clockings.exs", __DIR__)
Code.require_file("seeds/teams.exs", __DIR__)
Code.require_file("seeds/teams_users.exs", __DIR__)
