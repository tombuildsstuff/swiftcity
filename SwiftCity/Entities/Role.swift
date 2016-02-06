public struct Role {
    
    public let roleId : String
    public let scope: String
    public let href: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let roleId = dictionary["roleId"] as? String,
            let scope = dictionary["scope"] as? String,
            let href = dictionary["href"] as? String
            else {
                return nil
        }
        
        self.roleId = roleId
        self.scope = scope
        self.href = href
    }
    
}