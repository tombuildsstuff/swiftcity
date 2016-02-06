import Foundation

extension TeamCityClient {
    
    public func allBuildAgentPools(successful: (BuildAgentPools) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/agentPools", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let pools = BuildAgentPools(dictionary: json)!
            successful(pools)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

}