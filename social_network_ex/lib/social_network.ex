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

 def follow(username, who_to_follow) do
  UserSession.follow(username, who_to_follow)
 end

 def following(username) do
  UserSession.following(username)
 end

end

defmodule Post do
  defstruct date: nil , message: nil
end
