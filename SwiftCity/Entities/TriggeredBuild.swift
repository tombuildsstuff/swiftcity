public struct TriggeredBuild {

    public let type: String
    // TODO: proper date handling..
    public let date: String
    
    public let details: String?
    public let user: UserSummary?
    
    init?(dictionary: [String: AnyObject]) {
        guard let type = dictionary["type"] as? String, let date = dictionary["date"] as? String else {
            return nil
        }
        
        self.type = type
        self.date = date
        self.details = dictionary["details"] as? String
        
        if let userDictionary = dictionary["user"] as? [String: AnyObject] {
            self.user = UserSummary(dictionary: userDictionary)
        } else {
            self.user = nil
        }
    }

}