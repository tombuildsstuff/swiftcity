public struct VCSRoots {

    public let count: Int
    public let href: String
    public let roots: [VCSRootSummary]?

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let href = dictionary["href"] as? String else {
            return nil
        }
        
        if let rootsDictionary = dictionary["vcs-root"] as? [[String: AnyObject]] {
            let roots = rootsDictionary.map({ (dictionary: [String: AnyObject]) -> VCSRootSummary? in
                return VCSRootSummary(dictionary: dictionary)
            }).filter({ (root: VCSRootSummary?) -> Bool in
                return root != nil
            }).map({ (root: VCSRootSummary?) -> VCSRootSummary in
                return root!
            })
            self.roots = roots
        }
        else {
            self.roots = nil
        }

        self.count = count
        self.href = href
    }

}