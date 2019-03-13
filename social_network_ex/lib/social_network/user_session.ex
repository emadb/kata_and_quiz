defmodule UserSession do
  use GenServer

  defstruct posts: [], following: []

  def start_link({name}) do
    GenServer.start_link(__MODULE__, name, name: RegistryHelper.create_key(name))
  end
  def init(_name) do
    Process.flag(:trap_exit, true)
    {:ok, %UserSession{posts: [], following: []}}
  end
  def post(username, message) do
    pid = RegistryHelper.get_pid(username)
    GenServer.call(pid, {:post, message})
  end

  def timeline(username) do
    pid = RegistryHelper.get_pid(username)
    GenServer.call(pid, {:timeline})
  end

  def follow(username, who_to_follow) do
    pid = RegistryHelper.get_pid(username)
    GenServer.call(pid, {:follow, who_to_follow})
  end

  def following(username) do
    pid = RegistryHelper.get_pid(username)
    GenServer.call(pid, {:following})
  end

  def handle_call({:post, message}, _from, state) do
    {:reply, :ok, %UserSession{state | posts: state.posts ++ [%Post{date: DateTime.utc_now(), message: message}]}}
  end

  def handle_call({:timeline}, _from, state) do
    {:reply, {:ok, state.posts}, state }
  end

  def handle_call({:follow, who_to_follow}, _from, state) do
    {:reply, :ok, %UserSession{state | following: state.following ++ [who_to_follow]}}
  end

  def handle_call({:following}, _from, state) do
    {:reply, {:ok, state.following}, state}
  end
end

# defmodule Post do
#   defstruct date: nil , username: nil, message: nil
# end

