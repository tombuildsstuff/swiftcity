public struct GroupSummary {
    
    public let key: String
    public let name: String
    public let href: String
    public let description: String?
    
    init?(dictionary: [String: AnyObject]) {
        guard let key = dictionary["key"] as? String,
            let name = dictionary["name"] as? String,
            let href = dictionary["href"] as? String
            else {
                return nil
        }
        
        self.key = key
        self.name = name
        self.href = href
        self.description = dictionary["description"] as? String
    }
    
}