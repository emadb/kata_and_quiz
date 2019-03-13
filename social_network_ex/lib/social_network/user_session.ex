defmodule UserSession do
  use GenServer

  def start_link({name}) do
    GenServer.start_link(__MODULE__, name, name: RegistryHelper.create_key(name))
  end
  def init(_name) do
    Process.flag(:trap_exit, true)
    {:ok, []}
  end
  def post(username, message) do
    pid = RegistryHelper.get_pid(username)
    GenServer.call(pid, {:post, message})
  end

  def timeline(username) do
    pid = RegistryHelper.get_pid(username)
    GenServer.call(pid, {:timeline})
  end


  def handle_call({:post, message}, _from, state) do
    {:reply, :ok, state ++ [%Post{date: DateTime.utc_now(), message: message}]}
  end

  def handle_call({:timeline}, _from, state) do
    {:reply, {:ok, state}, state }
  end
end

# defmodule Post do
#   defstruct date: nil , username: nil, message: nil
# end

