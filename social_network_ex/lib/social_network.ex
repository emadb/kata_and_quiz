defmodule SocialNetwork do

 def login(username) do
  SessionSupervisor.start_session(username)
 end

 def logout(username) do
  SessionSupervisor.end_session(username)
 end

 def post(username, message) do
  UserSession.post(username, message)
 end

 def timeline(username) do
  UserSession.timeline(username)
 end

end

defmodule Post do
  defstruct date: nil , message: nil
end
