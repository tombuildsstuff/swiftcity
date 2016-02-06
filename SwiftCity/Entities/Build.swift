public struct Build {
    
    public let build : BuildSummary
    public let statusText: String
    public let buildType: ProjectLocator
    
    // TODO: proper dates..
    public let queuedDate: String
    public let startDate: String
    public let finishDate: String
    public let triggered: TriggeredBuild
    public let lastChanges: LastChanges?
    public let changes: Locator
    public let revisions: VCSRevisions
    public let artifacts: Locator
    public let relatedIssues: Locator
    public let agent : BuildAgentSummary
    public let properties: Parameters?
    public let statistics: Locator
    public let cancelledInfo: BuildCancellationInformation?
    
    init?(dictionary: [String: AnyObject]) {
        guard let build = BuildSummary(dictionary: dictionary),
            let statusText = dictionary["statusText"] as? String,
            let buildTypeDictionary = dictionary["buildType"] as? [String: AnyObject],
            let queuedDate = dictionary["queuedDate"] as? String,
            let startDate = dictionary["startDate"] as? String,
            let finishDate = dictionary["finishDate"] as? String,
            let triggeredBuildDictionary = dictionary["triggered"] as? [String: AnyObject],
            let triggeredBuild = TriggeredBuild(dictionary: triggeredBuildDictionary),
            let changesDictionary = dictionary["changes"] as? [String: AnyObject],
            let changes = Locator(dictionary: changesDictionary),
            
            let revisionsDictionary = dictionary["revisions"] as? [String: AnyObject],
            let revisions = VCSRevisions(dictionary: revisionsDictionary),
            let artifactsDictionary = dictionary["artifacts"] as? [String: AnyObject],
            let artifacts = Locator(dictionary: artifactsDictionary),
            let relatedIssuesDictionary = dictionary["relatedIssues"] as? [String: AnyObject],
            let relatedIssues = Locator(dictionary: relatedIssuesDictionary),
            let agentDictionary = dictionary["agent"] as? [String: AnyObject],
            let agent = BuildAgentSummary(dictionary: agentDictionary),
            let statisticsDictionary = dictionary["statistics"] as? [String: AnyObject],
            let statistics = Locator(dictionary: statisticsDictionary)
            else {
                return nil
        }
        
        self.build = build
        self.statusText = statusText
        self.buildType = ProjectLocator(dictionary: buildTypeDictionary)
        self.queuedDate = queuedDate
        self.startDate = startDate
        self.finishDate = finishDate
        self.triggered = triggeredBuild
        self.changes = changes
        self.revisions = revisions
        self.artifacts = artifacts
        self.relatedIssues = relatedIssues
        self.agent = agent
        self.statistics = statistics
        
        if let propertiesDictionary = dictionary["properties"] as? [String: AnyObject] {
            self.properties = Parameters(dictionary: propertiesDictionary)
        } else {
            self.properties = nil
        }
        
        if let lastChangesDictionary = dictionary["lastChanges"] as? [String: AnyObject] {
            self.lastChanges = LastChanges(dictionary: lastChangesDictionary)
        } else {
            self.lastChanges = nil
        }
        
        
        if let cancellationInfoDictionary = dictionary["canceledInfo"] as? [String: AnyObject] {
            self.cancelledInfo = BuildCancellationInformation(dictionary: cancellationInfoDictionary)
        } else {
            self.cancelledInfo = nil
        }
        
    }
}