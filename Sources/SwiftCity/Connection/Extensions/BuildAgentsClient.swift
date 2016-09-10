import Foundation

extension TeamCityClient {
    
    public func allBuildAgents(successful: @escaping (BuildAgents) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/agents", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let users = BuildAgents(dictionary: json)!
            successful(users)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
    public func buildAgentById(id: Int, successful: @escaping (BuildAgent?) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/agents/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let agent = BuildAgent(dictionary: json)
            successful(agent)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
    public func buildAgentByName(name: String, successful: @escaping (BuildAgent?) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/agents/name:\(name)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let agent = BuildAgent(dictionary: json)
            successful(agent)
        }) { (error: Error) -> () in
            failure(error)
        }
    }

}
