struct VCSRootEntries {
    
    let count : Int
    
    let entries : [VCSRootEntry]
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let entriesDictionary = dictionary["vcs-root-entry"] as? [[String: AnyObject]] else {
            return nil
        }
        
        // TODO: this needs to become an extension method..
        let entries = entriesDictionary.map { (dictionary: [String : AnyObject]) -> VCSRootEntry? in
            return VCSRootEntry(dictionary: dictionary)
        }.filter { (entry: VCSRootEntry?) -> Bool in
            return entry != nil
        }.map { (entry: VCSRootEntry?) -> VCSRootEntry in
            return entry!
        }
        
        guard entries.count == entriesDictionary.count else {
            return nil
        }
        
        self.count = count
        self.entries = entries
    }

}
