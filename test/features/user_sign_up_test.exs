defmodule SignDict.UserSignUpTest do
  use SignUp.AcceptanceCase, async: true

  test "sign up user, login and logout", %{session: session} do
    session
    |> visit("/")
    |> click(Query.link("Register"))
    |> find(Query.css(".user-form"), fn(form) ->
      form
      |> fill_in(Query.text_field("user_email"), with: "elisa@example.com")
      |> fill_in(Query.text_field("user_password"), with: "mylongpassword")
      |> fill_in(Query.text_field("user_password_confirmation"), with: "mylongpassword")
      |> fill_in(Query.text_field("user_name"), with: "Elisa Example")
      |> click(Query.button("Register"))
    end)
    |> assert_alert("Registration successful")
    |> visit("/")
    |> click(Query.link("Sign in"))
    |> find(Query.css(".login-form"), fn(form) ->
      form
      |> fill_in(Query.text_field("session_email"), with: "elisa@example.com")
      |> fill_in(Query.text_field("session_password"), with: "mylongpassword")
      |> click(Query.button("Log in"))
    end)
    |> assert_alert("Successfully signed in")
    |> visit("/")
    |> click(Query.link("Sign out"))
    |> assert_alert("Successfully signed out")
  end

  test "sign up user, login and logout 2", %{session: session} do
    session
    |> visit("/")
    |> click(Query.link("Register"))
    |> find(Query.css(".user-form"), fn(form) ->
      form
      |> fill_in(Query.text_field("user_email"), with: "elisa@example.com")
      |> fill_in(Query.text_field("user_password"), with: "mylongpassword")
      |> fill_in(Query.text_field("user_password_confirmation"), with: "mylongpassword")
      |> fill_in(Query.text_field("user_name"), with: "Elisa Example")
      |> click(Query.button("Register"))
    end)
    |> assert_alert("Registration successful")
    |> visit("/")
    |> click(Query.link("Sign in"))
    |> find(Query.css(".login-form"), fn(form) ->
      form
      |> fill_in(Query.text_field("session_email"), with: "elisa@example.com")
      |> fill_in(Query.text_field("session_password"), with: "mylongpassword")
      |> click(Query.button("Log in"))
    end)
    |> assert_alert("Successfully signed in")
    |> visit("/")
    |> click(Query.css(".sign-out"))
    |> assert_alert("Successfully signed out")
  end

  defp assert_alert(page, text) do
    :timer.sleep 1000
    page
    |> find(Query.css(".alert-info"), fn(notification) ->
      assert notification
      |> has_text?(text)
    end)
  end
end
