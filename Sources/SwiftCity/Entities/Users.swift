public struct Users {
    
    public let count: Int
    public let users: [UserSummary]
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let usersDictionary = dictionary["user"] as? [[String: AnyObject]] else {
                return nil
        }
        
        let users = usersDictionary.map { (dictionary: [String : AnyObject]) -> UserSummary? in
            return UserSummary(dictionary: dictionary)
        }.filter { (summary: UserSummary?) -> Bool in
            return summary != nil
        }.map { (summary: UserSummary?) -> UserSummary in
            return summary!
        }
        
        self.count = count
        self.users = users
    }
    
}

