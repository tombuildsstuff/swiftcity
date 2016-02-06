public struct BuildAgentPools {
    
    public let count: Int
    public let href: String
    public let pools: [BuildAgentPool]
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let href = dictionary["href"] as? String,
              let poolsDictionary = dictionary["agentPool"] as? [[String: AnyObject]]
        else {
            return nil
        }
        
        let pools = poolsDictionary.map { (dictionary: [String: AnyObject]) -> BuildAgentPool? in
            return BuildAgentPool(dictionary: dictionary)
        }.filter { (pool: BuildAgentPool?) -> Bool in
            return pool != nil
        }.map { (pool: BuildAgentPool?) -> BuildAgentPool in
            return pool!
        }
        
        self.count = count
        self.href = href
        self.pools = pools
    }
}