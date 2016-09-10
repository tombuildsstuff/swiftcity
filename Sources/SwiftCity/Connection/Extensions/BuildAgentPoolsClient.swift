import Foundation

extension TeamCityClient {
    
    public func allBuildAgentPools(successful: @escaping (BuildAgentPools) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/agentPools", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let pools = BuildAgentPools(dictionary: json)!
            successful(pools)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
    public func buildAgentPoolById(id: Int, successful: @escaping (BuildAgentPool?) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/agentPools/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let pool = BuildAgentPool(dictionary: json)
            successful(pool)
        }) { (error: Error) -> () in
            failure(error)
        }
    }

}
