defmodule User do
  use GenServer

  defstruct name: "", messages: []

  @spec init(%User{}) :: {:ok, %User{}}
  def init(state) do
    {:ok, state}
  end

  @spec start_link(String.t) :: {:ok, pid()}
  def start_link(name) do
    IO.inspect(name, label: "start")
    GenServer.start_link(__MODULE__, %User{name: name}, name: SocialNetworkEx.create_session_id(name))
  end

  @spec post(String.t, String.t) :: :ok
  def post(user, message) do
    GenServer.call(SocialNetworkEx.create_session_id(user), {:post_message, message})
  end

  @spec get_timeline(String.t) :: [any]
  def get_timeline(user) do
    GenServer.call(SocialNetworkEx.create_session_id(user), {:get_timeline})
  end


  def handle_call({:post_message, message}, _from, state) do
    {:reply, {:ok}, %User{state | messages: [message | state.messages]}}
  end

  def handle_call({:get_timeline}, _from, state) do
    {:reply, {:ok, state.messages}, state}
  end
  

end