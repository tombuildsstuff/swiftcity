import Foundation

extension TeamCityClient {

    public func authenticate(successful: @escaping () -> (), failure: @escaping (_ error: Error) -> ()) {
        self.connection.get("/app/rest", done: { (data) -> () in
            successful()
        }) { (error: Error) -> () in
            failure(error)
        }
    }

}
