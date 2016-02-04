public struct ServerInformation {

    public let version: String
    public let versionMajor: Int
    public let versionMinor: Int
    public let startTime: String
    public let currentTime: String
    public let buildNumber: String
    public let buildDate: String
    public let internalId: String
    public let webUrl: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let version = dictionary["version"] as? String,
              let versionMajor = dictionary["versionMajor"] as? Int,
              let versionMinor = dictionary["versionMinor"] as? Int,
              let startTime = dictionary["startTime"] as? String,
              let currentTime = dictionary["currentTime"] as? String,
              let buildNumber = dictionary["buildNumber"] as? String,
              let buildDate = dictionary["buildDate"] as? String,
              let internalId = dictionary["internalId"] as? String,
              let webUrl = dictionary["webUrl"] as? String else {
            return nil
        }
        
        self.version = version
        self.versionMajor = versionMajor
        self.versionMinor = versionMinor
        self.startTime = startTime
        self.currentTime = currentTime
        self.buildNumber = buildNumber
        self.buildDate = buildDate
        self.internalId = internalId
        self.webUrl = webUrl
    }
}