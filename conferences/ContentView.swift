//
//  ContentView.swift
//  conferences
//
//  Created by Glenn Gijsberts on 21/08/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct ContentView: View {
    @ObservedObject private var conferencesData: ConferencesData = ConferencesData()
    
    var body: some View {
        List(conferencesData.conferences) { conference in
            Text(conference)
        }
    }
}

class ConferencesData: ObservableObject {
    @Published var conferences: [String]
    
    init() {
        print("loading data..")
        self.conferences = [String]()
        loadConferencesData()
    }
    
    func loadConferencesData() {
        Network.shared.apollo.fetch(query: ConferencesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                
                for conference in graphQLResult.data!.conferences {
                    for c in conference.resultMap {
                        if c.key == "name" && c.value != nil {
                            self.conferences.append(c.value as! String)
                        }
                    }
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
