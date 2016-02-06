public struct BuildAgentPools {
    
    public let count: Int
    public let href: String
    public let pools: [BuildAgentPoolSummary]
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let href = dictionary["href"] as? String,
              let poolsDictionary = dictionary["agentPool"] as? [[String: AnyObject]]
        else {
            return nil
        }
        
        let pools = poolsDictionary.map { (dictionary: [String: AnyObject]) -> BuildAgentPoolSummary? in
            return BuildAgentPoolSummary(dictionary: dictionary)
        }.filter { (pool: BuildAgentPoolSummary?) -> Bool in
            return pool != nil
        }.map { (pool: BuildAgentPoolSummary?) -> BuildAgentPoolSummary in
            return pool!
        }
        
        self.count = count
        self.href = href
        self.pools = pools
    }
}