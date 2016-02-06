public struct Roles {
    
    public let roles: [Role]
    
    init?(dictionary: [String: AnyObject]) {
        guard let rolesDictionary = dictionary["role"] as? [[String: AnyObject]] else {
            return nil
        }
        
        let roles = rolesDictionary.map { (dictionary: [String : AnyObject]) -> Role? in
            return Role(dictionary: dictionary)
            }.filter { (role: Role?) -> Bool in
                return role != nil
            }.map { (role: Role?) -> Role in
                return role!
        }
        
        guard roles.count == rolesDictionary.count else {
            return nil
        }
        
        self.roles = roles
    }
    
}

