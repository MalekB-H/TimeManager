import Ecto.Query

alias Api.Repo
alias Api.Accounts.User

%User{
  username: "admin1",
  email: "admin1@admin.com",
  password_hash: Bcrypt.hash_pwd_salt("admintest"),
  role: "admin",
}
|> Repo.insert()
