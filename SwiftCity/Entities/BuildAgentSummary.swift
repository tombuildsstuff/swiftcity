public struct BuildAgentSummary {
    
    public let id: Int?
    public let name: String
    public let typeId: Int
    public let href: String?
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary["name"] as? String,
              let typeId = dictionary["typeId"] as? Int else {
                return nil
        }
        
        self.id = dictionary["id"] as? Int
        self.name = name
        self.typeId = typeId
        self.href = dictionary["href"] as? String
    }
    
}