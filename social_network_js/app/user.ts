import SocialMediaManager from "./social-media";
import Post from "./post";

class User {

  static empty(): User {
    return new User("")
  }
  public username: String
  public subscriptions: Array<String> = []
  private posts: Array<Post> = []
  
  constructor(username: String) {
    this.username = username
  }
  
  public getTimeline(user = ""): Array<Post> {
    // if (user === "") {
    //   return this.posts
    // }
    // const other:User  = SocialMediaManager.getUserProfile(user)
    // return other.getTimeline() 
    return this.posts
  }
  
  public post(message: String): void {
    this.posts.push({text: message, date: new Date()})
  }
  
  subscribe(username: String): void {
    this.subscriptions.push(username)
  }
}

export default User