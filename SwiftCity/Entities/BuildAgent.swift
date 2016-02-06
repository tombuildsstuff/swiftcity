public struct BuildAgent {
    
    public let agent: BuildAgentSummary
    
    public let connected: Bool
    public let enabled: Bool
    public let authorized: Bool
    public let upToDate: Bool
    public let ip: String?
    public let properties: Parameters?
    public let pool: BuildAgentPoolSummary
    
    init?(dictionary: [String: AnyObject]) {
        guard let agent = BuildAgentSummary(dictionary: dictionary),
              let connected = dictionary["connected"] as? Bool,
              let enabled = dictionary["enabled"] as? Bool,
              let authorized = dictionary["authorized"] as? Bool,
              let upToDate = dictionary["uptodate"] as? Bool,
              let poolDictionary = dictionary["pool"] as? [String: AnyObject],
              let pool = BuildAgentPoolSummary(dictionary: poolDictionary)
        else {
            return nil
        }
        
        if let propertiesDictionary = dictionary["properties"] as? [String: AnyObject] {
            self.properties = Parameters(dictionary: propertiesDictionary)
        } else {
            self.properties = nil
        }
        
        self.agent = agent
        self.connected = connected
        self.enabled = enabled
        self.authorized = authorized
        self.upToDate = upToDate
        self.ip = dictionary["ip"] as? String
        self.pool = pool
    }
}