public struct Group {

    public let group : GroupSummary
    public let parentGroups: Groups
    public let childGroups: Groups
    public let users: Users
    public let roles: Roles
    public let properties: Parameters
    
    init?(dictionary: [String: AnyObject]) {
        guard let group = GroupSummary(dictionary: dictionary),
              let parentGroupsDictionary = dictionary["parent-groups"] as? [String: AnyObject],
              let parentGroups = Groups(dictionary: parentGroupsDictionary),
              let childGroupsDictionary = dictionary["child-groups"] as? [String: AnyObject],
              let childGroups = Groups(dictionary: childGroupsDictionary),
              let usersDictionary = dictionary["users"] as? [String: AnyObject],
              let users = Users(dictionary: usersDictionary),
              let rolesDictionary = dictionary["roles"] as? [String: AnyObject],
              let roles = Roles(dictionary: rolesDictionary),
              let propertiesDictionary = dictionary["properties"] as? [String: AnyObject],
              let properties = Parameters(dictionary: propertiesDictionary)
        else {
            return nil
        }
        
        self.group = group
        self.parentGroups = parentGroups
        self.childGroups = childGroups
        self.users = users
        self.roles = roles
        self.properties = properties
    }
    
}