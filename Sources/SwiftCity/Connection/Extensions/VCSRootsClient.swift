import Foundation

extension TeamCityClient {
    
    public func allVcsRoots(successful: @escaping (VCSRoots) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/vcs-roots", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let roots = VCSRoots(dictionary: json)!
            successful(roots)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
    public func vcsRootById(id: String, successful: @escaping (VCSRoot?) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/vcs-roots/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let root = VCSRoot(dictionary: json)!
            successful(root)
        }) { (error: Error) -> () in
            failure(error)
        }
    }
    
}
