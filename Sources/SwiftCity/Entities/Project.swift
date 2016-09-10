public struct Project {

    public let project : ProjectLocator
    public let parentProject : ProjectLocator?

    // NOTE: you might think this is odd these being nullable - but the TC API doesn't return the elements if you don't have the right permissions, so..
    public let buildTypes: BuildTypes?
    public let templates : BuildTypes?
    public let parameters : Parameters?
    public let vcsRoots : VCSRoots?
    public let projects: Projects?

    init?(dictionary: [String: AnyObject]) {
        self.project = ProjectLocator(dictionary: dictionary)

        func map<T>(_ dictionary: [String: AnyObject]?, builder: (_ dictionary: [String: AnyObject]) -> T?) -> T? {
            guard let properties = dictionary else {
                return nil
            }

            return builder(properties)
        }

        self.parentProject = map(dictionary["parentProject"] as? [String: AnyObject], builder: ProjectLocator.init)
        self.buildTypes = map(dictionary["buildTypes"] as? [String: AnyObject], builder: BuildTypes.init)
        self.templates = map(dictionary["templates"] as? [String: AnyObject], builder: BuildTypes.init)
        self.parameters = map(dictionary["parameters"] as? [String: AnyObject], builder: Parameters.init)
        self.vcsRoots = map(dictionary["vcsRoots"] as? [String: AnyObject], builder: VCSRoots.init)
        self.projects = map(dictionary["projects"] as? [String: AnyObject], builder: Projects.init)
    }
}
