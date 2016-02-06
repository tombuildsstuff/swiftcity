import Foundation

extension TeamCityClient {
    
    public func allUsers(successful: (Users) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/users", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let users = Users(dictionary: json)!
            successful(users)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
    public func userById(id: Int, successful: (User?) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/users/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let user = User(dictionary: json)!
            successful(user)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
    public func userByName(username: String, successful: (User?) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/users/username:\(username)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let user = User(dictionary: json)!
            successful(user)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
}
