import Foundation

extension TeamCityClient {
    
    public func allGroups(successful: (Groups) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/userGroups", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let groups = Groups(dictionary: json)!
            successful(groups)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
}