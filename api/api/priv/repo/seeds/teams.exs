import Ecto.Query

alias Api.Repo
alias Api.Accounts.Team

%Team{
  id: 1,
  manager_id: 3
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%Team{
  id: 2,
  manager_id: 4
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)
