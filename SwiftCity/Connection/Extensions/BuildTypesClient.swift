import Foundation

extension TeamCityClient {

    func allBuildTypes(successful: (BuildTypes) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/buildTypes", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let buildTypes = BuildTypes(dictionary: json)!
            successful(buildTypes)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }
    
    func buildTypesById(id: String, successful: (BuildType) -> (), failure: (NSError) -> ()) {
        self.connection.get("/app/rest/buildTypes/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            let buildType = BuildType(dictionary: json)!
            successful(buildType)
        }) { (error: NSError) -> () in
            failure(error)
        }
    }

}