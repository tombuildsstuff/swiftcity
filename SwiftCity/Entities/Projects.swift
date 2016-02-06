public struct Projects {

    public let count : Int
    public let href : String?
    public let projects: [ProjectLocator]?

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int else {
            return nil
        }

        let href = dictionary["href"] as? String

        if let projectsDictionary = dictionary["project"] as? [[String: AnyObject]] {
            self.projects = projectsDictionary.map { (dictionary: [String : AnyObject]) -> ProjectLocator in
                return ProjectLocator(dictionary: dictionary)
            }
        }
        else {
            self.projects = nil
        }
        

        self.count = count
        self.href = href
    }
}
