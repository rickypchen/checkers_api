defmodule CheckersApi.CheckerTest do
  use CheckersApi.DataCase
  alias CheckersApi.Checker

  describe "list_servers/0" do
    test "should return all servers" do
      server = insert(:server)
      assert Checker.list_servers() == [server]
    end
  end

  describe "get_server/1" do
    test "should return a server by id" do
      server = insert(:server)
      assert Checker.get_server(server.id) == server
    end

    test "should return nil if server not found" do
      id = UUID.uuid1()
      assert Checker.get_server(id) == nil
    end
  end
end
