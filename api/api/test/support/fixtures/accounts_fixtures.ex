defmodule Api.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password_hash: "some password_hash",
        username: "some username"
      })
      |> Api.Accounts.create_user()

    user
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-07 14:44:00Z],
        start_time: ~U[2024-10-07 14:44:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-07 14:44:00Z],
        clock_out: ~U[2024-10-07 14:44:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 09:23:00Z],
        start_time: ~U[2024-10-08 09:23:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-08 09:23:00Z],
        clock_out: ~U[2024-10-08 09:23:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 09:44:00Z],
        start_time: ~U[2024-10-08 09:44:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-08 09:44:00Z],
        clock_out: ~U[2024-10-08 09:44:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 09:51:00Z],
        start_time: ~U[2024-10-08 09:51:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-08 09:51:00Z],
        clock_out: ~U[2024-10-08 09:51:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 10:00:00Z],
        start_time: ~U[2024-10-08 10:00:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 10:01:00Z],
        start_time: ~U[2024-10-08 10:01:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-08 10:01:00Z],
        clock_out: ~U[2024-10-08 10:01:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 10:03:00Z],
        start_time: ~U[2024-10-08 10:03:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-08 10:03:00Z],
        clock_out: ~U[2024-10-08 10:03:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 10:06:00Z],
        start_time: ~U[2024-10-08 10:06:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-08 10:06:00Z],
        clock_out: ~U[2024-10-08 10:06:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 10:08:00Z],
        start_time: ~U[2024-10-08 10:08:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-08 10:08:00Z],
        clock_out: ~U[2024-10-08 10:08:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-08 13:34:00Z],
        start_time: ~U[2024-10-08 13:34:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-08 13:34:00Z],
        clock_out: ~U[2024-10-08 13:34:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 08:10:00Z],
        start_time: ~U[2024-10-09 08:10:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 08:10:00Z],
        clock_out: ~U[2024-10-09 08:10:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 08:23:00Z],
        start_time: ~U[2024-10-09 08:23:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 08:23:00Z],
        clock_out: ~U[2024-10-09 08:23:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 08:34:00Z],
        start_time: ~U[2024-10-09 08:34:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 08:34:00Z],
        clock_out: ~U[2024-10-09 08:34:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 08:37:00Z],
        start_time: ~U[2024-10-09 08:37:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 08:37:00Z],
        clock_out: ~U[2024-10-09 08:37:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 09:04:00Z],
        start_time: ~U[2024-10-09 09:04:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 09:04:00Z],
        clock_out: ~U[2024-10-09 09:04:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 09:07:00Z],
        start_time: ~U[2024-10-09 09:07:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 09:07:00Z],
        clock_out: ~U[2024-10-09 09:07:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 09:08:00Z],
        start_time: ~U[2024-10-09 09:08:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 09:08:00Z],
        clock_out: ~U[2024-10-09 09:08:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 09:09:00Z],
        start_time: ~U[2024-10-09 09:09:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 09:09:00Z],
        clock_out: ~U[2024-10-09 09:09:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 09:15:00Z],
        start_time: ~U[2024-10-09 09:15:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 09:15:00Z],
        clock_out: ~U[2024-10-09 09:15:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 09:19:00Z],
        start_time: ~U[2024-10-09 09:19:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 09:19:00Z],
        clock_out: ~U[2024-10-09 09:19:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 09:20:00Z],
        start_time: ~U[2024-10-09 09:20:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end

  @doc """
  Generate a clocking.
  """
  def clocking_fixture(attrs \\ %{}) do
    {:ok, clocking} =
      attrs
      |> Enum.into(%{
        clock_in: ~U[2024-10-09 09:20:00Z],
        clock_out: ~U[2024-10-09 09:20:00Z]
      })
      |> Api.Accounts.create_clocking()

    clocking
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2024-10-09 09:27:00Z],
        start_time: ~U[2024-10-09 09:27:00Z]
      })
      |> Api.Accounts.create_working_time()

    working_time
  end
end
