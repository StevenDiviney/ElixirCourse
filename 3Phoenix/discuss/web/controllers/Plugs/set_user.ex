defmodule Discuss.Plugs.SetUser do
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User

    def init(_params) do
    end

    #The "call" function is what gets called on a plug
    def call(conn, _init_return) do
        user_id = get_session(conn, :user_id)
        cond do
            user = user_id && Repo.get(User, user_id) ->
                assign(conn, :user, user)
            true -> 
                assign(conn, :user, nil)
        end
    end

end