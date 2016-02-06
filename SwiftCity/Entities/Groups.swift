public struct Groups {
    
    public let count: Int
    public let groups: [GroupSummary]
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let groupsDictionary = dictionary["group"] as? [[String: AnyObject]]
            else {
                return nil
        }
        
        let groups = groupsDictionary.map { (dictionary: [String : AnyObject]) -> GroupSummary? in
            return GroupSummary(dictionary: dictionary)
        }.filter { (group: GroupSummary?) -> Bool in
            return group != nil
        }.map { (group: GroupSummary?) -> GroupSummary in
            return group!
        }
        
        guard groups.count == groupsDictionary.count else {
            return nil
        }
        
        self.count = count
        self.groups = groups
    }
}