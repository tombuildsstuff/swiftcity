public struct BuildAgents {
    
    public let count : Int
    public let href: String
    public let agents: [BuildAgentSummary]?
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let href = dictionary["href"] as? String
        else {
            return nil
        }
        
        if let agentsDictionary = dictionary["agent"] as? [[String: AnyObject]] {
            let agents = agentsDictionary.map { (dictionary: [String: AnyObject]) -> BuildAgentSummary? in
                return BuildAgentSummary(dictionary: dictionary)
            }.filter({ (agent: BuildAgentSummary?) -> Bool in
                return agent != nil
            }).map({ (agent: BuildAgentSummary?) -> BuildAgentSummary in
                return agent!
            })
            
            self.agents = agents
        }
        else
        {
            self.agents = nil
        }
        
        self.count = count
        self.href = href
    }
    
}