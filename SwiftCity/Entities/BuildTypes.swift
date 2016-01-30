struct BuildTypes {
    
    let count : Int
        
    let buildTypes: [BuildType]
        
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let buildTypesDictionary = dictionary["buildType"] as? [[String: AnyObject]] else {
            return nil
        }
        
        let buildTypes = buildTypesDictionary.map { (dictionary: [String: AnyObject]) -> BuildType? in
            return BuildType(dictionary: dictionary)
        }.filter { (type: BuildType?) -> Bool in
            return type != nil
        }.map { (type: BuildType?) -> BuildType in
            return type!
        }
        
        guard buildTypes.count == buildTypesDictionary.count else {
            return nil
        }
        
        self.count = count
        self.buildTypes = buildTypes
    }   
}