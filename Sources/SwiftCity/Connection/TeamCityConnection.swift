import Foundation

public protocol ITeamCityConnection {

    init(server: String)
    init(server: String, username: String, password: String)

    func get(_ endpoint: String, done: @escaping (_ data: Data) -> (), error: @escaping (Error) -> ())
    
    func get(_ endpoint: String, acceptHeader: String?, done: @escaping (_ data: Data) -> (), error: @escaping (Error) -> ())

    func post<T>(_ endpoint: String, body: T, done: (statusCode: Int, error: Error?))

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

    public func get(_ endpoint: String, done: @escaping (_ data: Data) -> (), error: @escaping (Error) -> ()) {
        self.get(endpoint, acceptHeader: nil, done: done, error: error)
    }

    public func get(_ endpoint: String, acceptHeader: String?, done: @escaping (_ data: Data) -> (), error: @escaping (Error) -> ()) {
        let requestUrl = "\(self.serverUrl)\(endpoint)"
        let url = URL(string: requestUrl)!
        var request = URLRequest(url: url)
        if let accept = acceptHeader {
            request.addValue(accept, forHTTPHeaderField: "Accept")
        }

        if (!self.shouldConnectAsGuest) {
            let authText = "\(self.username ?? ""):\(self.password ?? "")"
            let auth = authText.data(using: .utf8)
            let encodedAuth = auth?.base64EncodedString(options: Data.Base64EncodingOptions.endLineWithCarriageReturn)
            request.addValue("Basic \(encodedAuth)", forHTTPHeaderField: "Authorization")
        }

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: request, completionHandler: {(data, response, err) in

            if let anError = err {
                error(anError)
                return
            }

            if (self.debugging) {
                let body = String(data: data!, encoding: String.Encoding.utf8)
                print("---")
                print(body)
                print("---")
            }

            done(data!)

        })

        task.resume()
    }

    public func post<T>(_ endpoint: String, body: T, done: (statusCode: Int, error: Error?)) {

    }

}
