public struct Groups {
    
    public let count: Int
    public let groups: [Group]
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let groupsDictionary = dictionary["group"] as? [[String: AnyObject]]
            else {
                return nil
        }
        
        let groups = groupsDictionary.map { (dictionary: [String : AnyObject]) -> Group? in
            return Group(dictionary: dictionary)
            }.filter { (group: Group?) -> Bool in
                return group != nil
            }.map { (group: Group?) -> Group in
                return group!
        }
        
        guard groups.count == groupsDictionary.count else {
            return nil
        }
        
        self.count = count
        self.groups = groups
    }
}