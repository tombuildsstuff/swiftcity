public struct BuildFeatures {

    public let count: Int

    public let features: [BuildFeature]

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let featuresDictionary = dictionary["feature"] as? [[String: AnyObject]] else {
            return nil
        }

        let features = featuresDictionary.map { (dictionary: [String : AnyObject]) -> BuildFeature? in
            return BuildFeature(dictionary: dictionary)
        }.filter { (feature: BuildFeature?) -> Bool in
            return feature != nil
        }.map { (feature: BuildFeature?) -> BuildFeature in
            return feature!
        }

        guard features.count == featuresDictionary.count else {
            return nil
        }

        self.count = count
        self.features = features
    }

}
