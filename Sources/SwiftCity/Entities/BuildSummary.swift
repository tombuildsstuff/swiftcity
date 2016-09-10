public struct BuildSummary {
    
    public let id: Int
    public let buildTypeId: String
    public let number: String
    public let status: String
    public let state: String
    public let branchName: String
    public let defaultBranch: Bool?
    public let href: String
    public let webUrl: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? Int,
            let buildTypeId = dictionary["buildTypeId"] as? String,
            let number = dictionary["number"] as? String,
            let status = dictionary["status"] as? String,
            let state = dictionary["state"] as? String,
            let branchName = dictionary["branchName"] as? String,
            let href = dictionary["href"] as? String,
            let webUrl = dictionary["webUrl"] as? String else {
                return nil
        }
        
        self.id = id
        self.buildTypeId = buildTypeId
        self.number = number
        self.status = status
        self.state = state
        self.branchName = branchName
        self.defaultBranch = dictionary["defaultBranch"] as? Bool
        self.href = href
        self.webUrl = webUrl
    }
    
}