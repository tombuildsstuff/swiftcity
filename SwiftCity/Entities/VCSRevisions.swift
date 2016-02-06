public struct VCSRevisions {
    
    public let count: Int
    public let revisions: [VCSRevision]?
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int else {
                return nil
        }
        
        self.count = count
        
        if let revisionsDictionary = dictionary["revision"] as? [[String: AnyObject]] {
            self.revisions = revisionsDictionary.map({ (dictionary: [String : AnyObject]) -> VCSRevision? in
                return VCSRevision(dictionary: dictionary)
            }).filter({ (revision:VCSRevision?) -> Bool in
                return revision != nil
            }).map({ (revision: VCSRevision?) -> VCSRevision in
                return revision!
            })
        }
        else {
            self.revisions = nil
        }
    }
}