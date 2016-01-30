//
//  TeamCityClient.swift
//  SwiftCity
//
//  Created by Tom Harvey on 30/01/2016.
//  Copyright © 2016 We Build Stuff. All rights reserved.
//

import Foundation

class TeamCityClient {
    
    let connection : ITeamCityConnection
    
    init(connection: ITeamCityConnection) {
        self.connection = connection
    }
    
    func authenticate(successful: () -> (), failure: (error: NSError) -> ()) {
        self.connection.get("/app/rest", done: { (data) -> () in
            successful()
        }) { (error: NSError) -> () in
            failure(error: error)
        }
    }
    
    func allProjects(successful: (projects: Projects) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/projects", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let projects = Projects(dictionary: json)!
            successful(projects: projects)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
    func projectById(id: String, successful: (project: Project) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/projects/\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let project = Project(dictionary: json)!
            successful(project: project)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
}