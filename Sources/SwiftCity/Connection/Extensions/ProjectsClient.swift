import Foundation

extension TeamCityClient {

    public func allProjects(successful: (projects: Projects) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/projects", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let projects = Projects(dictionary: json)!
            successful(projects: projects)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

    public func projectById(id: String, successful: (project: Project) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/projects/\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let project = Project(dictionary: json)!
            successful(project: project)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

}
