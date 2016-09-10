public struct BuildAgentPoolSummary {
    
    public let id: Int
    public let name: String
    public let href: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? Int,
              let name = dictionary["name"] as? String,
              let href = dictionary["href"] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.href = href
    }
}