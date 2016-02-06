public struct LastChanges {
    
    public let count: Int
    public let changes: [VCSChange]?
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int else {
            return nil
        }
        
        if let changesDictionary = dictionary["change"] as? [[String: AnyObject]] {
            self.changes = changesDictionary.map({ (dictionary: [String : AnyObject]) -> VCSChange? in
                return VCSChange(dictionary: dictionary)
            }).filter({ (change: VCSChange?) -> Bool in
                return change != nil
            }).map({ (change: VCSChange?) -> VCSChange in
                return change!
            })
        } else {
            self.changes = nil
        }
        
        self.count = count
    }

}