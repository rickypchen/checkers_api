defmodule CheckersApi.CheckerTest do
  use CheckersApi.DataCase
  alias CheckersApi.{Checker, Checker.Server}

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

  describe "create_server/1" do
    @valid_attrs %{ name: "test", ip_address: "0.0.0.0" }
    @invalid_attrs %{ name: nil, ip_address: "0.0.0.0" }

    test "should create a server" do
      assert {:ok, server} = Checker.create_server(@valid_attrs)
      assert server.name == @valid_attrs.name
    end

    test "should not create a server with invalid attrs" do
      assert {:error, changeset} = Checker.create_server(@invalid_attrs)
    end
  end

  describe "update_server/1" do
    @valid_update_attrs %{ name: "test2" }
    @invalid_update_attrs %{ name: nil }

    test "should update a server with valid update attrs" do
      server = insert(:server, name: "test1")
      assert {:ok, server} = Checker.update_server(server, @valid_update_attrs)
      assert server.name == "test2"
    end

    test "should not update a server with invalid update attrs" do
      server = insert(:server, name: "test1")
      assert {:error, _changeset} = Checker.update_server(server, @invalid_update_attrs)
    end
  end

  describe "delete_server/1" do
    test "should delete a server" do
      server = insert(:server)
      assert {:ok, server} = Checker.delete_server(server)
      assert Repo.get(Server, server.id) == nil
    end
  end
end
