public struct VCSRevision {
    
    public let version: String
    public let vcsRootInstance: VCSRootInstance
    
    init?(dictionary: [String: AnyObject]) {
        guard let version = dictionary["version"] as? String,
            let instanceDictionary = dictionary["vcs-root-instance"] as? [String: AnyObject],
            let instance = VCSRootInstance(dictionary: instanceDictionary) else {
                return nil
        }
        
        self.version = version
        self.vcsRootInstance = instance
    }
    
}