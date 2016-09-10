public struct BuildAgentPool {
    
    public let pool: BuildAgentPoolSummary
    public let projects: Projects
    public let agents: BuildAgents
    
    init?(dictionary: [String: AnyObject]) {
        guard let pool = BuildAgentPoolSummary(dictionary: dictionary),
              let projectsDictionary = dictionary["projects"] as? [String: AnyObject],
              let projects = Projects(dictionary: projectsDictionary),
              let agentsDictionary = dictionary["agents"] as? [String: AnyObject],
              let agents = BuildAgents(dictionary: agentsDictionary)
        else {
            return nil
        }
        
        self.pool = pool
        self.projects = projects
        self.agents = agents
    }
    
}