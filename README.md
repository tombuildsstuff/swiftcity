# SwiftCity
A TeamCity API Client written in Swift

This is a _Work-In-Progress_ - with more endpoints coming soon.
This project is inspired by [TeamCitySharp](https://github.com/stack72/teamcitysharp).

## Roadmap / To Do
- [x] Read-Only Endpoints:
  - [x] Builds
  - [x] Build Agents
  - [x] Build Agent Pools
  - [x] Build Queue
  - [x] Projects
  - [x] Server Information
  - [x] Users
  - [x] User Groups
  - [x] VCS Roots
- [ ] Editable Endpoints
  - [ ] Builds
  - [ ] Build Agents
  - [ ] Build Agent Pools
  - [ ] Build Queue
  - [ ] Projects
  - [ ] Users
  - [ ] User Groups
  - [ ] VCS Roots
- [ ] Proper Error Handling
- [ ] Integration Tests
- [x] Swift Package Manager support
- [x] Cocoapods support

## Licence
[MIT](http://tombuildsstuff.mit-license.org)

## Contributing
Send a pull request, ideally with tests :)

## Installing
We're using both Cocoapods and Swift Package Manager.

For Swift Package Manager - use:
```
import PackageDescription

let package = Package(
    name: "my-application",
    dependencies: [
        .Package(url: "https://github.com/tombuildsstuff/SwiftCity.git", majorVersion: 0, minor: 2)
    ]
)
```

For Cocoapods - use:
```
pod 'SwiftCity', '0.2'
```

## Documentation
_Be aware the TeamCity API provides fields based on permissions - so if you're not seeing a field which you expect, check this first.._

### Open A Connection (as the Guest User)
```
let connection = TeamCityConnection(server: "http://teamcity-server.example.com")
let client = TeamCityClient(connection: connection)
client.authenticate({ () -> () in
    print("Authenticated!")
}) { (error) -> () in
    print("Failed to Authenticate!")
}
```

### Open A Connection (as a named user)
```
let connection = TeamCityConnection(server: "http://teamcity-server.example.com", username: "username", password: "password")
let client = TeamCityClient(connection: connection)
client.authenticate({ () -> () in
    print("Authenticated!")
}) { (error) -> () in
    print("Failed to Authenticate!")
}
```

### List All Projects
```
client.allProjects({ (projects) -> () in
    print("Projects: \(projects)")
}) { (error: NSError) -> () in
    print("Projects Error: \(error)")
}
```

### Get Project By ID
```
client.projectById("Example", successful: { (project) -> () in
    print("Project: \(project)")
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### List All Build Configuration
```
client.allBuildTypes({ (types: BuildTypes) -> () in
    print(types)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### Build Configuration Details
```
client.buildTypesById("Example_BuildConfig", successful: { (type: BuildType) -> () in
    print(type)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### List the Build Queue
```
client.buildQueue({ (queue: BuildQueue) -> () in
    print(queue.queue)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### Retrieve the Server Information
```
client.serverInformation({ (info: ServerInformation) -> () in
    print(info)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### List All VCS Roots
```
client.allVcsRoots({ (roots: VCSRoots) -> () in
    print(roots)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### Retrieve a VCS Root by ID
```
client.vcsRootById("Puppet_Github", successful: { (root: VCSRoot?) -> () in
    print(root)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### List All Users
```
client.allUsers({ (users: Users) -> () in
    print(users)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### Retrieve a User by Username
```
client.userByName("example_api_user", successful: { (user: User?) -> () in
    print(user)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### Retrieve a User by ID
```
client.userById(2, successful: { (user: User?) -> () in
    print(user)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### List All Groups
```
client.allGroups({ (groups: Groups) -> () in
    print(groups)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### Retrieve a Group by Key
```
client.groupByKey("MIDDLE_GROUP", successful: { (group: Group?) -> () in
    print(group)
}) { (error:NSError) -> () in
    print("Error: \(error)")
}
```

### List All Build Agents
```
client.allBuildAgents({ (agents: BuildAgents) -> () in
    print(agents)
}) { (error:NSError) -> () in
    print("Error: \(error)")
}
```

### Retrieve a Build Agent by ID
```
client.buildAgentById(1, successful: { (agent: BuildAgent?) -> () in
    print(agent)
}) { (error:NSError) -> () in
    print("Error: \(error)")
}
```

### Retrieve a Build Agent by Name
```
client.buildAgentByName("tc-buildagent-01", successful: { (agent: BuildAgent?) -> () in
    print(agent)
}) { (error:NSError) -> () in
    print("Error: \(error)")
}
```

### List All Build Agent Pools
```
client.allBuildAgentPools({ (pools: BuildAgentPools) -> () in
    print(pools)
}) { (error: NSError) -> () in
    print(error)
}
```

### Retrieve a Build Agent Pool by ID
```
client.buildAgentPoolById(1, successful: { (agent: BuildAgentPool?) -> () in
    print(agent)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### List All Builds
```
let start = 10
let count = 10
client.allBuilds(start, count: count, successful: { (builds: Builds) -> () in
    print(builds)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```

### Retrieve a Build by ID
```
client.buildById(1561, successful: { (build: Build?) -> () in
    print(build)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
```
