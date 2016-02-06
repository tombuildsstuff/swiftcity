public struct Locator {

    public let href: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let href = dictionary["href"] as? String else {
            return nil
        }
        
        self.href = href
    }

}