public struct BuildStepSummary {

    public let id : String
    public let name : String
    public let type : String
    public let properties : Parameters

    init?(dictionary: [String: AnyObject]) {

        guard let id = dictionary["id"] as? String,
              let name = dictionary["name"] as? String,
              let type = dictionary["type"] as? String,
              let propertiesDictionary = dictionary["properties"] as? [String: AnyObject],
              let properties = Parameters(dictionary: propertiesDictionary) else {
            return nil
        }

        self.id = id
        self.name = name
        self.type = type
        self.properties = properties
    }

}
