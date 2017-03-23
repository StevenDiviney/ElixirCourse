defmodule Discuss.Plugs.RequireAuth do

    import Plug.Conn #halt
    import Phoenix.Controller

    alias Discuss.Router.Helpers

    
    def init(_params) do
    end

    def call(conn, _params) do
        if conn.assigns[:user] do
            conn    # Do nothing, just pass through      
        else
            conn
            |> put_flash(:error, "You must be logged in")
            |> redirect(to: Helpers.topic_path(conn, :index))
            |> halt()  # Phoenix assumes the controller handler is the last step
                        # This tells Phoenix this conn is done, send the response
        end
    end
end