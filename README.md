# SwiftCity
A TeamCity API Client written in Swift

This is a _Work-In-Progress_ - with more endpoints coming soon.
This project is inspired by [TeamCitySharp](https://github.com/stack72/teamcitysharp).

## To Do
- [ ] Read-Only Endpoints:
  - [ ] Builds
  - [ ] Build Agents
  - [ ] Build Agent Pools
  - [x] Build Queue
  - [x] Projects
  - [ ] Server Details
  - [ ] Users
  - [ ] User Groups
  - [ ] VCS Roots
- [ ] Editable Endpoints
  - [ ] Builds
  - [ ] Build Agents
  - [ ] Build Agent Pools
  - [ ] Build Queue
  - [ ] Projects
  - [ ] Users
  - [ ] User Groups
  - [ ] VCS Roots
- [ ] Integration Tests
- [ ] Swift Package Manager support
- [x] Cocoapods support

## Licence
[MIT](http://tombuildsstuff.mit-license.org)

## Contributing
Send a pull request, ideally with tests :)

## Installing
We're using Cocoapods - so just:
```
pod 'SwiftCity', '0.0.1'
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
