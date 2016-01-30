//
//  TeamCityClient.swift
//  SwiftCity
//
//  Created by Tom Harvey on 30/01/2016.
//  Copyright © 2016 We Build Stuff. All rights reserved.
//

import Foundation

class TeamCityClient {
    
    let connection : ITeamCityConnection
    
    init(connection: ITeamCityConnection) {
        self.connection = connection
    }
    
    // TODO: the methods on this class should be classes - not extension methods..
}