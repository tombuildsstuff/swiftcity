struct Parameters {

    let count : Int
    let href : String?
    let properties : [Parameter]
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let count = dictionary["count"] as? Int,
              let propertiesDictionary = dictionary["property"] as? [[String: AnyObject]] else {
                return nil
        }
        
        let properties = propertiesDictionary.map { (dictionary: [String : AnyObject]) -> Parameter? in
            return Parameter(dictionary: dictionary)
        }.filter({ (param: Parameter?) -> Bool in
            return param != nil
        }).map { (param: Parameter?) -> Parameter in
            return param!
        }
        
        guard propertiesDictionary.count == properties.count else {
            return nil
        }
        
        let href = dictionary["href"] as? String
        
        self.count = count
        self.href = href
        self.properties = properties
    }

}