public struct ArtifactDependencies {

    public let count: Int
    public let dependencies: [ArtifactDependency]

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let dependenciesDictionary = dictionary["artifact-dependency"] as? [[String: AnyObject]] else {
                return nil
        }

        let dependencies = dependenciesDictionary.map { (dictionary: [String : AnyObject]) -> ArtifactDependency? in
            return ArtifactDependency(dictionary: dictionary)
            }.filter { (dependency: ArtifactDependency?) -> Bool in
                return dependency != nil
            }.map { (dependency: ArtifactDependency?) -> ArtifactDependency in
                return dependency!
        }

        self.count = count
        self.dependencies = dependencies
    }
}
