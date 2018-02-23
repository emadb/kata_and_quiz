import User from './user'
import {reject, flatten} from 'ramda'
import Post from './post';

let activeProfiles:Array<User> = []

const userFinder = (username:String) => (u:User) => u.username === username

const SocialMediaManager = {
  getUserProfile: (username: String): User => {
    const activeUser = activeProfiles.find(userFinder(username))
    if (activeUser){
      return activeUser
    } 
    const newUser:User = new User(username)
    activeProfiles.push(newUser)
    return newUser
  },
  logout(username: String) : void {
    activeProfiles = reject(userFinder(username))(activeProfiles)
  },
  getTimeline(user: User) : Post[] {
    const list: Post[] = user.subscriptions.reduce((acc: Post[], current: String) => {
      const other:User = activeProfiles.find(userFinder(current)) || User.empty()
      return [...acc, ...other.getTimeline()]
    }, [])
    return list
  }


}

export default SocialMediaManager