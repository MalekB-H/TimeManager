import Ecto.Query

alias Api.Repo
alias Api.Accounts.User

# ADMINS
%User{
  id: 1,
  username: "admin1",
  email: "1@admin.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "admin",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 2,
  username: "admin2",
  email: "2@admin.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "admin",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)


# MANAGERS
%User{
  id: 3,
  username: "manager1",
  email: "1@manager.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "manager",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 4,
  username: "manager2",
  email: "2@manager.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "manager",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 5,
  username: "manager3",
  email: "3@manager.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "manager",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)


# EMPLOYEES
%User{
  id: 6,
  username: "employee1",
  email: "1@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 7,
  username: "employee2",
  email: "2@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 8,
  username: "employee3",
  email: "3@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 9,
  username: "employee11",
  email: "11@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 10,
  username: "employee12",
  email: "12@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 11,
  username: "employee13",
  email: "13@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 12,
  username: "employee21",
  email: "21@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 13,
  username: "employee22",
  email: "22@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)

%User{
  id: 14,
  username: "employee23",
  email: "23@employee.com",
  password_hash: Bcrypt.hash_pwd_salt("test1234"),
  role: "employee",
}
|> Repo.insert!(on_conflict: :nothing, conflict_target: :id)
