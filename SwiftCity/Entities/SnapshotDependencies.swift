struct SnapshotDependencies {
    let count: Int
    let dependencies: [SnapshotDependency]
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let dependenciesDictionary = dictionary["snapshot-dependency"] as? [[String: AnyObject]] else {
                return nil
        }
        
        let dependencies = dependenciesDictionary.map { (dictionary: [String : AnyObject]) -> SnapshotDependency? in
            return SnapshotDependency(dictionary: dictionary)
        }.filter { (dependency: SnapshotDependency?) -> Bool in
            return dependency != nil
        }.map { (dependency: SnapshotDependency?) -> SnapshotDependency in
            return dependency!
        }
        
        self.count = count
        self.dependencies = dependencies
    }
}
