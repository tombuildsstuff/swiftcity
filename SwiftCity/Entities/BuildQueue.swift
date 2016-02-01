struct BuildQueue {
    
    let count : Int
    
    let href : String
    
    let queue : [BuildQueueItem]
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let href = dictionary["href"] as? String,
              let queueDictionary = dictionary["build"] as? [[String: AnyObject]]
        else {
            return nil
        }
        
        
        
        let queue = queueDictionary.map { (dictionary: [String : AnyObject]) -> BuildQueueItem? in
            return BuildQueueItem(dictionary: dictionary)
        }.filter { (item: BuildQueueItem?) -> Bool in
            return item != nil
        }.map { (item: BuildQueueItem?) -> BuildQueueItem in
            return item!
        }
        
        guard queue.count == queueDictionary.count else {
            return nil
        }
        
        self.count = count
        self.href = href
        self.queue = queue
    }
}

