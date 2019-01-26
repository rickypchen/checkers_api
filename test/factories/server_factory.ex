defmodule CheckersApi.ServerFactory do
  defmacro __using__(_opts) do
    quote do
      def server_factory do
        %CheckersApi.Checker.Server{
          ip_address: "0.0.0.0",
          name: "Test Server"
        }
      end
    end
  end
end
