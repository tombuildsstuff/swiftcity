struct VCSRoots {
    
    let count: Int
    let href: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let href = dictionary["href"] as? String else {
            return nil
        }
        
        self.count = count
        self.href = href
    }
    
}