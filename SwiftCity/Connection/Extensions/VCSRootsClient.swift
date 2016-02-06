import Foundation

extension TeamCityClient {
    
    public func allVcsRoots(successful: (VCSRoots) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/vcs-roots", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let roots = VCSRoots(dictionary: json)!
            successful(roots)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
    public func vcsRootById(id: String, successful: (VCSRoot?) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/vcs-roots/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let root = VCSRoot(dictionary: json)!
            successful(root)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
}