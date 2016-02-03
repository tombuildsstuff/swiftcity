public struct ProjectLocator {

    public let id : String
    public let archived : Bool
    public let description : String
    public let href : String
    public let name : String
    public let webUrl : String

    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String ?? ""
        self.archived = dictionary["archived"] as? Bool ?? false
        self.description = dictionary["description"] as? String ?? ""
        self.href = dictionary["href"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.webUrl = dictionary["webUrl"] as? String ?? ""
    }

}
