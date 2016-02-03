public struct BuildSteps {

    public let count : Int

    public let steps: [BuildStepSummary]

    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["count"] as? Int,
              let stepsDictionary = dictionary["step"] as? [[String: AnyObject]] else {
            return nil
        }

        let steps = stepsDictionary.map { (dictionary: [String : AnyObject]) -> BuildStepSummary? in
            return BuildStepSummary(dictionary: dictionary)
        }.filter { (step: BuildStepSummary?) -> Bool in
            return step != nil
        }.map { (step: BuildStepSummary?) -> BuildStepSummary in
            return step!
        }

        guard steps.count == stepsDictionary.count else {
            return nil
        }

        self.count = count
        self.steps = steps
    }

}
