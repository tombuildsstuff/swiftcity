import Foundation

extension TeamCityClient {
    
    public func allUsers(successful: @escaping (Users) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/users", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let users = Users(dictionary: json)!
            successful(users)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
    public func userById(id: Int, successful: @escaping (User?) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/users/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let user = User(dictionary: json)!
            successful(user)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
    public func userByName(username: String, successful: @escaping (User?) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/users/username:\(username)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let user = User(dictionary: json)!
            successful(user)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
}
