import Foundation

extension TeamCityClient {

    public func allProjects(successful: @escaping (_ projects: Projects) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/projects", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let projects = Projects(dictionary: json)!
            successful(projects)
        }) { (error: Error) -> () in
            failure(error)
        }
    }

    public func projectById(id: String, successful: @escaping (_ project: Project) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/projects/\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let project = Project(dictionary: json)!
            successful(project)
        }) { (error: Error) -> () in
            failure(error)
        }
    }

}
