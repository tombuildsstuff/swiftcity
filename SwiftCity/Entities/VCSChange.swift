public struct VCSChange {

    public let id: Int
    public let version: String
    public let username: String
    public let date: String
    public let href: String
    public let webUrl: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? Int,
            let version = dictionary["version"] as? String,
            let username = dictionary["username"] as? String,
            let date = dictionary["date"] as? String,
            let href = dictionary["href"] as? String,
            let webUrl = dictionary["webUrl"] as? String else {
                return nil
        }
        
        self.id = id
        self.version = version
        self.username = username
        self.date = date
        self.href = href
        self.webUrl = webUrl
    }

}