# Seven Commerce

E-commerce project example using Seven Otters.

## Steps

Create a new project

```elixir
mix new seven_otters --sup
```

Append dependency in mix.exs _(TODO: publish in Hex and modify dep)_

```elixir
  defp deps do
    [
      {:seven, path: "../sevenotters"}
    ]
  end
```

Update dependencies and compile the whole project

```elixir
mix do deps.get, deps.compile, compile
```
