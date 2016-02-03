struct BuildQueue {
    
    let count : Int
    
    let href : String
    
    let queue : [BuildQueueItem]?
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let href = dictionary["href"] as? String
        else {
            return nil
        }
        
        if let queueDictionary = dictionary["build"] as? [[String: AnyObject]] {
            let queue = queueDictionary.map { (dictionary: [String : AnyObject]) -> BuildQueueItem? in
                return BuildQueueItem(dictionary: dictionary)
            }.filter { (item: BuildQueueItem?) -> Bool in
                return item != nil
            }.map { (item: BuildQueueItem?) -> BuildQueueItem in
                return item!
            }
            
            guard count > 0 && queue.count == queueDictionary.count else {
                return nil
            }
            
            self.queue = queue
        }
        else
        {
            self.queue = nil
        }
        
        self.count = count
        self.href = href
    }
}

