import Foundation

extension TeamCityClient {
    
    public func serverInformation(successful: @escaping (ServerInformation) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/server", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let information = ServerInformation(dictionary: json)!
            successful(information)
        }) { (error: Error) -> () in
            failure(error)
        }
    }

}
