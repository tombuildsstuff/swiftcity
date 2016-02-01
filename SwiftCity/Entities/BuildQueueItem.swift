struct BuildQueueItem {
    
    let id : Int
    let buildTypeId: String
    let state: String
    let href: String
    let webUrl: String
    
    let branchName: String?
    let defaultBranch: Bool?
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? Int,
            let buildTypeId = dictionary["buildTypeId"] as? String,
            let state = dictionary["state"] as? String,
            let href = dictionary["href"] as? String,
            let webUrl = dictionary["webUrl"] as? String else {
                return nil
        }
        
        self.id = id
        self.buildTypeId = buildTypeId
        self.state = state
        self.href = href
        self.webUrl = webUrl
        
        self.branchName = dictionary["branchName"] as? String
        self.defaultBranch = dictionary["defaultBranch"] as? Bool
    }
    
}