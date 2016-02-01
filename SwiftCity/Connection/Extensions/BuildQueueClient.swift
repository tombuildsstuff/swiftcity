import Foundation

extension TeamCityClient {
    
    func buildQueue(successful: (BuildQueue) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/buildQueue", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let buildQueue = BuildQueue(dictionary: json)!
            successful(buildQueue)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

}
    