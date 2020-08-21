//
//  Network.swift
//  conferences
//
//  Created by Glenn Gijsberts on 21/08/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import CoreData
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.react-finland.fi/graphql")!)
}
