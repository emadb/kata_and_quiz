defmodule UserSession do
  use GenServer

  defstruct name: "", posts: [], following: [], followers: []

  def start_link({name}) do
    GenServer.start_link(__MODULE__, name, name: RegistryHelper.create_key(name))
  end
  def init(name) do
    Process.flag(:trap_exit, true)
    {:ok, %UserSession{name: name, posts: [], following: [], followers: []}}
  end
  def post(username, message) do
    pid = RegistryHelper.create_key(username)
    GenServer.call(pid, {:post, message})
  end

  def timeline(username) do
    key = RegistryHelper.create_key(username)
    GenServer.call(key, {:timeline})
  end

  def follow(username, who_to_follow) do
    key = RegistryHelper.create_key(username)
    GenServer.call(key, {:follow, who_to_follow})

    follow_key = RegistryHelper.create_key(who_to_follow)
    GenServer.call(follow_key, {:new_follower, username})
  end

  def following(username) do
    key = RegistryHelper.create_key(username)
    GenServer.call(key, {:following})
  end

  def followers(username) do
    key = RegistryHelper.create_key(username)
    GenServer.call(key, {:followers})
  end

  def ping(username) do
    key = RegistryHelper.create_key(username)
    GenServer.call(key, {:ping})
  end

  def handle_call({:post, message}, _from, state) do
    Broker.publish(message, state.name)
    {:reply, :ok, %UserSession{state | posts: state.posts ++ [%Post{date: DateTime.utc_now(), message: message}]}}
  end

  def handle_call({:timeline}, _from, state) do
    {:reply, {:ok, state.posts}, state }
  end

  def handle_call({:follow, who_to_follow}, _from, state) do
    Broker.subscribe(self(), who_to_follow)
    {:reply, :ok, %UserSession{state | following: state.following ++ [who_to_follow]}}
  end

  def handle_call({:new_follower, name}, _from, state) do
    {:reply, :ok, %UserSession{state | followers: state.followers ++ [name]}}
  end

  def handle_call({:following}, _from, state) do
    {:reply, {:ok, state.following}, state}
  end

  def handle_call({:followers}, _from, state) do
    {:reply, {:ok, state.followers}, state}
  end

  def handle_call({:pin}, _from, state) do
    IO.inspect state, label: "PINGING"
    {:reply, {:ok, "pong"}, state}
  end

  def handle_info(message, state) do
    new_state = %UserSession{state | posts: state.posts ++ [%Post{date: DateTime.utc_now(), message: message}]}
    {:noreply, new_state}
  end
end

# defmodule Post do
#   defstruct date: nil , username: nil, message: nil
# end

