import Foundation

extension TeamCityClient {
    
    public func allBuilds(start: Int = 0, count: Int = 100, successful: @escaping (Builds) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/builds?start=\(start)&count=\(count)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let builds = Builds(dictionary: json)!
            successful(builds)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
    public func buildById(id: Int, successful: @escaping (Build?) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/builds/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let build = Build(dictionary: json)
            successful(build)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
}
