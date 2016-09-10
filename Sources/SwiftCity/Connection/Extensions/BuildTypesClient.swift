import Foundation

extension TeamCityClient {

    public func allBuildTypes(successful: @escaping (BuildTypes) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/buildTypes", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let buildTypes = BuildTypes(dictionary: json)!
            successful(buildTypes)
        }) { (error: Error) -> () in
            failure(error)
        }
    }

    public func buildTypesById(id: String, successful: @escaping (BuildType) -> (), failure: @escaping (Error) -> ()) {
        self.connection.get("/app/rest/buildTypes/id:\(id)", acceptHeader: "application/json", done: { (data) -> () in
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            let buildType = BuildType(dictionary: json)!
            successful(buildType)
        }) { (error: Error) -> () in
            failure(error)
        }
    }

}
