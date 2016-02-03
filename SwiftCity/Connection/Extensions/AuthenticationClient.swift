import Foundation

extension TeamCityClient {

    public func authenticate(successful: () -> (), failure: (error: NSError) -> ()) {
        self.connection.get("/app/rest", done: { (data) -> () in
            successful()
        }) { (error: NSError) -> () in
            failure(error: error)
        }
    }

}
