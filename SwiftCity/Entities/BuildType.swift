struct BuildType {
    
    let buildType : BuildTypeLocator
    let entries: VCSRootEntries?
    let settings: Parameters?
    let parameters: Parameters?
    let steps : BuildSteps?
    let features: BuildFeatures?
    
    init?(dictionary: [String: AnyObject]) {
        guard let locator = BuildTypeLocator(dictionary: dictionary) else {
            return nil
        }
        
        func map<T>(dictionary: [String: AnyObject]?, builder: (dictionary: [String: AnyObject]) -> T?) -> T? {
            guard let properties = dictionary else {
                return nil
            }
            
            return builder(dictionary: properties)
        }
        
        self.buildType = locator
        self.entries = map(dictionary["vcs-root-entries"] as? [String: AnyObject], builder: VCSRootEntries.init)
        self.settings = map(dictionary["settings"] as? [String: AnyObject], builder: Parameters.init)
        self.parameters = map(dictionary["parameters"] as? [String: AnyObject], builder: Parameters.init)
        self.steps = map(dictionary["steps"] as? [String: AnyObject], builder: BuildSteps.init)
        self.features = map(dictionary["features"] as? [String: AnyObject], builder: BuildFeatures.init)
    }
    
}