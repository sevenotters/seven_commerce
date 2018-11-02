defmodule SevenCommerce.Aggregates.User do
  use Seven.Otters.Aggregate, aggregate_field: :user

  defstruct user: nil,
            password: nil,
            cart: []

  @register_user_command "RegisterUser"
  @register_user_validation [
    :map,
    fields: [
      user: [:string],
      password: [:string, pattern: ~r/.{8,}/]
    ]
  ]

  @user_registered_event "UserRegistered"

  @moduledoc """
    User aggregate.
    Responds to commands:
    - #{@register_user_command}
    """

  defp init_state, do: %__MODULE__{}

  @spec route(String.t(), any) :: {:routed, Map.y(), atom} | {:invalid, Map.t()}
  def route(@register_user_command, params) do
    cmd = %{
      user: params[:user],
      password: params[:password]
    }

    @register_user_command
    |> Seven.Otters.Command.create(cmd)
    |> validate(@register_user_validation)
  end

  defp pre_handle_command(_command, _state), do: :ok

  @spec handle_command(Map.t(), any) :: {:managed, List.t()}
  defp handle_command(%Seven.Otters.Command{type: @register_user_command} = command, _state) do
    event = %{
      user: command.payload.user,
      password: hashpw(command.payload.password)
    }

    {:managed, [create_event(@user_registered_event, %{v1: event})]}
  end

  @spec handle_event(Map.t(), any) :: any
  defp handle_event(%Seven.Otters.Event{type: @user_registered_event} = event, state) do
    %{
      state
      | user: event.payload.v1.user,
        password: event.payload.v1.password
    }
  end

  # Generate hash from a string.
  @spec hashpw(String.t()) :: String.t()
  defp hashpw(password), do: Comeonin.Bcrypt.hashpwsalt(password)
end
