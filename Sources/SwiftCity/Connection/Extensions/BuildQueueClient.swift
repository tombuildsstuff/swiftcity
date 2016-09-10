import Foundation

extension TeamCityClient {

    public func buildQueue(successful: @escaping (BuildQueue) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/buildQueue", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let buildQueue = BuildQueue(dictionary: json)!
            successful(buildQueue)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
}
