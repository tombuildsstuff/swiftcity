public struct VCSRootInstance {
    
    public let id: Int
    public let vcsRootId: String
    public let name: String
    public let href: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? Int,
            let vcsRootId = dictionary["vcs-root-id"] as? String,
            let name = dictionary["name"] as? String,
            let href = dictionary["href"] as? String else {
                return nil
        }
        
        self.id = id
        self.vcsRootId = vcsRootId
        self.name = name
        self.href = href
    }
    
}