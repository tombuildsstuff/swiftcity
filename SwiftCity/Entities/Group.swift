public struct Group {

    public let group : GroupSummary
    public let parentGroups: Groups
    public let childGroups: Groups
    public let users: Users // ?!
    public let roles: Roles // ?!
    public let properties: Parameters
    
    /*
    <group key="TOP_LEVEL_GROUP" name="Top Level Group" href="/guestAuth/app/rest/userGroups/key:TOP_LEVEL_GROUP">
    <parent-groups count="0"/>
    <child-groups count="1">
    <group key="MIDDLE_GROUP" name="Middle Group" href="/guestAuth/app/rest/userGroups/key:MIDDLE_GROUP"/>
    </child-groups>
    <users count="0"/>
    <roles/>
    <properties count="0" href="/app/rest/userGroups/key:TOP_LEVEL_GROUP/properties"/>
    </group>
    */
    
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