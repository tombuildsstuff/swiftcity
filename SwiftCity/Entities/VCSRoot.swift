public struct VCSRoot {
    
    let id: String
    let name: String
    let vcsName: String
    let status: String
    // TODO: proper date parsing..
    let lastChecked: String
    let href: String
    
    let project: ProjectLocator
    let properties: Parameters
    
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