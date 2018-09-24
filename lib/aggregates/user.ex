defmodule SevenCommerce.Aggregates.User do
  use Seven.Otters.Aggregate, aggregate_field: :id

  defstruct id: nil,
            user: nil,
            password: nil,
            cart: []

  defp init_state, do: %__MODULE__{}

  defp pre_handle_command(_command, _state), do: :ok
  defp handle_command(_command, _state), do: {:managed, []}
  defp handle_event(_event, state), do: state
end
