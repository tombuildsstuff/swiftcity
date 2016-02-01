struct BuildTriggers {
    
    let count: Int
    let triggers: [BuildTrigger]

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let triggersDictionary = dictionary["trigger"] as? [[String: AnyObject]] else {
            return nil
        }
        
        let triggers = triggersDictionary.map { (dictionary: [String: AnyObject]) -> BuildTrigger? in
            return BuildTrigger(dictionary: dictionary)
        }.filter { (trigger: BuildTrigger?) -> Bool in
            return trigger != nil
        }.map { (trigger: BuildTrigger?) -> BuildTrigger in
            return trigger!
        }
        
        guard triggers.count == triggersDictionary.count else {
            return nil
        }
        
        self.count = count
        self.triggers = triggers
    }

}
