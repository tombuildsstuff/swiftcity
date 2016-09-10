//
//  TeamCityClient.swift
//  SwiftCity
//
//  Created by Tom Harvey on 30/01/2016.
//  Copyright © 2016 We Build Stuff. All rights reserved.
//

import Foundation

public class TeamCityClient {

    public let connection : ITeamCityConnection

    public init(connection: ITeamCityConnection) {
        self.connection = connection
    }

    // TODO: the methods on this class should be classes - not extension methods..
}
