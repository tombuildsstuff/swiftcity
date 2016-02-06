import Foundation

extension TeamCityClient {
    
    public func allBuilds(start: Int = 0, count: Int = 100, successful: (Builds) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/builds?start=\(start)&count=\(count)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let builds = Builds(dictionary: json)!
            successful(builds)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
    public func buildById(id: Int, successful: (Build?) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/builds/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let build = Build(dictionary: json)
            successful(build)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
}
