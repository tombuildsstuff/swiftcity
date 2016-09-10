import Foundation

public protocol ITeamCityConnection {

    init(server: String)
    init(server: String, username: String, password: String)

    func get(endpoint: String, done: (data: NSData) -> (), error: (NSError) -> ())

    func get(endpoint: String, acceptHeader: String?, done: (data: NSData) -> (), error: (NSError) -> ())

    func post<T>(endpoint: String, body: T, done: (statusCode: Int, error: NSError?))

}

public class TeamCityConnection : ITeamCityConnection {

    private let debugging = false

    private let serverUrl : String
    private let shouldConnectAsGuest : Bool
    private let username : String?
    private let password : String?

    public required init(server: String) {
        self.serverUrl = "\(server)/guestAuth"
        self.shouldConnectAsGuest = true
        self.username = nil
        self.password = nil
    }

    public required init(server: String, username: String, password: String) {
        self.serverUrl = "\(server)/httpAuth"
        self.username = username
        self.password = password
        self.shouldConnectAsGuest = false
    }

    public func get(endpoint: String, done: (data: NSData) -> (), error: (NSError) -> ()) {
        self.get(endpoint, acceptHeader: nil, done: done, error: error)
    }

    public func get(endpoint: String, acceptHeader: String?, done: (data: NSData) -> (), error: (NSError) -> ()) {
        let requestUrl = "\(self.serverUrl)\(endpoint)"
        let url = NSURL(string: requestUrl)!
        let request = NSMutableURLRequest(URL: url)
        if let accept = acceptHeader {
            request.addValue(accept, forHTTPHeaderField: "Accept")
        }

        if (!self.shouldConnectAsGuest) {
            let auth = NSString(string: "\(self.username ?? ""):\(self.password ?? "")").dataUsingEncoding(NSUTF8StringEncoding)!
            let encodedAuth = auth.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.EncodingEndLineWithCarriageReturn)
            request.addValue("Basic \(encodedAuth)", forHTTPHeaderField: "Authorization")
        }

        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)

        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, err) in

            if let anError = err {
                error(anError)
                return
            }

            if (self.debugging) {
                let body = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                print("---")
                print(body)
                print("---")
            }

            done(data: data!)

        })

        task.resume()
    }

    public func post<T>(endpoint: String, body: T, done: (statusCode: Int, error: NSError?)) {

    }

}
