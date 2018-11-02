use Mix.Config

config :seven,
  print_commands: false,
  print_events: false

config :seven, Seven.Application, database: "seven_commerce_test"

config :logger, level: :error
