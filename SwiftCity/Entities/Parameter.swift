struct Parameter {
    let name : String
    let value : String
    let own : Bool
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary["name"] as? String,
              let value = dictionary["value"] as? String,
              let own = dictionary["own"] as? Bool
        else {
            return nil
        }
        
        // TODO: potentially could work out the type here?
        self.name = name
        self.value = value
        self.own = own
    }
}