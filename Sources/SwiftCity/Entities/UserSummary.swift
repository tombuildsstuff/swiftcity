public struct UserSummary {
    
    public let username: String
    public let name: String?
    public let id: Int
    public let href: String
    // TODO: Date Parsing
    public let lastLogin: String?
    
    init?(dictionary: [String: AnyObject]) {
        guard let username = dictionary["username"] as? String,
              let id = dictionary["id"] as? Int,
              let href = dictionary["href"] as? String else {
                return nil
        }
        
        let name = dictionary["name"] as? String
        let lastLogin = dictionary["lastLogin"] as? String
        
        self.username = username
        self.name = name
        self.id = id
        self.href = href
        self.lastLogin = lastLogin
    }
    
}