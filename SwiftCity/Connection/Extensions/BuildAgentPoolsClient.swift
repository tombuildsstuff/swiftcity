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
    
    public func buildAgentPoolById(id: Int, successful: (BuildAgentPool?) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/agentPools/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let pool = BuildAgentPool(dictionary: json)
            successful(pool)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

}