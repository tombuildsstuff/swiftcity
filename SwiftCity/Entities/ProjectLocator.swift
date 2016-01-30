struct ProjectLocator {

    let id : String
    let archived : Bool
    let description : String
    let href : String
    let name : String
    let webUrl : String
    
    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String ?? ""
        self.archived = dictionary["archived"] as? Bool ?? false
        self.description = dictionary["description"] as? String ?? ""
        self.href = dictionary["href"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.webUrl = dictionary["webUrl"] as? String ?? ""
    }

}
