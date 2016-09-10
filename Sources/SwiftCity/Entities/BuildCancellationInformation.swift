public struct BuildCancellationInformation {
    
    public let user: UserSummary
    public let timestamp: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let timestamp = dictionary["timestamp"] as? String,
            let userDictionary = dictionary["user"] as? [String: AnyObject],
            let user = UserSummary(dictionary: userDictionary) else {
                return nil
        }
        
        self.user = user
        self.timestamp = timestamp
    }

}