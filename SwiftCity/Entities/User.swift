public struct User {
    
    public let user: UserSummary
    public let properties: Parameters
    public let roles: Roles
    public let groups: Groups
    
    init?(dictionary: [String: AnyObject]) {
        guard let user = UserSummary(dictionary: dictionary),
            let propertiesDictionary = dictionary["properties"] as? [String: AnyObject],
            let properties = Parameters(dictionary: propertiesDictionary),
            let rolesDictionary = dictionary["roles"] as? [String: AnyObject],
            let roles = Roles(dictionary: rolesDictionary),
            let groupsDictionary = dictionary["groups"] as? [String: AnyObject],
            let groups = Groups(dictionary: groupsDictionary) else {
                return nil
        }
        
        self.user = user
        self.properties = properties
        self.roles = roles
        self.groups = groups
    }
    
}
