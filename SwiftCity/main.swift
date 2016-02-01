
//  main.swift
//  SwiftCity
//
//  Created by Tom Harvey on 30/01/2016.
//  Copyright © 2016 We Build Stuff. All rights reserved.
//

import Foundation

//let connection = TeamCityConnection(server: "http://172.16.85.129")
let connection = TeamCityConnection(server: "http://172.16.85.129", username: "example_api_user", password: "password")
let client = TeamCityClient(connection: connection)

/*
client.authenticate({ () -> () in
    print("Authenticated!")
}) { (error) -> () in
    print("Failed to Authenticate!")
}

client.allProjects({ (projects) -> () in
    print("Projects: \(projects)")
}) { (error: NSError) -> () in
    print("Projects Error: \(error)")
}

client.projectById("Example", successful: { (project) -> () in
    print("Project: \(project)")
}) { (error: NSError) -> () in
    print("Error: \(error)")
}

client.allBuildTypes({ (types: BuildTypes) -> () in
    print(types)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}
*/

client.buildTypesById("Example_BuildConfig", successful: { (type: BuildType) -> () in
    print(type)
}) { (error: NSError) -> () in
    print("Error: \(error)")
}

// as this is sync.. give the tasks a chance to complete..
sleep(10)
print("Done")