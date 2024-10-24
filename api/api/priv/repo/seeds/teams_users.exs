import Ecto.Query

alias Api.Repo
alias Api.Accounts.Team_user

# Team 1
%Team_user{
  id: 1,
  team_id: 1,
  user_id: 3,
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%Team_user{
  id: 2,
  team_id: 1,
  user_id: 9,
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%Team_user{
  id: 3,
  team_id: 1,
  user_id: 10,
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%Team_user{
  id: 4,
  team_id: 1,
  user_id: 11,
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)


# Team 2
%Team_user{
  id: 5,
  team_id: 2,
  user_id: 4,
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%Team_user{
  id: 6,
  team_id: 2,
  user_id: 12,
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%Team_user{
  id: 7,
  team_id: 2,
  user_id: 13,
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%Team_user{
  id: 8,
  team_id: 2,
  user_id: 14,
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)
