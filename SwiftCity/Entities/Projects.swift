public struct Projects {

    public let count : Int
    public let href : String?
    public let projects: [ProjectLocator]

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let projectsDictionary = dictionary["project"] as? [[String: AnyObject]]
            else {
            return nil
        }

        let href = dictionary["href"] as? String

        let projects = projectsDictionary.map { (dictionary: [String : AnyObject]) -> ProjectLocator in
            return ProjectLocator(dictionary: dictionary)
        }

        self.count = count
        self.href = href
        self.projects = projects
    }
}
