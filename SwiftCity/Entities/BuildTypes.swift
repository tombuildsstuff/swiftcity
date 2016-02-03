public struct BuildTypes {

    public let count : Int

    public let buildTypes: [BuildTypeLocator]

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
            let buildTypesDictionary = dictionary["buildType"] as? [[String: AnyObject]] else {
            return nil
        }

        let buildTypes = buildTypesDictionary.map { (dictionary: [String: AnyObject]) -> BuildTypeLocator? in
            return BuildTypeLocator(dictionary: dictionary)
        }.filter { (type: BuildTypeLocator?) -> Bool in
            return type != nil
        }.map { (type: BuildTypeLocator?) -> BuildTypeLocator in
            return type!
        }

        guard buildTypes.count == buildTypesDictionary.count else {
            return nil
        }

        self.count = count
        self.buildTypes = buildTypes
    }
}
