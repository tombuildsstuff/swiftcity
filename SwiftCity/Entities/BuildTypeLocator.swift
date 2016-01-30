struct BuildTypeLocator {

    let id : String
    let name : String
    let projectName: String
    let projectId: String
    let href: String
    let templateFlag : Bool
    let webUrl: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let projectName = dictionary["projectName"] as? String,
            let projectId = dictionary["projectId"] as? String,
            let href = dictionary["href"] as? String,
            let webUrl = dictionary["webUrl"] as? String
            else {
                return nil
        }
        
        let isTemplate = dictionary["templateFlag"] as? Bool ?? false
        
        self.id = id
        self.name = name
        self.projectName = projectName
        self.projectId = projectId
        self.href = href
        self.templateFlag = isTemplate
        self.webUrl = webUrl
    }

}