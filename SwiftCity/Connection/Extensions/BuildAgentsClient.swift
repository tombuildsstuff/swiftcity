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
    
    public func buildAgentById(id: Int, successful: (BuildAgent?) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/agents/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let agent = BuildAgent(dictionary: json)
            successful(agent)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
    
    public func buildAgentByName(name: String, successful: (BuildAgent?) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/agents/name:\(name)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let agent = BuildAgent(dictionary: json)
            successful(agent)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

}
