struct BuildType {
    
    let agentRequirements: AgentRequirements?
    let artifactDependencies: ArtifactDependencies?
    let buildType : BuildTypeLocator
    let entries: VCSRootEntries?
    let features: BuildFeatures?
    let parameters: Parameters?
    let settings: Parameters?
    let snapshotDependencies: SnapshotDependencies?
    let steps : BuildSteps?
    let triggers: BuildTriggers?

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
        
        self.agentRequirements = map(dictionary["agent-requirements"] as? [String: AnyObject], builder: AgentRequirements.init)
        self.artifactDependencies = map(dictionary["artifact-dependencies"] as? [String: AnyObject], builder: ArtifactDependencies.init)
        self.buildType = locator
        self.entries = map(dictionary["vcs-root-entries"] as? [String: AnyObject], builder: VCSRootEntries.init)
        self.features = map(dictionary["features"] as? [String: AnyObject], builder: BuildFeatures.init)
        self.parameters = map(dictionary["parameters"] as? [String: AnyObject], builder: Parameters.init)
        self.settings = map(dictionary["settings"] as? [String: AnyObject], builder: Parameters.init)
        self.snapshotDependencies = map(dictionary["snapshot-dependencies"] as? [String: AnyObject], builder: SnapshotDependencies.init)
        self.steps = map(dictionary["steps"] as? [String: AnyObject], builder: BuildSteps.init)
        self.triggers = map(dictionary["triggers"] as? [String: AnyObject], builder: BuildTriggers.init)
        
    }
    
}