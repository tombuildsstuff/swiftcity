public struct ServerInformation {

    let version: String
    let versionMajor: Int
    let versionMinor: Int
    let startTime: String
    let currentTime: String
    let buildNumber: String
    let buildDate: String
    let internalId: String
    let webUrl: String
    
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