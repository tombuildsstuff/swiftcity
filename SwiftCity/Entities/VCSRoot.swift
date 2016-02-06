public struct VCSRoot {
    
    public let id: String
    public let name: String
    public let vcsName: String
    public let status: String
    // TODO: proper date parsing..
    public let lastChecked: String
    public let href: String
    
    public let project: ProjectLocator
    public let properties: Parameters
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? String,
              let name = dictionary["name"] as? String,
              let vcsName = dictionary["vcsName"] as? String,
              let status = dictionary["status"] as? String,
              let lastChecked = dictionary["lastChecked"] as? String,
              let href = dictionary["href"] as? String,
              let projectDictionary = dictionary["project"] as? [String: AnyObject],
              let propertiesDictionary = dictionary["properties"] as? [String: AnyObject],
              let properties = Parameters(dictionary: propertiesDictionary)
        else {
            return nil
        }
        
        let project = ProjectLocator(dictionary: projectDictionary)
        
        self.id = id
        self.name = name
        self.vcsName = vcsName
        self.status = status
        self.lastChecked = lastChecked
        self.href = href
        self.project = project
        self.properties = properties
    }
}