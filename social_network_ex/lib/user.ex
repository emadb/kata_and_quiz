defmodule Message do
  defstruct date: nil, text: "", author: ""
end

defmodule User do
  use GenServer

  defstruct name: "", messages: [], subscriptions: [], private_messages: []

  @spec init(%User{}) :: {:ok, %User{}}
  def init(state) do
    %User{name: name} = state
    {:ok, _} = SocialNetworkEx.register(name)
    {:ok, state}
  end

  @spec start_link(String.t) :: {:ok, pid()}
  def start_link(name) do
    GenServer.start_link(__MODULE__, %__MODULE__{name: name}, name: SocialNetworkEx.get_session(name))
  end

  @spec post(String.t, String.t) :: :ok
  def post(user, message) do
    GenServer.call(SocialNetworkEx.get_session(user), {:post_message, user, message})
  end

  @spec get_timeline(String.t) :: [%Message{}]
  def get_timeline(user) do
    GenServer.call(SocialNetworkEx.get_session(user), {:get_timeline})
  end

  @spec read_timeline(String.t, String.t) :: [%Message{}]
  def read_timeline(user, other_user) do
    GenServer.call(SocialNetworkEx.get_session(user), {:read_timeline, other_user})
  end

  @spec get_feed(String.t) :: [%Message{}]
  def get_feed(user) do
    GenServer.call(SocialNetworkEx.get_session(user), {:get_feed})
  end
  
  @spec subscribe_to(String.t, [String.t]) :: {:ok}
  def subscribe_to(user, users) do
    GenServer.call(SocialNetworkEx.get_session(user), {:subscribe_to, users})
  end

  @spec get_notifications(String.t) :: {:ok}
  def get_notifications(user) do
    GenServer.call(SocialNetworkEx.get_session(user), {:get_notifications})
  end

  def notify(user, message) do
    GenServer.call(SocialNetworkEx.get_session(user), {:post_message, user, message})
  end

  def send_direct(user, to, message) do
    GenServer.call(SocialNetworkEx.get_session(to), {:send_direct, user, to, message})
  end

  def get_private_messages(user) do
    GenServer.call(SocialNetworkEx.get_session(user), {:get_private_messages})
  end

  defp notify_users(user, message) do
    case Regex.named_captures(~r/@(?<name>\S*)/, message) do
      %{"name" => name} -> User.notify(name, "new message from #{user}")
      _ -> nil
    end
  end

  def handle_call({:post_message, user, message}, _from, state) do
    msg = %Message{date: :calendar.universal_time(), text: message, author: state.name}
    notify_users(user, message)
    {:reply, {:ok}, %User{state | messages: [msg | state.messages]}}
  end

  def handle_call({:get_timeline}, _from, state) do
    {:reply, {:ok, state.messages}, state}
  end

  def handle_call({:read_timeline, other_user}, _from, state) do
    res = User.get_timeline(other_user)
    {:reply, res, state}
  end

  def handle_call({:subscribe_to, users}, _from, state) do
    {:reply, {:ok}, %User{state | subscriptions: users}}
  end

  def handle_call({:get_feed}, _from, state) do
    feed = Enum.flat_map(state.subscriptions, fn u -> 
      {:ok, msg} = User.get_timeline(u) 
      msg
    end)
      
    {:reply, {:ok, feed}, state}
  end

  def handle_call({:send_direct, _from_user, _to, message}, _from, state) do
    new_state = %User{state | private_messages: [message | state.private_messages]}
    {:reply, {:ok}, new_state}
  end

  def handle_call({:get_private_messages}, _from, state) do
    {:reply, {:ok, state.private_messages}, state}
  end
  

end