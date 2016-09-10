import Foundation

extension TeamCityClient {
    
    public func serverInformation(successful: (ServerInformation) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/server", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let information = ServerInformation(dictionary: json)!
            successful(information)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

}