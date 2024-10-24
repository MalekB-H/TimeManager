defmodule Api.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  @doc """
  Retourne la liste des utilisateurs correspondant aux critères de recherches

  """
  def search_users(criteria) do
    query = from(u in User)

    Enum.reduce(criteria, query, fn
      {:email, email}, query ->
        from q in query, where: ilike(q.email, ^"%#{email}%")
      {:username, username}, query ->
        from q in query, where: ilike(q.username, ^"%#{username}%")
      _, query ->
        query
    end)
    |> Repo.all()
  end

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def authenticate_user(email, password) do
    user = get_user_by_email(email)
    case user do
      nil -> {:error, :unauthorized}
      _ ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          {:ok, user}
        else
          {:error, :unauthorized}
        end
    end
  end

  alias Api.Accounts.WorkingTime

  @doc """
  Returns the list of working_times.

  ## Examples

      iex> list_working_times()
      [%WorkingTime{}, ...]

  """
  def list_working_times do
    Repo.all(WorkingTime)
  end

  @doc """
  Gets a single working_time.

  Raises `Ecto.NoResultsError` if the Working time does not exist.

  ## Examples

      iex> get_working_time!(123)
      %WorkingTime{}

      iex> get_working_time!(456)
      ** (Ecto.NoResultsError)

  """
  def get_working_time!(id), do: Repo.get!(WorkingTime, id)

  @doc """
  Creates a working_time.

  ## Examples

      iex> create_working_time(%{field: value})
      {:ok, %WorkingTime{}}

      iex> create_working_time(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_working_time(attrs \\ %{}) do
    %WorkingTime{}
    |> WorkingTime.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a working_time.

  ## Examples

      iex> update_working_time(working_time, %{field: new_value})
      {:ok, %WorkingTime{}}

      iex> update_working_time(working_time, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_working_time(%WorkingTime{} = working_time, attrs) do
    working_time
    |> WorkingTime.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a working_time.

  ## Examples

      iex> delete_working_time(working_time)
      {:ok, %WorkingTime{}}

      iex> delete_working_time(working_time)
      {:error, %Ecto.Changeset{}}

  """
  def delete_working_time(%WorkingTime{} = working_time) do
    Repo.delete(working_time)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking working_time changes.

  ## Examples

      iex> change_working_time(working_time)
      %Ecto.Changeset{data: %WorkingTime{}}

  """
  def change_working_time(%WorkingTime{} = working_time, attrs \\ %{}) do
    WorkingTime.changeset(working_time, attrs)
  end

  @doc """
  Gets a single user.

  Returns nil if the User does not exist.

  ## Examples

      iex> get_user(123)
      %User{}

      iex> get_user(456)
      nil

  """
  def get_user(id), do: Repo.get(User, id)

  @doc """
  Obtenir le temps de travail pour un certain utilisateur
  """
  def get_user_working_time(user_id, id) do
    WorkingTime
    |> Repo.get_by(id: id, user_id: user_id)
  end

  @doc """
  Liste des temps de travail pour un utilisateur
  """
  def list_user_working_times(user_id, start_time, end_time) do
    query = from w in WorkingTime,
            where: w.user_id == ^user_id

    query = if start_time, do: from(w in query, where: w.start_time >= ^start_time), else: query
    query = if end_time, do: from(w in query, where: w.end_time <= ^end_time), else: query

    Repo.all(query)
  end

  alias Api.Accounts.Clocking

  @doc """
  Returns the list of clockings.

  ## Examples

      iex> list_clockings()
      [%Clocking{}, ...]

  """
  def list_clockings do
    Repo.all(Clocking)
  end

  @doc """
  Gets a single clocking.

  Raises `Ecto.NoResultsError` if the Clocking does not exist.

  ## Examples

      iex> get_clocking!(123)
      %Clocking{}

      iex> get_clocking!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clocking!(id), do: Repo.get!(Clocking, id)

  @doc """
  Creates a clocking.

  ## Examples

      iex> create_clocking(%{field: value})
      {:ok, %Clocking{}}

      iex> create_clocking(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clocking(attrs \\ %{}) do
    %Clocking{}
    |> Clocking.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clocking.

  ## Examples

      iex> update_clocking(clocking, %{field: new_value})
      {:ok, %Clocking{}}

      iex> update_clocking(clocking, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clocking(%Clocking{} = clocking, attrs) do
    clocking
    |> Clocking.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clocking.

  ## Examples

      iex> delete_clocking(clocking)
      {:ok, %Clocking{}}

      iex> delete_clocking(clocking)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clocking(%Clocking{} = clocking) do
    Repo.delete(clocking)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clocking changes.

  ## Examples

      iex> change_clocking(clocking)
      %Ecto.Changeset{data: %Clocking{}}

  """
  def change_clocking(%Clocking{} = clocking, attrs \\ %{}) do
    Clocking.changeset(clocking, attrs)
  end

  @doc """
  Retourne la liste des horloges d'un utilisateur spécifique

  ## Examples

      iex> list_user_clockings(123)
      [%Clocking{}, ...]

  """
  def list_user_clockings(user_id) do
    Clocking
    |> where([c], c.user_id == ^user_id)
    |> order_by([c], desc: c.inserted_at)
    |> Repo.all()
  end

  alias Api.Accounts.Team

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams do
    Repo.all(Team)
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{data: %Team{}}

  """
  def change_team(%Team{} = team, attrs \\ %{}) do
    Team.changeset(team, attrs)
  end

  alias Api.Accounts.Team_user

  @doc """
  Returns the list of teams_users.

  ## Examples

      iex> list_teams_users()
      [%Team_user{}, ...]

  """
  def list_teams_users do
    Repo.all(Team_user)
  end

  @doc """
  Gets a single team_user.

  Raises `Ecto.NoResultsError` if the Team user does not exist.

  ## Examples

      iex> get_team_user!(123)
      %Team_user{}

      iex> get_team_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team_user!(id), do: Repo.get!(Team_user, id)

  @doc """
  Creates a team_user.

  ## Examples

      iex> create_team_user(%{field: value})
      {:ok, %Team_user{}}

      iex> create_team_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team_user(attrs \\ %{}) do
    %Team_user{}
    |> Team_user.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team_user.

  ## Examples

      iex> update_team_user(team_user, %{field: new_value})
      {:ok, %Team_user{}}

      iex> update_team_user(team_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team_user(%Team_user{} = team_user, attrs) do
    team_user
    |> Team_user.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a team_user.

  ## Examples

      iex> delete_team_user(team_user)
      {:ok, %Team_user{}}

      iex> delete_team_user(team_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team_user(%Team_user{} = team_user) do
    Repo.delete(team_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team_user changes.

  ## Examples

      iex> change_team_user(team_user)
      %Ecto.Changeset{data: %Team_user{}}

  """
  def change_team_user(%Team_user{} = team_user, attrs \\ %{}) do
    Team_user.changeset(team_user, attrs)
  end
end
