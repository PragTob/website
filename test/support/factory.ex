defmodule SignDict.Factory do
  use ExMachina.Ecto, repo: SignDict.Repo

  def user_factory do
    %SignDict.User{
      name: "Jane Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
    }
  end

end