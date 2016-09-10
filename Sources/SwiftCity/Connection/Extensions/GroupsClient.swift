import Foundation

extension TeamCityClient {
    
    public func allGroups(successful: @escaping (Groups) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/userGroups", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let groups = Groups(dictionary: json)!
            successful(groups)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
    public func groupByKey(key: String, successful: @escaping (Group?) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/userGroups/key:\(key)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let group = Group(dictionary: json)
            successful(group)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
}
