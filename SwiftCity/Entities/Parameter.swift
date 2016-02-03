public struct Parameter {

    public let name : String
    public let value : String?
    public let own : Bool?

    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary["name"] as? String else {
            return nil
        }

        // TODO: potentially could work out the type here?
        self.name = name
        self.value = dictionary["value"] as? String
        self.own = dictionary["own"] as? Bool
    }

}
