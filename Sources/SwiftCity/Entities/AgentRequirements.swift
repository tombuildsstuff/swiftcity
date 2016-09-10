public struct AgentRequirements {

    public let count: Int
    public let requirements: [AgentRequirement]

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let requirementsDictionary = dictionary["agent-requirement"] as? [[String: AnyObject]] else {
                return nil
        }

        let requirements = requirementsDictionary.map { (dictionary: [String : AnyObject]) -> AgentRequirement? in
            return AgentRequirement(dictionary: dictionary)
        }.filter { (requirement: AgentRequirement?) -> Bool in
            return requirement != nil
        }.map { (requirement: AgentRequirement?) -> AgentRequirement in
            return requirement!
        }

        guard requirements.count == requirementsDictionary.count else {
            return nil
        }

        self.count = count
        self.requirements = requirements
    }

}
