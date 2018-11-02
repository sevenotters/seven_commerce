defmodule UserTest do
  use ExUnit.Case

  test "register a new user" do
    Seven.EventStore.EventStore.subscribe("UserRegistered", self())

    request_id = Seven.Data.Persistence.new_id

    result =
      %Seven.CommandRequest{
        id: request_id,
        command: "RegisterUser",
        sender: __MODULE__,
        params: %{user: "Paul User", password: "my_difficult_password"}
      }
      |> Seven.CommandBus.send_command_request()

    refute result == :not_managed, "Command is not managed by anyone"

    assert_receive %Seven.Otters.Event{type: "UserRegistered", request_id: ^request_id, correlation_module: SevenCommerce.Aggregates.User}
  end
end
