struct BuildType {
    
    let buildType : BuildTypeLocator
    let entries: VCSRootEntries?
    
    init?(dictionary: [String: AnyObject]) {
        guard let locator = BuildTypeLocator(dictionary: dictionary) else {
            return nil
        }
        
        if let entriesDictionary = dictionary["vcs-root-entries"] as? [String: AnyObject] {
            print(entriesDictionary)
            self.entries = VCSRootEntries(dictionary: entriesDictionary)
        }
        else {
            self.entries = nil
        }
        
        self.buildType = locator
    }
    
}