struct ArtifactDependency {
    
    let id: String
    let type: String
    let properties: Parameters
    let sourceBuildType: BuildTypeLocator
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? String,
            let type = dictionary["type"] as? String,
            let propertiesDictionary = dictionary["properties"] as? [String: AnyObject],
            let properties = Parameters(dictionary: propertiesDictionary),
            let sourceBuildTypeDictionary = dictionary["source-buildType"] as? [String: AnyObject],
            let sourceBuildType = BuildTypeLocator(dictionary: sourceBuildTypeDictionary) else {
                return nil
        }
        
        self.id = id
        self.type = type
        self.properties = properties
        self.sourceBuildType = sourceBuildType
    }
    
}

