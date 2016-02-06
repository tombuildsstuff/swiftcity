public struct Builds {
    
    public let count: Int
    public let href: String
    public let nextHref: String
    public let builds: [BuildSummary]?
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let href = dictionary["href"] as? String,
            let nextHref = dictionary["nextHref"] as? String else {
                return nil
        }
        
        if let buildsDictionary = dictionary["build"] as? [[String: AnyObject]] {
            self.builds = buildsDictionary.map({ (dictionary: [String: AnyObject]) -> BuildSummary? in
                return BuildSummary(dictionary: dictionary)
            }).filter({ (summary: BuildSummary?) -> Bool in
                return summary != nil
            }).map({ (summary: BuildSummary?) -> BuildSummary in
                return summary!
            })
        } else {
            self.builds = nil
        }
        
        self.count = count
        self.href = href
        self.nextHref = nextHref
    }
    
}
