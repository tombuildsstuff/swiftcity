import Foundation

extension TeamCityClient {
    
    public func allBuildAgents(successful: (BuildAgents) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/agents", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let users = BuildAgents(dictionary: json)!
            successful(users)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

}
